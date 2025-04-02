-- Criação do banco de dados
CREATE DATABASE discord_dos_guri;

-- Usar o banco de dados criado
USE discord_dos_guri;

-- Tabela de usuários
CREATE TABLE usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    data_nascimento DATE,
    senha VARCHAR(255) NOT NULL
);

-- Tabela de servidores
CREATE TABLE servidores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    criador_id INT NOT NULL,
    FOREIGN KEY (criador_id) REFERENCES usuarios(id)
);

-- Tabela de canais
CREATE TABLE canais (
    id INT PRIMARY KEY AUTO_INCREMENT,
    servidor_id INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    tipo ENUM('texto', 'voz') NOT NULL,
    FOREIGN KEY (servidor_id) REFERENCES servidores(id)
);

-- Tabela de mensagens
CREATE TABLE mensagens (
    id INT PRIMARY KEY AUTO_INCREMENT,
    canal_id INT NOT NULL,
    usuario_id INT NOT NULL,
    conteudo TEXT NOT NULL,
    data_envio DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (canal_id) REFERENCES canais(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Tabela de membros do servidor
CREATE TABLE membros_servidor (
    usuario_id INT NOT NULL,
    servidor_id INT NOT NULL,
    PRIMARY KEY (usuario_id, servidor_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (servidor_id) REFERENCES servidores(id)
);

-- Inserindo dados nas tabelas
INSERT INTO usuarios (nome, email, data_nascimento, senha) VALUES
('guhluiz_', 'luizclaudio@gmail.com', '27-06-1997', 'guhluiz027'),
('Eli91022i', 'elizete123@gmail.com', '17-06-2008', 'framengo123'),
('fadolinkdozap', 'luizeira96@gmail.com', '05-05-2009', 'palmeiras51'),
('Machado', 'martins_machado@gmail.com', '18-07-2008', 'v@sco2017');

INSERT INTO servidores (nome, criador_id) VALUES
('Servidor do guhluiz_', 1),
('Servidor do Eli91022i', 2),
('Servidor do Machado', 3);

INSERT INTO canais (servidor_id, nome, tipo) VALUES
(1, 'Geral', 'texto'),
(1, 'Voz Geral', 'voz'),
(2, 'Bate-papo', 'texto'),
(3, 'Discussões', 'texto');

INSERT INTO mensagens (canal_id, usuario_id, conteudo, data_envio) VALUES
(1, 1, 'Primeira mensagem do luizera!', '2025-03-08 12:00:00'),
(2, 2, 'fala, seus frangos!', '2025-03-08 12:30:00'),
(3, 3, 'faz o L!', '2025-03-08 13:00:00'),
(4, 4, 'Esta é a mensagem dp machado!', '2025-03-08 14:00:00'),
(1, 1, 'se quiser sim machado.', '2025-03-08 15:00:00');

INSERT INTO membros_servidor (usuario_id, servidor_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(4, 2),
(4, 3);
