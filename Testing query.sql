select * from Users as A join UserAccount as B on A.UserID = B.UserID join Account as C on B.AccountID = C.AccountID where Email = 'phoangphuong309@gmail.com'

select * from Account
select * from Users

select * from Food
select * from Shop
select * from Category

insert into Account values ('sunheophp','123456','User')
insert into Users values ('Phuong','0914020508','phoangphuong309@gmail.com',null)
insert into UserAccount values (1,1)

insert into Shop values('Do an ez','0914020508','123 Tran Quoc Toan','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlpG_W0_vkgg7YXKu_ENAQgBaFqh-kqpaGuA&s')
insert into Category values('Do an vat')
insert into Food values(1,1, 20000,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnbmkhQSim64h2vJzu939EAZM8KjeFAp31bw&s','banh trang tron')
