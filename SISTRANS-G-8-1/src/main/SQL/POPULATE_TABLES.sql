DELETE FROM service_points;
DELETE FROM offices;
DELETE FROM users;
DELETE FROM user_roles;

-- CREATE ROLES (cliente, cajero, gerente de oficina, o gerente general)
INSERT INTO user_roles (id, role_name) values (1, 'ADMIN');
INSERT INTO user_roles (id, role_name) values (2, 'CLIENTE');
INSERT INTO user_roles (id, role_name) values (3, 'CAJERO');
INSERT INTO user_roles (id, role_name) values (4, 'GERENTE DE OFICINA');
INSERT INTO user_roles (id, role_name) values (5, 'GERENTE GENERAL');

-- CREATE A USER
INSERT INTO users (id,name,user_role_id, id_type, identification, email, password, nationality, address, phone, city, region, postal_code) values ( 1, 'ADMIN',1,'CC', '9999999999', 'admin@domain.com', 'password',  'Colombian', 'Calle 123', '123456789', 'Bogota', 'Cundinamarca', '110111');

-- HACER DOS GERENTES DE OFICINA
INSERT INTO users (id, name, user_role_id, id_type, identification, email, password, nationality, address, phone, city, region, postal_code)
VALUES (2, 'GERENTE DE OF 1', 4, 'CC', '345678901', 'gerenteOficina@domain.com', 'password', 'Colombian', 'Calle 345', '345678901', 'Bogota', 'Cundinamarca', '110113');

INSERT INTO users (id, name, user_role_id, id_type, identification, email, password, nationality, address, phone, city, region, postal_code)
VALUES (3, 'GERENTE DE OF 2', 4, 'CC', '345678902', 'gerenteOficina2@domain.com', 'password', 'Colombian', 'Calle 345', '345678902', 'Bogota', 'Cundinamarca', '110113');


INSERT INTO users (id, id_type, identification, email, password, user_role_id, name, nationality, address, phone, city, region, postal_code) values ( 4, 'CC', '123456789', 'email@domain.com', 'password', 2, 'cliente man', 'Colombian', 'Calle 123', '123456789', 'Bogota', 'Cundinamarca', '110111');
INSERT INTO users (id, id_type, identification, email, password, user_role_id, name, nationality, address, phone, city, region, postal_code)
VALUES (5, 'CC', '123456782', 'cliente@domain.com', 'password', 2, 'Cliente Man2', 'Colombian', 'Calle 123', '123456789', 'Bogota', 'Cundinamarca', '110111');

INSERT INTO users (id, id_type, identification, email, password, user_role_id, name, nationality, address, phone, city, region, postal_code)
VALUES (6, 'CC', '234567890', 'cajero@domain.com', 'password', 3, 'Cajero Man', 'Colombian', 'Calle 234', '234567890', 'Bogota', 'Cundinamarca', '110112');

INSERT INTO users (id, id_type, identification, email, password, user_role_id, name, nationality, address, phone, city, region, postal_code)
VALUES (7, 'CC', '234567490', 'cajero2@domain.com', 'password', 3, 'Cajero Man 2', 'Colombian', 'Calle 235', '234567892', 'Bogota', 'Cundinamarca', '110112');


INSERT INTO users (id, id_type, identification, email, password, user_role_id, name, nationality, address, phone, city, region, postal_code)
VALUES (8, 'CC', '456789012', 'gerenteGeneral@domain.com', 'password', 5, 'Gerente General Man', 'Colombian', 'Calle 456', '456789012', 'Bogota', 'Cundinamarca', '110114');

INSERT INTO OFFICES (id, name, address, city, region, postal_code, max_points, manager_id) VALUES (1, 'Oficina 1', 'Calle 123', 'Bogota', 'Cundinamarca', '110111', 100, 2);

INSERT INTO OFFICES (id, name, address, city, region, postal_code, max_points, manager_id) VALUES (2, 'Oficina 2', 'Calle 123', 'Bogota', 'Cundinamarca', '110111', 100, 3);

INSERT INTO SERVICE_POINTS (id,name, office_id, employee_id, type) VALUES (1, 'PT. # 1', 1, 6, 'PHYSICAL');

INSERT INTO SERVICE_POINTS (id,name, office_id, employee_id, type) VALUES (2, 'PT. # 2', 2, 7, 'PHYSICAL');

INSERT INTO SERVICE_POINTS (id,name, type) VALUES (3, 'APP WEB',  'DIGITAL');

INSERT INTO SERVICE_POINTS (id,name, type) VALUES (4, 'APP MOVIL',  'DIGITAL');

INSERT INTO SERVICE_POINTS (id,name, type) VALUES (5, 'APP MOVIL',  'DIGITAL');

INSERT INTO SERVICE_POINTS (id,name, type) VALUES (6, 'PUNTO DE ATENCIÓN POR TELÉFONO',  'DIGITAL');

commit;