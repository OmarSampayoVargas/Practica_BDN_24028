/* Creacion de usuarios nuevos*/
create user 'nombre.apellido'@'%' identified by 'matricula';
create user 'marco.ramirez'@'%' identified by 'qwerty1234';
create user 'omar.sampayo'@'%' identified by '240428';
create user 'ivan.macin'@'%' identified by 'qwerty123';
create user 'hector.morales'@'%' identified by 'qwerty12';

/* creacion de privilegios*/
grant all privileges on *.* to 'omar.sampayo'@'%' with grant option;

/*¨creacion de roles para los usuarios*/
create role 'admin';
create role 'seller';
create role 'buyer';
create role 'common_user'
create role 'user_not_registered';
create role 'support';

/* asignar privlegios a los roles creados*/
-- admin
grant all privileges on db_testtt.* to 'admin';
-- suport
grant select, insert, update, db.testtt.tb_users to 'support';

/* asignar rol a usuarios*/
grant 'admin' to 'marco.ramirez'@'%';
grant 'suport' to 'hector.morales'@'%';

