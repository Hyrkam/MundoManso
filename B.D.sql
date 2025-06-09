CREATE TABLE autores (
    id_autores SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    obra TEXT
);

CREATE TABLE colaboradores (
    id_colaboradores SERIAL PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    api_key VARCHAR(255),
    data_nascimento DATE NOT NULL,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE usuarios (
    id_usuarios SERIAL PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE conteudos (
    id_conteudos SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    tempo INTERVAL,
    id_colaboradores INTEGER,
    sinopse TEXT,
    id_usuarios INTEGER,
    FOREIGN KEY (id_colaboradores) REFERENCES colaboradores(id_colaboradores),
    FOREIGN KEY (id_usuarios) REFERENCES usuarios(id_usuarios)
);

CREATE TABLE generos (
    id_generos SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE conteudo_genero (
    id_conteudo_genero SERIAL PRIMARY KEY,
    id_conteudos INTEGER,
    id_generos INTEGER,
    FOREIGN KEY (id_conteudos) REFERENCES conteudos(id_conteudos),
    FOREIGN KEY (id_generos) REFERENCES generos(id_generos)
);

CREATE TABLE tipos (
    id_tipos SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE tem (
    id_tem SERIAL PRIMARY KEY,
    id_conteudos INTEGER,
    id_tipos INTEGER,
    FOREIGN KEY (id_conteudos) REFERENCES conteudos(id_conteudos),
    FOREIGN KEY (id_tipos) REFERENCES tipos(id_tipos)
);

CREATE TABLE consomem (
    id_consomem SERIAL PRIMARY KEY,
    id_usuarios INTEGER,
    id_conteudos INTEGER,
    FOREIGN KEY (id_usuarios) REFERENCES usuarios(id_usuarios),
    FOREIGN KEY (id_conteudos) REFERENCES conteudos(id_conteudos)
);

CREATE TABLE episodios (
    id_episodios SERIAL PRIMARY KEY,
    numero INTEGER NOT NULL,
    link VARCHAR(255),
    id_conteudos INTEGER,
    FOREIGN KEY (id_conteudos) REFERENCES conteudos(id_conteudos)
);

CREATE TABLE possuem (
    id_possuem SERIAL PRIMARY KEY,
    id_conteudos INTEGER,
    id_episodios INTEGER,
    FOREIGN KEY (id_conteudos) REFERENCES conteudos(id_conteudos),
    FOREIGN KEY (id_episodios) REFERENCES episodios(id_episodios)
);

CREATE TABLE escrevem (
    id_escrevem SERIAL PRIMARY KEY,
    id_conteudos INTEGER,
    id_autores INTEGER,
    FOREIGN KEY (id_conteudos) REFERENCES conteudos(id_conteudos),
    FOREIGN KEY (id_autores) REFERENCES autores(id_autores)
);

CREATE TABLE publicam (
    id_publicam SERIAL PRIMARY KEY,
    id_colaboradores INTEGER,
    id_conteudos INTEGER,
    FOREIGN KEY (id_colaboradores) REFERENCES colaboradores(id_colaboradores),
    FOREIGN KEY (id_conteudos) REFERENCES conteudos(id_conteudos)
);


INSERT INTO autores (nome, obra) VALUES
('Carlos Silva', 'A Jornada do Tempo'),
('Mariana Souza', 'Caminhos do Amanhã');


INSERT INTO colaboradores (email, api_key, data_nascimento, nome) VALUES
('joao@email.com', 'abc123xyz', '1985-07-14', 'João Oliveira'),
('ana@email.com', 'def456uvw', '1990-11-22', 'Ana Costa');


INSERT INTO usuarios (email, data_nascimento, nome, senha) VALUES
('lucas@email.com', '2000-01-01', 'Lucas Lima', 'senha123'),
('juliana@email.com', '1998-05-30', 'Juliana Mendes', '123senha');


INSERT INTO conteudos (titulo, tempo, id_colaboradores, sinopse, id_usuarios) VALUES
('Aventura Cósmica', '01:30:00', 1, 'Uma jornada pelo espaço em busca de novos mundos.', 1),
('Mistérios da Mente', '00:45:00', 2, 'Exploração psicológica através de histórias intrigantes.', 2);


INSERT INTO generos (nome) VALUES
('Ficção Científica'),
('Suspense');


INSERT INTO conteudo_genero (id_conteudos, id_generos) VALUES
(1, 1),
(2, 2);


INSERT INTO tipos (nome) VALUES
('Filme'),
('Série');


INSERT INTO tem (id_conteudos, id_tipos) VALUES
(1, 1),
(2, 2);


INSERT INTO consomem (id_usuarios, id_conteudos) VALUES
(1, 2),
(2, 1);


INSERT INTO episodios (numero, link, id_conteudos) VALUES
(1, 'https://streaming.com/ep1', 2),
(2, 'https://streaming.com/ep2', 2);


INSERT INTO possuem (id_conteudos, id_episodios) VALUES
(2, 1),
(2, 2);


INSERT INTO escrevem (id_conteudos, id_autores) VALUES
(1, 1),
(2, 2);


INSERT INTO publicam (id_colaboradores, id_conteudos) VALUES
(1, 1),
(2, 2);
