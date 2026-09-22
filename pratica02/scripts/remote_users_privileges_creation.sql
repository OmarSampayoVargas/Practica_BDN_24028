/* ============================================================
   CREACIÓN DE USUARIOS REMOTOS
   ============================================================ */

CREATE USER IF NOT EXISTS 'marco.ramirez'@'%'
IDENTIFIED BY 'qwerty123';

CREATE USER IF NOT EXISTS 'omar.sampayo'@'%'
IDENTIFIED BY '240428';

CREATE USER IF NOT EXISTS 'lalo.mayate'@'%'
IDENTIFIED BY '240726';

CREATE USER IF NOT EXISTS 'erick.uriel'@'%'
IDENTIFIED BY '240435';

CREATE USER IF NOT EXISTS 'uriel.leonardo'@'%'
IDENTIFIED BY '24063';

CREATE USER IF NOT EXISTS 'saul.saul'@'%'
IDENTIFIED BY '240196';


/* ============================================================
   ASIGNACIÓN DE PRIVILEGIOS DIRECTOS
   ============================================================ */

/*
IMPORTANTE:
Este privilegio solamente debe asignarse al usuario administrador.
*/

GRANT ALL PRIVILEGES ON *.*
TO 'omar.sampayo'@'%';


/*
Asignar privilegios CRUD sobre la base db_test_7b.
*/

GRANT SELECT, INSERT, UPDATE, DELETE
ON db_test.*
TO 'erick.uriel'@'%';


/* ============================================================
   CREACIÓN DE ROLES PARA EL SISTEMA E-COMMERCE
   ============================================================ */

CREATE ROLE IF NOT EXISTS 'superadmin';
CREATE ROLE IF NOT EXISTS 'admin';
CREATE ROLE IF NOT EXISTS 'seller';
CREATE ROLE IF NOT EXISTS 'buyer';
CREATE ROLE IF NOT EXISTS 'support';
CREATE ROLE IF NOT EXISTS 'common';
CREATE ROLE IF NOT EXISTS 'user_not_registered';


/* ============================================================
   ASIGNACIÓN DE PRIVILEGIOS A LOS ROLES
   ============================================================ */

/* SUPERADMIN */
GRANT ALL PRIVILEGES
ON *.*
TO 'superadmin';    

/* ADMIN */
GRANT ALL PRIVILEGES
ON db_test.*
TO 'admin';


/* SUPPORT */
GRANT SELECT, INSERT, UPDATE
ON db_test.tb_users
TO 'support';

GRANT SELECT, INSERT, UPDATE
ON db_test.productos
TO 'support';

/* SELLER */
GRANT SELECT, INSERT, UPDATE
ON db_test.productos
TO 'seller';

/* ============================================================
   ASIGNACIÓN DE ROLES A LOS USUARIOS
   ============================================================ */

-- Este deben ser ustedes
GRANT 'superadmin'
TO 'omar.sampayo'@'%';

-- Este debe ser el Prof. Marco
GRANT 'admin'
TO 'marco.ramirez'@'%';

-- IZQUIERDA
GRANT 'support'
TO 'lalo.mayate'@'%';

-- DERECHA
GRANT 'seller'
TO 'erick.uriel'@'%';

GRANT 'seller'
TO 'uriel.leonardo'@'%';

/* ============================================================
   ESTABLECER ROLES PREDETERMINADOS
   ============================================================ */

/*
Esto permite que el rol se active automáticamente cuando
el usuario inicia sesión.
*/

SET DEFAULT ROLE 'admin'
TO 'marco.ramirez'@'%';

SET DEFAULT ROLE 'support'
TO 'lalo.mayate'@'%';

SET DEFAULT ROLE 'seller'
TO 'erick.uriel'@'%';
SET DEFAULT ROLE 'seller'
TO 'uriel.leonardo'@'%';


/* ============================================================
   VERIFICACIÓN
   ============================================================ */

/* Mostrar usuarios remotos creados */
SELECT "Los usuarios y privilegios han sido creados correctamente" AS mensaje;





