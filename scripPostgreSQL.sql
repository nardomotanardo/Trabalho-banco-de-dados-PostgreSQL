-- Criação da tabela de Usuários
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de Tipos de Problema
CREATE TABLE Issue_Types (
    issue_type_id SERIAL PRIMARY KEY,
    issue_type_name VARCHAR(100) NOT NULL
);

-- Criação da tabela de Níveis de Gravidade
CREATE TABLE Severity_Levels (
    severity_level_id SERIAL PRIMARY KEY,
    severity_level_name VARCHAR(100) NOT NULL
);

-- Criação da tabela de Status do Problema
CREATE TABLE Issue_Status (
    issue_status_id SERIAL PRIMARY KEY,
    issue_status_name VARCHAR(100) NOT NULL
);

-- Criação da tabela de Problemas de Acessibilidade
CREATE TABLE Accessibility_Issues (
    issue_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES Users(user_id),
    street_name VARCHAR(200) NOT NULL,
    cep VARCHAR(20),
    description TEXT NOT NULL,
    issue_type_id INTEGER REFERENCES Issue_Types(issue_type_id),
    severity_level_id INTEGER REFERENCES Severity_Levels(severity_level_id),
    issue_status_id INTEGER REFERENCES Issue_Status(issue_status_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Inserção de dados iniciais na tabela de Tipos de Problema
INSERT INTO Issue_Types (issue_type_name) VALUES 
('Calçada quebrada'),
('Ausência de rampa'),
('Obstrução na calçada'),
('Falta de faixa de pedestre');

-- Inserção de dados iniciais na tabela de Níveis de Gravidade
INSERT INTO Severity_Levels (severity_level_name) VALUES 
('Baixa'),
('Média'),
('Alta'),
('Crítica');

-- Inserção de dados iniciais na tabela de Status do Problema
INSERT INTO Issue_Status (issue_status_name) VALUES 
('Aberto'),
('Em andamento'),
('Resolvido');

-- Inserção de um usuário administrador inicial
INSERT INTO Users (name, email, password, role) VALUES 
('Administrador', 'admin@example.com', 'admin123', 'admin');
