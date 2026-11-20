CREATE DATABASE IF NOT EXISTS devise_app;
USE devise_app;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE moedas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(10) NOT NULL UNIQUE,
    nome VARCHAR(50) NOT NULL,
    bandeira VARCHAR(10) NOT NULL,
    continente VARCHAR(50) NOT NULL
);

CREATE TABLE conversoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    moeda_origem_id INT,
    moeda_destino_id INT,
    valor_origem DECIMAL(15, 4) NOT NULL,
    valor_convertido DECIMAL(15, 4) NOT NULL,
    data_conversao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (moeda_origem_id) REFERENCES moedas(id),
    FOREIGN KEY (moeda_destino_id) REFERENCES moedas(id)
);

CREATE TABLE paises (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    bandeira VARCHAR(10) NOT NULL
);

CREATE TABLE pontos_turisticos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pais_id INT,
    titulo VARCHAR(150) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    descricao TEXT,
    imagem VARCHAR(255),
    FOREIGN KEY (pais_id) REFERENCES paises(id) ON DELETE CASCADE
);

CREATE TABLE metodos_pagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    tipo VARCHAR(50) NOT NULL,
    detalhes VARCHAR(255),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE projetos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    nome_projeto VARCHAR(150) NOT NULL,
    status VARCHAR(50) DEFAULT 'Ativo',
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

INSERT INTO moedas (codigo, nome, bandeira, continente) VALUES
('USD', 'Dólar Americano (US$)', '🇺🇸', 'América Do Norte'),
('EUR', 'Euro (€)', '🇪🇺', 'Europa'),
('JPY', 'Iene (JPY - ¥)', '🇯🇵', 'Ásia'),
('CNY', 'Yuan Renminbi (CNY - ¥)', '🇨🇳', 'Ásia'),
('CHF', 'Franco Suíço (CHF)', '🇨🇭', 'Europa'),
('NZD', 'Dólar Neozelandês (NZD)', '🇳🇿', 'Oceania'),
('CAD', 'Dólar Canadense (CAD)', '🇨🇦', 'América Do Norte'),
('AUD', 'Dólar Australiano (AUD)', '🇦🇺', 'Oceania'),
('BRL', 'Real (BRL - R$)', '🇧🇷', 'América Do Sul'),
('SAR', 'Rial Saudita (SAR)', '🇸🇦', 'Ásia'),
('AED', 'Dirham (AED)', '🇦🇪', 'Ásia'),
('EGP', 'Libra Egípcia (EGP)', '🇪🇬', 'África'),
('ARS', 'Peso Argentino (ARS)', '🇦🇷', 'América Do Sul'),
('ZAR', 'Rand Sul-Africano (ZAR)', '🇿🇦', 'África');

INSERT INTO paises (nome, descricao, bandeira) VALUES
('Estados Unidos', 'Explore cidades cosmopolitas e marcos icônicos globais.', '🇺🇸'),
('Europa', 'Descubra a arte, gastronomia e arquitetura clássica europeia.', '🇪🇺'),
('Japão', 'Tradições milenares combinadas com tecnologia futurista.', '🇯🇵'),
('China', 'Explore dinastias imperiais, relíquias sagradas e as maiores muralhas da humanidade.', '🇨🇳'),
('Suíça', 'Paisagens alpinas deslumbrantes e lagos cristalinos.', '🇨🇭'),
('Austrália', 'Praias paradisíacas e vida selvagem única.', '🇦🇺'),
('Canadá', 'Natureza exuberante e grandes metrópoles.', '🇨🇦'),
('Nova Zelândia', 'Aventuras ao ar livre e cenários cinematográficos.', '🇳🇿'),
('Brazil', 'Riqueza cultural, biodiversidade e praias tropicais.', '🇧🇷'),
('Arábia Saudita', 'Cultura rica e paisagens desérticas históricas.', '🇸🇦'),
('Emirados Árabes Unido', 'Luxo moderno, arquitetura inovadora e desertos.', '🇦🇪'),
('Egito', 'Pirâmides ancestrais e os mistérios do Rio Nilo.', '🇪🇬'),
('Argentina', 'Geleiras impressionantes, cultura vibrante e rica gastronomia.', '🇦🇷'),
('África', 'Safáris inesquecíveis e rica diversidade cultural.', '🇿🇦');

INSERT INTO pontos_turisticos (pais_id, titulo, cidade, descricao, imagem) VALUES
(4, 'Grande Muralha da China', 'Huairou', 'A colossal fortaleza de pedra que serpenteia as montanhas, defendendo o antigo império.', 'https://images.unsplash.com/photo-1508804185872-d7badad00f7d?auto=format&fit=crop&w=800&q=80'),
(4, 'Cidade Proibida', 'Pequim', 'O majestoso palácio imperial que serviu como o coração cerimonial e político por séculos.', 'https://images.unsplash.com/photo-1584464491033-06628f3a6b7b?auto=format&fit=crop&w=800&q=80');
