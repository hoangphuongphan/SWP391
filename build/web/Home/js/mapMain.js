const { GetPlaceCommand, LocationClient, SearchPlaceIndexForSuggestionsCommand, SearchPlaceIndexForTextCommand } = amazonLocationClient;

// Amazon Location Service Resources:
const apiKey = "v1.public.eyJqdGkiOiI0M2YyZTg3MC02N2ViLTQzN2EtYmNhNi0zNWY0ZmVlNjkxY2EifTzUHbQW5qDldTeksVEBz0CvbMuPSk0PRfBIsg7uWsOAgR5KC16dZw_XwFnof211x_Ug-XkZpkOWWqdgIsIQY27pFvvBSbcUlPbL13HB998LKpv-XvmvmAWtpN0CEuR2D6UwJ-Y6pghpOMq7aTmjZqLsUgtCBA1iTYA6IlUFaLUm0vHBwLIn8lDkTXmK8K7SlYIHt3LwYymFgY-vIYrmF8A8vUKyU-dD8OrkoHNC47yHpZevUcN3WzNOQD080MAFz23R2WR58EuKxoI6IvuHE_GuCpPm1vpYl3ujljRDEsm88sMFg3FHoFx2xvobe_rYiNFWpMSPhHkYIqi4uCn-qYk.MzRjYzZmZGUtZmY3NC00NDZiLWJiMTktNTc4YjUxYTFlOGZi";
const mapName = "GrabDemoMap";
const placeIndex = "GrabDemoPlaceIndex";
const region = "ap-southeast-1";

// Add Geocoder control to the map via callbacks that are called by maplibre-gl-geocoder.
// forwardGeocode: required for geocoding (Amazon Location SearchPlaceIndexForText API)
// getSuggestions + searchByPlaceId: required for autosugget (Amazon Location SearchPlaceIndexForSuggestions + GetPlace APIs)
async function addGeocoder(map, authHelper, client) {
  const amazonLocationGeocoderApi = {
    forwardGeocode: async (config) => {
      try {
        // Set up command to call SearchPlaceIndexForText API
        const { Results } = await client.send(new SearchPlaceIndexForTextCommand({
          IndexName: placeIndex,
          Text: config.query
        }));

        // Convert the results to Carmen GeoJSON to be returned to the MapLibre Geocoder
        const features = Results.map((result) => ({
          type: 'Feature',
          geometry: {
            type: 'Point',
            coordinates: result.Place.Geometry.Point,
          },
          place_name: result.Place.Label,
          properties: {
            id: result.Place.PlaceId,
          },
          text: result.Place.Label,
          place_type: ['place'],
          center: result.Place.Geometry.Point,
        }));

        return { features };
      } catch (error) {
        console.error(`Failed to forwardGeocode with error: ${error}`);
      }
    },
    getSuggestions: async (config) => {
      try {
        // Set up a command to call SearchPlaceIndexForSuggestions API;
        const { Results } = await client.send(new SearchPlaceIndexForSuggestionsCommand({
          IndexName: placeIndex,
          Text: config.query
        }));
        // Iterate over data.Results and return all suggestions and their place ids
        const suggestions = Results.map((result) => ({
          text: result.Text,
          placeId: result.PlaceId,
        }));
        
        return { suggestions };
      } catch (error) {
        console.error(`Failed to getSuggestions with error: ${error}`);
      }
    },
    searchByPlaceId: async (config) => {
      try {
        // Set up command to call GetPlace API with a place Id of a selected suggestion
        const { Place } = await client.send(new GetPlaceCommand({
          IndexName: placeIndex,
          PlaceId: config.query,
        }));

        const place = {
          type: 'Feature',
          geometry: {
            type: 'Point',
            coordinates: Place.Geometry.Point,
          },
          place_name: Place.Label,
          text: Place.Label,
          center: Place.Geometry.Point,
        };
        
        return { place };
      } catch (error) {
        console.error(`Failed to searchByPlaceId with error: ${error}`);
      }
    },
  };

  // Add Geocoder control to the map
  const geocoder = new MaplibreGeocoder(amazonLocationGeocoderApi, { maplibregl, showResultsWhileTyping: true });
  map.addControl(geocoder);

  // Update input field with geocoder's search value
  geocoder.on('result', function(e) {
    document.getElementById('location-input').value = e.result.text;
  });
}

// Initialize a map
async function initializeMap() {
  const map = new maplibregl.Map({
    container: 'map', // HTML element ID of map element
    center: [108.2068, 16.0471], // Initial map centerpoint
    zoom: 16, // Initial map zoom
    style: `https://maps.geo.${region}.amazonaws.com/maps/v0/maps/${mapName}/style-descriptor?key=${apiKey}`, // Defines the appearance of the map and authenticates using an API key
  });

  // Add navigation control to the top left of the map
  map.addControl(new maplibregl.NavigationControl(), 'top-left');

  return map;
}

async function main() {
  // Create an authentication helper instance using an API key
  const authHelper = await amazonLocationAuthHelper.withAPIKey(apiKey);
  const client = new LocationClient({
    region,
    ...authHelper.getLocationClientConfig(), // Provides configuration required to make requests to Amazon Location
  });

  // Initialize map and add a geocoder to it.
  const map = await initializeMap();
  addGeocoder(map, authHelper, client);
}

main();
