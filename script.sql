-- Criação das tabelas FarmTech

DROP TABLE IF EXISTS Sensor;
CREATE TABLE Sensor (
    sensor_id    INT PRIMARY KEY,
    tipo_sensor  VARCHAR(50) NOT NULL,
    localizacao  VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS Cultura;
CREATE TABLE Cultura (
    cultura_id        INT PRIMARY KEY,
    nome               VARCHAR(50) NOT NULL,
    ph_ideal_min      DOUBLE       NOT NULL,
    ph_ideal_max      DOUBLE       NOT NULL,
    umidade_ideal_min DOUBLE       NOT NULL,
    umidade_ideal_max DOUBLE       NOT NULL
);

DROP TABLE IF EXISTS Plantacao;
CREATE TABLE Plantacao (
    plantacao_id INT PRIMARY KEY,
    localizacao  VARCHAR(100) NOT NULL,
    cultura_id   INT NOT NULL,
    FOREIGN KEY (cultura_id) REFERENCES Cultura(cultura_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

DROP TABLE IF EXISTS Leitura;
CREATE TABLE Leitura (
    leitura_id  INT PRIMARY KEY,
    data_hora   DATETIME NOT NULL,
    valor       DOUBLE   NOT NULL,
    unidade     VARCHAR(20) NOT NULL,
    sensor_id   INT NOT NULL,
    FOREIGN KEY (sensor_id) REFERENCES Sensor(sensor_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

DROP TABLE IF EXISTS AjusteAplicacao;
CREATE TABLE AjusteAplicacao (
    ajuste_id    INT PRIMARY KEY,
    tipo_ajuste  VARCHAR(30) NOT NULL,
    quantidade   DOUBLE NOT NULL,
    unidade      VARCHAR(20) NOT NULL,
    data_hora    DATETIME NOT NULL,
    plantacao_id INT NOT NULL,
    FOREIGN KEY (plantacao_id) REFERENCES Plantacao(plantacao_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
);
