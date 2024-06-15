/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package Main;

import Dao.FoodDao;
import Model.Food;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        FoodDao foodDao = new FoodDao();

        // Tìm kiếm thức ăn theo tên
        List<Food> foodsByName = foodDao.searchFoodByName("Pizza");
        System.out.println("Kết quả tìm kiếm theo tên:");
        for (Food food : foodsByName) {
            System.out.println(food.getName() + " - " + food.getPrice());
        }

        // Tìm kiếm thức ăn theo loại
        List<Food> foodsByCategory = foodDao.searchFoodByCategory(1); // Giả sử CateID = 1 là loại bạn muốn tìm
        System.out.println("Kết quả tìm kiếm theo loại:");
        for (Food food : foodsByCategory) {
            System.out.println(food.getName() + " - " + food.getPrice());
        }
    }
}
