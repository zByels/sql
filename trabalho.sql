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

CREATE TABLE amizades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario1_id INT NOT NULL,
    usuario2_id INT NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario1_id) REFERENCES usuarios(id),
    FOREIGN KEY (usuario2_id) REFERENCES usuarios(id),
    CONSTRAINT chk_amizades CHECK (usuario1_id != usuario2_id)
);


-- Inserindo dados nas tabelas
INSERT INTO usuarios (nome, email, data_nascimento, senha) VALUES
('guhluiz_', 'luizclaudio@gmail.com', '1997-06-27', 'guhluiz027'),
('Eli91022i', 'elizete123@gmail.com', '2008-06-17', 'framengo123'),
('fadolinkdozap', 'luizeira96@gmail.com', '2009-05-05', 'palmeiras51'),
('Machado', 'martins_machado@gmail.com', '2008-07-18', 'v@sco2017');

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
(1, 1, 'Alguém sabe se vai ter atualização no servidor?', '2025-03-08 16:40:00'),
(2, 2, 'Já tem mais gente na call?', '2025-03-08 16:50:00'),
(3, 3, 'Eu estou aqui, me avisa quando for começar.', '2025-03-08 17:00:00'),
(4, 4, 'Bora fazer uma stream amanhã?', '2025-03-08 17:10:00'),
(1, 1, 'Quem mais vai entrar no servidor hoje?', '2025-03-08 17:20:00'),
(2, 2, 'Estou disponível para qualquer jogo', '2025-03-08 17:30:00'),
(3, 3, 'Deixa eu ver se meu PC aguenta o jogo...', '2025-03-08 17:40:00'),
(4, 4, 'Alguém tem link para aquele novo mod?', '2025-03-08 17:50:00'),
(1, 1, 'Estou preparando minha configuração para o evento', '2025-03-08 18:00:00'),
(2, 2, 'Será que o servidor vai aguentar a galera?', '2025-03-08 18:10:00'),
(3, 3, 'Podem me chamar quando for a vez de jogar?', '2025-03-08 18:20:00'),
(4, 4, 'Estou só esperando a galera se organizar', '2025-03-08 18:30:00'),
(1, 1, 'Preciso de mais players para a raid', '2025-03-08 18:40:00'),
(2, 2, 'Eu topo uma raid agora', '2025-03-08 18:50:00'),
(3, 3, 'Alguém tem algum link para um guia de raid?', '2025-03-08 19:00:00'),
(4, 4, 'Eu já estou com o setup pronto, vamos!', '2025-03-08 19:10:00'),
(1, 1, 'Que horas vamos começar o evento?', '2025-03-08 19:20:00'),
(2, 2, 'Ainda não sei, talvez daqui a pouco', '2025-03-08 19:30:00'),
(3, 3, 'Estou pronto! Só me avisem!', '2025-03-08 19:40:00'),
(4, 4, 'Essa vai ser épica, pode chamar!', '2025-03-08 19:50:00'),
(1, 1, 'Vocês já viram a nova atualização do jogo?', '2025-03-08 20:00:00'),
(2, 2, 'Sim, está bem interessante!', '2025-03-08 20:10:00'),
(3, 3, 'Quais são as mudanças?', '2025-03-08 20:20:00'),
(4, 4, 'Eles mudaram a mecânica do combate!', '2025-03-08 20:30:00'),
(1, 1, 'Alguém já testou a nova classe?', '2025-03-08 20:40:00'),
(2, 2, 'Sim, está muito boa, recomendo', '2025-03-08 20:50:00'),
(3, 3, 'Eu quero testar, mas preciso de mais tempo', '2025-03-08 21:00:00'),
(4, 4, 'Eu já estou na nova classe, é top!', '2025-03-08 21:10:00'),
(1, 1, 'Quais são os melhores itens da nova atualização?', '2025-03-08 21:20:00'),
(2, 2, 'Estou tentando pegar os melhores itens também', '2025-03-08 21:30:00'),
(3, 3, 'Acho que o set de armaduras está demais!', '2025-03-08 21:40:00'),
(4, 4, 'Vou tentar pegar tudo na primeira oportunidade', '2025-03-08 21:50:00'),
(1, 1, 'Quem mais está tentando pegar as skins raras?', '2025-03-08 22:00:00'),
(2, 2, 'Eu já garanti as minhas, agora é só curtir!', '2025-03-08 22:10:00'),
(3, 3, 'Estou atrás das skins mais épicas', '2025-03-08 22:20:00'),
(4, 4, 'Quem já pegou todas as conquistas da atualização?', '2025-03-08 22:30:00'),
(1, 1, 'Eu peguei, agora só falta a conquista secreta!', '2025-03-08 22:40:00'),
(2, 2, 'Estou no caminho para pegar a última conquista', '2025-03-08 22:50:00'),
(3, 3, 'Alguém sabe como liberar a conquista secreta?', '2025-03-08 23:00:00'),
(4, 4, 'Preciso de dicas para completar as conquistas', '2025-03-08 23:10:00'),
(1, 1, 'Vamos fazer um evento de conquistas amanhã?', '2025-03-08 23:20:00'),
(2, 2, 'Boa ideia, vou participar!', '2025-03-08 23:30:00'),
(3, 3, 'Eu topo! Vai ser divertido!', '2025-03-08 23:40:00'),
(4, 4, 'Estou dentro, já avisa a hora!', '2025-03-08 23:50:00'),
(1, 1, 'Quem mais vai estar online no fim de semana?', '2025-03-09 00:00:00'),
(2, 2, 'Eu vou estar, com certeza!', '2025-03-09 00:10:00'),
(3, 3, 'Vou tentar, mas não sei se vou conseguir', '2025-03-09 00:20:00'),
(4, 4, 'Eu vou sim, vai ser épico!', '2025-03-09 00:30:00'),
(1, 1, 'Deixa eu confirmar, mas acho que sim', '2025-03-09 00:40:00'),
(2, 2, 'Eu vou com certeza, sem falta', '2025-03-09 00:50:00'),
(3, 3, 'Vamos tentar pegar todos os itens do evento!', '2025-03-09 01:00:00'),
(4, 4, 'Eu não vou perder por nada!', '2025-03-09 01:10:00');

INSERT INTO membros_servidor (usuario_id, servidor_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(4, 2),
(4, 3);

-- Inserir 20 amizades aleatórias para cada usuário de forma bidirecional

-- Para o usuário 1
INSERT INTO amizades (usuario1_id, usuario2_id)
SELECT 1 AS usuario1_id, id AS usuario2_id
FROM usuarios
WHERE id != 1
ORDER BY RAND()
LIMIT 20;

-- Inserir as amizades do usuário 2 para o usuário 1
INSERT INTO amizades (usuario1_id, usuario2_id)
SELECT id AS usuario1_id, 1 AS usuario2_id
FROM usuarios
WHERE id != 1
ORDER BY RAND()
LIMIT 20;

-- Para o usuário 2
INSERT INTO amizades (usuario1_id, usuario2_id)
SELECT 2 AS usuario1_id, id AS usuario2_id
FROM usuarios
WHERE id != 2
ORDER BY RAND()
LIMIT 20;

-- Inserir as amizades do usuário 2 para o usuário 2
INSERT INTO amizades (usuario1_id, usuario2_id)
SELECT id AS usuario1_id, 2 AS usuario2_id
FROM usuarios
WHERE id != 2
ORDER BY RAND()
LIMIT 20;

-- Para o usuário 3
INSERT INTO amizades (usuario1_id, usuario2_id)
SELECT 3 AS usuario1_id, id AS usuario2_id
FROM usuarios
WHERE id != 3
ORDER BY RAND()
LIMIT 20;

-- Inserir as amizades do usuário 3 para o usuário 3
INSERT INTO amizades (usuario1_id, usuario2_id)
SELECT id AS usuario1_id, 3 AS usuario2_id
FROM usuarios
WHERE id != 3
ORDER BY RAND()
LIMIT 20;

-- Para o usuário 4
INSERT INTO amizades (usuario1_id, usuario2_id)
SELECT 4 AS usuario1_id, id AS usuario2_id
FROM usuarios
WHERE id != 4
ORDER BY RAND()
LIMIT 20;

-- Inserir as amizades do usuário 4 para o usuário 4
INSERT INTO amizades (usuario1_id, usuario2_id)
SELECT id AS usuario1_id, 4 AS usuario2_id
FROM usuarios
WHERE id != 4
ORDER BY RAND()
LIMIT 20;

