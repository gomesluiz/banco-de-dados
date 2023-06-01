-- Active: 1685506476430@@127.0.0.1@3306@db_editora
INSERT INTO cep (numero_cep, nome_rua, nome_cidade, nome_bairro)
VALUES 
    ('12345678', 'Rua A', 'Cidade A', 'Bairro A'),
    ('23456789', 'Rua B', 'Cidade B', 'Bairro B'),
    ('34567890', 'Rua C', 'Cidade C', 'Bairro C'),
    ('45678901', 'Rua D', 'Cidade D', 'Bairro D'),
    ('56789012', 'Rua E', 'Cidade E', 'Bairro E');

INSERT INTO cliente (codigo_cliente, nome_cliente, numero_residencia, numero_complemento, numero_cep)
VALUES 
    (1, 'Cliente 1', '123', '456', '12345678'),
    (2, 'Cliente 2', '234', '567', '23456789'),
    (3, 'Cliente 3', '345', '678', '34567890'),
    (4, 'Cliente 4', '456', '789', '45678901'),
    (5, 'Cliente 5', '567', '890', '56789012');

INSERT INTO telefone_cliente (id_telefone_cliente, codigo_cliente, numero_telefone)
VALUES 
    (1, 1, '987654321'),
    (2, 2, '876543210'),
    (3, 3, '765432109'),
    (4, 4, '654321098'),
    (5, 5, '543210987');

INSERT INTO tema (codigo_tema, nome_tema)
VALUES 
    (1, 'Algoritmos'),
    (2, 'Banco de Dados'),
    (3, 'Redes de Computadores'),
    (4, 'Inteligência Artificial'),
    (5, 'Segurança da Informação');
    
INSERT INTO revista (numero_isbn, codigo_tema, nome_titulo, numero_periodicidade)
VALUES 
    ('1234567890', 1, 'Revista 1', 12),
    ('2345678901', 2, 'Revista 2', 6),
    ('3456789012', 3, 'Revista 3', 4),
    ('4567890123', 4, 'Revista 4', 8),
    ('5678901234', 5, 'Revista 5', 24);

INSERT INTO assinatura (id_assinatura, numero_isbn, codigo_cliente, data_inicio, data_termino)
VALUES 
    (1, '1234567890', 1, '2023-01-01', '2024-01-01'),
    (2, '2345678901', 2, '2023-02-01', '2024-02-01'),
    (3, '3456789012', 3, '2023-03-01', '2024-03-01'),
    (4, '4567890123', 4, '2023-04-01', '2024-04-01'),
    (5, '5678901234', 5, '2023-05-01', '2024-05-01');

INSERT INTO pagamento (id_assinatura, numero_pagamento, data_vencimento, valor_pagamento)
VALUES 
    (1, 1, '2023-02-01', 99.99),
    (2, 2, '2023-03-01', 149.99),
    (3, 3, '2023-04-01', 199.99),
    (4, 4, '2023-05-01', 249.99),
    (5, 5, '2023-06-01', 299.99);

INSERT INTO artigo (numero_doi, numero_isbn, nome_titulo, descricao_resumo, descricao_texto, numero_pagina)
VALUES 
    ('1234567890123', '1234567890', 'Artigo 1', 'Resumo do Artigo 1', 'Texto do Artigo 1', 10),
    ('2345678901234', '2345678901', 'Artigo 2', 'Resumo do Artigo 2', 'Texto do Artigo 2', 15),
    ('3456789012345', '3456789012', 'Artigo 3', 'Resumo do Artigo 3', 'Texto do Artigo 3', 20),
    ('4567890123456', '4567890123', 'Artigo 4', 'Resumo do Artigo 4', 'Texto do Artigo 4', 25),
    ('5678901234567', '5678901234', 'Artigo 5', 'Resumo do Artigo 5', 'Texto do Artigo 5', 30);

INSERT INTO artigo_referencia (numero_doi_artigo, numero_doi_referencia)
VALUES 
    ('1234567890123', '2345678901234'),
    ('2345678901234', '3456789012345'),
    ('3456789012345', '4567890123456'),
    ('4567890123456', '5678901234567'),
    ('5678901234567', '1234567890123');

INSERT INTO autor (numero_cpf, nome_cliente, endereco_email, endereco_lattes)
VALUES 
    ('12345678901', 'Autor 1', 'autor1@example.com', 'http://lattes.com/autor1'),
    ('23456789012', 'Autor 2', 'autor2@example.com', 'http://lattes.com/autor2'),
    ('34567890123', 'Autor 3', 'autor3@example.com', 'http://lattes.com/autor3'),
    ('45678901234', 'Autor 4', 'autor4@example.com', 'http://lattes.com/autor4'),
    ('56789012345', 'Autor 5', 'autor5@example.com', 'http://lattes.com/autor5');

INSERT INTO telefone_autor (id_telefone_autor, numero_cpf, numero_telefone)
VALUES 
    (1, '12345678901', '987654321'),
    (2, '23456789012', '876543210'),
    (3, '34567890123', '765432109'),
    (4, '45678901234', '654321098'),
    (5, '56789012345', '543210987');
