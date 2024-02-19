CREATE TABLE IF NOT EXISTS clients (
  id SERIAL PRIMARY KEY,
  email VARCHAR(50) NOT NULL  UNIQUE
);
CREATE TYPE status AS ENUM ('not_payed', 'partial_payed', 'payed');
CREATE TABLE IF NOT EXISTS sells (
  id SERIAL PRIMARY KEY,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  current_status status DEFAULT 'not_payed' NOT NULL,
  client_id  INTEGER NOT NULL REFERENCES clients(id),
  total DECIMAL(13,  3),
  recharged_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP + INTERVAL '30 days' NOT NULL
);

INSERT INTO clients (email) 
VALUES('mimail@mail.com'),
              ('test2@email'),
              ('kenderB@mail.com');
INSERT INTO sells VALUES();