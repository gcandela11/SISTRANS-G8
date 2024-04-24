CREATE TABLE Registro
(
    login         VARCHAR2(50)  NOT NULL,
    contrasena    VARCHAR2(50)  NOT NULL,
    tipoDocumento VARCHAR2(20)  NOT NULL,
    documento     VARCHAR2(20)  NOT NULL,
    nombre        VARCHAR2(100) NOT NULL,
    nacionalidad  VARCHAR2(50),
    direccion     VARCHAR2(200),
    correo        VARCHAR2(100) UNIQUE,
    telefono      VARCHAR2(20),
    ciudad        VARCHAR2(50),
    departamento  VARCHAR2(50),
    codigoPostal  VARCHAR2(10),
    PRIMARY KEY (tipoDocumento, documento)
);
CREATE TABLE Cliente
(
    tipoCliente VARCHAR2(20) NOT NULL,
    idCliente   NUMBER       NOT NULL,
    FOREIGN KEY (tipoDocumento, documento) REFERENCES Usuario (tipoDocumento, documento)
);

CREATE TABLE Usuario
(
    login       VARCHAR2(50) NOT NULL,
    contrasena  VARCHAR2(50) NOT NULL,
    tipoUsuario VARCHAR2(20) NOT NULL,
);

CREATE TABLE GeneroGeneral
(
    id NUMBER PRIMARY KEY
);

CREATE TABLE GeneroOficina
(
    id NUMBER PRIMARY KEY
);
CREATE TABLE Cajero
(
    id NUMBER PRIMARY KEY
);
CREATE TABLE OperacionesBancarias
(
    tipoOperacion  VARCHAR2(20) NOT NULL,
    producto       VARCHAR2(20) NOT NULL,
    puestoAtencion VARCHAR2(20) NOT NULL,
    idOperacion    VARCHAR2(20) NOT NULL,
    fechaHora      DATE,
    monto          FLOAT,
    PRIMARY KEY (fechaHora, monto)
);
CREATE TABLE Cliente
(
    tipoCliente VARCHAR2(20) NOT NULL,
    idCliente   NUMBER       NOT NULL,
    PRIMARY KEY (idCliente)
);
CREATE TABLE Cuenta
(
    NumeroCuenta  NUMBER PRIMARY KEY,
    tipoCuenta    VARCHAR2(20) NOT NULL,
    estadoCuenta  VARCHAR2(20) NOT NULL,
    tipoDocumento VARCHAR2(20) NOT NULL,
    documento     VARCHAR2(20) NOT NULL,
    FOREIGN KEY (tipoDocumento, documento) REFERENCES Cliente (tipoDocumento, documento)
);
CREATE TABLE TipoCuenta
(
    nroCuentaCCorriente VARCHAR2(20) NOT NULL,
    estado              VARCHAR2(10),
    ahorros             VARCHAR2(10),
    corriente           VARCHAR2(10),
    PRIMARY KEY (nroCuentaCCorriente)
);
CREATE TABLE AhorroCuenta
(
    nroCuentaCAhorros VARCHAR2(20) NOT NULL,
    estado            VARCHAR2(10),
    PRIMARY KEY (nroCuentaCAhorros)
);
CREATE TABLE TarjetaCredito
(
    idTarjetaCredito   NUMBER,
    nroTarjetaTCredito VARCHAR2(20) NOT NULL,
    PRIMARY KEY (nroTarjetaTCredito)
);
CREATE TABLE PrestamoPersonal
(
    nroPrestamoPersonal VARCHAR2(20) NOT NULL,
    PRIMARY KEY (nroPrestamoPersonal)
);
CREATE TABLE SeguroVidaRiesgo
(
    idSeguroVidaRiesgo NUMBER,
    polizaNroSVRiesgo  VARCHAR2(20) NOT NULL,
    PRIMARY KEY (polizaNroSVRiesgo)
);
CREATE TABLE SeguroViviendaIncendioRoboHogar
(
    idSeguroViviendaIncendioRoboHogar NUMBER,
    polizaNroSViviendaIRHogar         VARCHAR2(20) NOT NULL,
    PRIMARY KEY (polizaNroSViviendaIRHogar)
        CREATE TABLE TransferirDinero (
        idTransferencia NUMBER,
        fecha VARCHAR2 (20) NOT NULL,
        numeroCuenta VARCHAR2 (20) NOT NULL,
        hora VARCHAR2 (20) NOT NULL,
        valor NUMBER NOT NULL,
        banco VARCHAR2 (20) NOT NULL,
        PRIMARY KEY (idTransferencia)

        )
);