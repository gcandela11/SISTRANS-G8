-- CREATE A SEQUENCE
CREATE SEQUENCE seq START WITH 100 INCREMENT BY 1;

-- CREATE ROLES TABLE
CREATE TABLE user_roles
(
    id        INT PRIMARY KEY NOT NULL,
    role_name VARCHAR(50)     NOT NULL
);

-- CREATE A USER TABLE
CREATE TABLE users
(
    id             INT PRIMARY KEY    NOT NULL,
    id_type        VARCHAR(2)         NOT NULL,
    identification VARCHAR(255) UNIQUE NOT NULL,
    email          VARCHAR(255) UNIQUE NOT NULL,
    password       VARCHAR(100)       NOT NULL,
    user_role_id   INT                NOT NULL,
    name           VARCHAR(255)        NOT NULL,
    nationality    VARCHAR(255)        NOT NULL,
    address        VARCHAR(255)        NOT NULL,
    phone          VARCHAR(255)        NOT NULL,
    city           VARCHAR(255)        NOT NULL,
    region         VARCHAR(255)        NOT NULL,
    postal_code    VARCHAR(255)        NOT NULL,
    constraint unique_identification UNIQUE (id_type, identification),
    constraint user_role_foreign foreign key (user_role_id) references user_roles (id)
);

-- CREATE AN OFFICE TABLE
CREATE TABLE offices
(
    id          INT PRIMARY KEY NOT NULL,
    name        VARCHAR(255)     NOT NULL,
    address     VARCHAR(255)     NOT NULL,
    city        VARCHAR(255)     NOT NULL,
    region      VARCHAR(255)     NOT NULL,
    postal_code VARCHAR(255)     NOT NULL,
    max_points  INT             NOT NULL,
    manager_id  INT             NOT NULL,
    constraint office_manager_foreign foreign key (manager_id) references users (id)
);

-- CREATE SERVICE POINTS

CREATE TABLE service_points(
  id INT PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL,
    office_id INT ,
    employee_id INT,
    type VARCHAR(255) NOT NULL,
    CONSTRAINT check_type CHECK ( type IN ('PHYSICAL', 'DIGITAL')),
    FOREIGN KEY (office_id) REFERENCES offices (id) ON DELETE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES users (id) ON DELETE CASCADE
);

-- CREATE AN ACCOUNT
CREATE SEQUENCE seq_accounts START WITH 1000 INCREMENT BY 1;

CREATE TABLE accounts
(
    id          INT PRIMARY KEY NOT NULL,
    account_number VARCHAR(255) UNIQUE NOT NULL,
    balance     DECIMAL(10, 2) NOT NULL,
    last_transaction TIMESTAMP NOT NULL,
    state      VARCHAR(255) NOT NULL,
    user_id     INT NOT NULL,
    office_id   INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    FOREIGN KEY (office_id) REFERENCES offices (id) ON DELETE CASCADE,
    CONSTRAINT check_state CHECK ( state IN ('ACTIVE', 'INACTIVE'))
);

commit;



