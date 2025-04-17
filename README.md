# projeto-farmtech

## 🧬 Modelo Entidade-Relacionamento (MER)

### 📌 Objetivo
Armazenar e analisar dados de sensores agrícolas, auxiliando no monitoramento de plantações e na tomada de decisão de irrigação e aplicação de nutrientes.

---

### 🟢 Entidades e Atributos

#### 📍 Sensor
| Atributo     | Tipo            | Descrição                       |
|--------------|-----------------|---------------------------------|
| sensor_id    | INTEGER (PK)    | Identificador único do sensor   |
| tipo_sensor  | VARCHAR(50)     | Umidade, pH ou Nutrientes       |
| localizacao  | VARCHAR(100)    | Local onde o sensor está        |

#### 📍 Leitura
| Atributo     | Tipo            | Descrição                                |
|--------------|-----------------|------------------------------------------|
| leitura_id   | INTEGER (PK)    | Identificador único da leitura           |
| data_hora    | DATETIME        | Data e hora da leitura                   |
| valor        | DOUBLE          | Valor da leitura (ex: 23.5, 6.8, etc.)   |
| unidade      | VARCHAR(20)     | Unidade de medida (% / ppm / etc.)       |
| sensor_id    | INTEGER (FK)    | FK → Sensor                              |

#### 📍 Cultura
| Atributo            | Tipo            | Descrição                           |
|---------------------|-----------------|-------------------------------------|
| cultura_id          | INTEGER (PK)    | Identificador da cultura            |
| nome                | VARCHAR(50)     | Nome da cultura (milho, soja, etc.)|
| ph_ideal_min        | DOUBLE          | Valor mínimo de pH ideal            |
| ph_ideal_max        | DOUBLE          | Valor máximo de pH ideal            |
| umidade_ideal_min   | DOUBLE          | Umidade mínima ideal (%)            |
| umidade_ideal_max   | DOUBLE          | Umidade máxima ideal (%)            |

#### 📍 Plantacao
| Atributo       | Tipo            | Descrição                          |
|----------------|-----------------|------------------------------------|
| plantacao_id   | INTEGER (PK)    | Identificador único da plantação   |
| localizacao    | VARCHAR(100)    | Local físico da plantação          |
| cultura_id     | INTEGER (FK)    | FK → Cultura                       |

#### 📍 AjusteAplicacao
| Atributo     | Tipo            | Descrição                              |
|--------------|-----------------|----------------------------------------|
| ajuste_id    | INTEGER (PK)    | Identificador único do ajuste          |
| tipo_ajuste  | VARCHAR(30)     | Irrigação, Nutriente, etc.             |
| quantidade   | DOUBLE          | Quantidade aplicada                   |
| unidade      | VARCHAR(20)     | Litros, gramas, etc.                   |
| data_hora    | DATETIME        | Quando foi aplicado                   |
| plantacao_id | INTEGER (FK)    | FK → Plantacao                        |

---

### 🔗 DER (Mermaid)

```mermaid
erDiagram
    SENSOR {
        INTEGER sensor_id PK
        VARCHAR tipo_sensor
        VARCHAR localizacao
    }
    LEITURA {
        INTEGER leitura_id PK
        DATETIME data_hora
        DOUBLE valor
        VARCHAR unidade
        INTEGER sensor_id FK
    }
    CULTURA {
        INTEGER cultura_id PK
        VARCHAR nome
        DOUBLE ph_ideal_min
        DOUBLE ph_ideal_max
        DOUBLE umidade_ideal_min
        DOUBLE umidade_ideal_max
    }
    PLANTACAO {
        INTEGER plantacao_id PK
        VARCHAR localizacao
        INTEGER cultura_id FK
    }
    AJUSTEAPLICACAO {
        INTEGER ajuste_id PK
        VARCHAR tipo_ajuste
        DOUBLE quantidade
        VARCHAR unidade
        DATETIME data_hora
        INTEGER plantacao_id FK
    }

    SENSOR ||--o{ LEITURA       : gera
    LEITURA }o--|| SENSOR       : pertence_a
    CULTURA ||--o{ PLANTACAO    : define
    PLANTACAO }o--|| CULTURA    : tem
    PLANTACAO ||--o{ AJUSTEAPLICACAO : recebe
    AJUSTEAPLICACAO }o--|| PLANTACAO  : aplicado_em
