CREATE DATABASE db_test;
use db_test;
show tables;
shoq triggers from db_test;
select * from tb_users;
select * from tb_logs;

select user,host from mysql.user where host="%";

select
    FROM_USER AS Rol,
    FROM_HOST AS Rol,
    TO_USER AS Usuario,
    TO_HOST AS Host_usuario
FROM mysql.role_edges 
order by FROM_USER, TO_USER;
   