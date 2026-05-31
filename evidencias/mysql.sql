/*-- Criação do banco de dados (opcional)
CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

-- Criação da tabela de pedidos
CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido VARCHAR(20) NOT NULL,
    data_pedido DATE NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    produto_modelo VARCHAR(100) NOT NULL,
    preco_venda DECIMAL(10, 2) NOT NULL,
    status_logistica VARCHAR(50) NOT NULL,
    avaliacao INT COMMENT 'Nota de 1 a 5',
    produto_danificado ENUM('Sim', 'Não') NOT NULL,
    devolucao ENUM('Sim', 'Não') NOT NULL,
    PRIMARY KEY (id_pedido)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO pedidos (id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao) VALUES
('ERP-2025000', '2025-01-09', 'Smartphones', 'Samsung Galaxy S23 Ultra', 4778.02, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025001', '2024-12-28', 'Smartphones', 'iPhone 14 Plus', 4898.49, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025002', '2025-01-30', 'Smartphones', 'Samsung Galaxy A14', 866.94, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025003', '2024-07-11', 'Smartphones', 'Samsung Galaxy S24', 4991.88, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025004', '2024-01-21', 'Smartphones', 'Samsung Galaxy A25', 1456.54, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025005', '2024-03-13', 'Smartphones', 'iPhone 13', 3439.02, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025006', '2024-07-11', 'TVs', 'Samsung QLED 55”', 3461.05, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025007', '2024-01-10', 'Smartphones', 'Samsung Galaxy S24 Plus', 5610.40, 'Entregue no Prazo', 3, 'Não', 'Sim'),
('ERP-2025008', '2024-12-05', 'Smartphones', 'Samsung Galaxy S24 Plus', 5364.01, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025009', '2024-08-01', 'Outros', 'Samsung Odyssey G5', 1901.74, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025010', '2024-02-27', 'Smartphones', 'iPhone 13', 3568.36, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025011', '2025-04-11', 'Smartphones', 'Samsung Galaxy S25 Plus', 6154.68, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025012', '2024-01-31', 'Smartphones', 'iPhone 17 Pro Max', 12798.69, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025013', '2024-11-19', 'Smartphones', 'iPhone 14 Pro', 6115.44, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025014', '2024-12-23', 'Notebooks', 'MacBook Pro M3', 13567.91, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025015', '2024-04-08', 'Smartphones', 'iPhone 15', 5378.62, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025022', '2025-03-07', 'Geladeiras/Eletro', 'Electrolux Side by Side', 6019.51, 'Entregue no Prazo', 3, 'Não', 'Sim'),
('ERP-2025028', '2024-07-08', 'Smartphones', 'Samsung Galaxy A35', 1838.69, 'Entrega com Atraso', 2, 'Sim', 'Sim');

SELECT SUM(preco_venda) AS faturamento_total FROM pedidos;

SELECT categoria, ROUND(AVG(preco_venda), 2) AS ticket_medio 
FROM pedidos 
GROUP BY categoria;

SELECT produto_danificado, COUNT(*) AS total_pedidos,
       SUM(CASE WHEN devolucao = 'Sim' THEN 1 ELSE 0 END) AS total_devolucoes
FROM pedidos
GROUP BY produto_danificado;

SELECT * FROM pedidos;
USE ecommerce_db;
INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025029', '2024-09-15', 'Notebooks', 'Dell G15 Gamer', 5899.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025030', '2024-10-02', 'TVs', 'LG OLED 65', 7999.99, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025031', '2024-11-18', 'Smartphones', 'Xiaomi Redmi Note 13', 1899.50, 'Entrega com Atraso', 3, 'Não', 'Não'),
('ERP-2025032', '2025-02-11', 'Acessórios', 'AirPods Pro 2', 2499.00, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025033', '2024-06-27', 'Notebooks', 'Acer Nitro 5', 4599.99, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025034', '2025-01-05', 'Smartphones', 'iPhone 15 Pro Max', 9999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025035', '2024-08-12', 'Geladeiras/Eletro', 'Brastemp Frost Free', 4299.00, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025036', '2024-12-01', 'Outros', 'PlayStation 5', 4499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025037', '2025-03-18', 'TVs', 'Samsung Crystal UHD', 3299.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025038', '2024-05-20', 'Acessórios', 'Teclado Mecânico RGB', 599.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025039', '2024-07-09', 'Smartphones', 'Motorola Edge 40', 2799.00, 'Entrega com Atraso', 3, 'Não', 'Sim'),
('ERP-2025040', '2024-09-30', 'Notebooks', 'Lenovo Legion 5', 6899.99, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025041', '2024-11-03', 'TVs', 'TCL 50 Polegadas', 2199.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025042', '2025-04-02', 'Smartphones', 'Samsung Galaxy Z Flip', 7499.99, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025043', '2024-03-25', 'Outros', 'Xbox Series X', 4299.90, 'Entrega com Atraso', 2, 'Sim', 'Sim');

INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025044', '2024-06-14', 'Smartphones', 'Realme 12 Pro', 2199.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025045', '2024-10-19', 'Notebooks', 'MacBook Air M2', 8999.99, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025046', '2025-01-22', 'TVs', 'Philips Ambilight 55', 4599.00, 'Entrega com Atraso', 3, 'Não', 'Sim'),
('ERP-2025047', '2024-07-28', 'Acessórios', 'Mouse Logitech G Pro', 499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025048', '2024-04-17', 'Outros', 'Nintendo Switch OLED', 2399.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025049', '2024-12-11', 'Smartphones', 'POCO X6 Pro', 2599.99, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025050', '2024-08-23', 'Geladeiras/Eletro', 'Samsung Inverse', 5399.00, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025051', '2025-03-03', 'TVs', 'LG NanoCell 55', 3899.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025052', '2024-11-09', 'Notebooks', 'ASUS TUF Gaming', 6199.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025053', '2024-05-30', 'Acessórios', 'Headset HyperX Cloud', 699.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025054', '2024-09-08', 'Smartphones', 'iPhone SE 2024', 3299.90, 'Entrega com Atraso', 3, 'Não', 'Não'),
('ERP-2025055', '2025-02-15', 'TVs', 'Samsung Neo QLED 8K', 15499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025056', '2024-06-02', 'Outros', 'Meta Quest 3', 3799.00, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025057', '2024-10-27', 'Geladeiras/Eletro', 'Consul Duplex', 3199.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025058', '2025-04-05', 'Smartphones', 'Galaxy S25 Ultra', 11999.90, 'Entregue no Prazo', 5, 'Não', 'Não');

INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025059', '2024-07-01', 'Notebooks', 'HP Victus 15', 5499.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025060', '2024-08-14', 'Smartphones', 'Xiaomi 14 Ultra', 6999.99, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025061', '2024-09-21', 'TVs', 'Sony Bravia 65', 8999.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),
('ERP-2025062', '2025-01-18', 'Acessórios', 'Mouse Razer DeathAdder', 349.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025063', '2024-10-05', 'Outros', 'Steam Deck OLED', 4599.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025064', '2024-03-11', 'Geladeiras/Eletro', 'LG Smart Inverter', 4799.00, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025065', '2025-02-26', 'Notebooks', 'Alienware M16', 12999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025066', '2024-12-30', 'TVs', 'Samsung The Frame', 6499.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025067', '2024-05-09', 'Smartphones', 'Zenfone 11 Ultra', 4299.90, 'Entrega com Atraso', 3, 'Não', 'Não'),
('ERP-2025068', '2024-06-22', 'Acessórios', 'Webcam Logitech C920', 599.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025069', '2025-03-12', 'Outros', 'Kindle Paperwhite', 799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025070', '2024-11-16', 'Smartphones', 'Google Pixel 8 Pro', 5899.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025071', '2024-04-04', 'Geladeiras/Eletro', 'Panasonic Frost Free', 3899.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025072', '2024-09-29', 'TVs', 'Hisense 58 Smart TV', 2999.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025073', '2025-04-09', 'Notebooks', 'Samsung Book4', 4199.90, 'Entregue no Prazo', 5, 'Não', 'Não');

INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025074', '2024-08-03', 'Smartphones', 'Nothing Phone 2', 3999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025075', '2024-10-12', 'TVs', 'LG UHD 70', 5599.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025076', '2025-01-07', 'Notebooks', 'Dell Inspiron 15', 4799.00, 'Entrega com Atraso', 3, 'Não', 'Sim'),
('ERP-2025077', '2024-06-18', 'Acessórios', 'Caixa JBL Charge 5', 899.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025078', '2024-07-25', 'Outros', 'Apple Watch Series 9', 3499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025079', '2024-11-28', 'Geladeiras/Eletro', 'Brastemp Inverse', 6499.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025080', '2025-03-01', 'Smartphones', 'Motorola Razr 40', 5299.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025081', '2024-05-14', 'TVs', 'Philco Roku TV 50', 2499.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025082', '2024-09-17', 'Notebooks', 'Lenovo IdeaPad 3', 3299.90, 'Entrega com Atraso', 3, 'Não', 'Não'),
('ERP-2025083', '2025-02-20', 'Acessórios', 'Microfone HyperX QuadCast', 1199.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025084', '2024-12-09', 'Outros', 'Drone DJI Mini 4', 6999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025085', '2024-04-28', 'Smartphones', 'Redmi Note 14 Pro', 2499.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025086', '2024-08-30', 'Geladeiras/Eletro', 'Electrolux Frost Free', 4599.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025087', '2025-01-27', 'TVs', 'Samsung OLED S90C', 9499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025088', '2024-10-21', 'Notebooks', 'MacBook Air M3', 10499.90, 'Entregue no Prazo', 5, 'Não', 'Não');

INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025089', '2024-06-05', 'Smartphones', 'iPhone 16 Pro', 8999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025090', '2024-07-19', 'TVs', 'Toshiba Smart TV 55', 3199.90, 'Entrega com Atraso', 3, 'Não', 'Não'),
('ERP-2025091', '2025-02-02', 'Notebooks', 'Gigabyte G5', 7299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025092', '2024-11-14', 'Acessórios', 'Mousepad Gamer RGB', 199.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025093', '2024-03-07', 'Outros', 'GoPro Hero 12', 2899.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025094', '2024-09-26', 'Geladeiras/Eletro', 'Samsung Family Hub', 11999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025095', '2025-01-11', 'Smartphones', 'Huawei P60 Pro', 5499.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025096', '2024-08-18', 'TVs', 'AOC Roku TV 43', 2199.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025097', '2024-10-04', 'Notebooks', 'MSI Katana GF66', 8399.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),
('ERP-2025098', '2025-03-22', 'Acessórios', 'SSD Kingston 1TB', 499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025099', '2024-05-16', 'Outros', 'Câmera Canon EOS', 6799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025100', '2024-12-29', 'Smartphones', 'Samsung Galaxy M55', 2799.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025101', '2024-06-29', 'Geladeiras/Eletro', 'LG Side by Side', 7299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025102', '2025-04-14', 'TVs', 'Philips OLED 65', 9999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025103', '2024-11-07', 'Notebooks', 'Avell Storm', 11299.90, 'Entregue no Prazo', 5, 'Não', 'Não');

INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025104', '2024-07-06', 'Smartphones', 'OnePlus 12', 4799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025105', '2024-09-12', 'TVs', 'Samsung Crystal UHD 65', 4299.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025106', '2025-02-08', 'Notebooks', 'Razer Blade 15', 15499.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),
('ERP-2025107', '2024-10-15', 'Acessórios', 'Monitor Gamer LG UltraGear', 1899.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025108', '2024-04-09', 'Outros', 'Meta Quest Pro', 8999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025109', '2024-12-17', 'Geladeiras/Eletro', 'Samsung Smart Refrigerator', 13999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025110', '2025-03-05', 'Smartphones', 'Vivo X100 Pro', 6599.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025111', '2024-08-24', 'TVs', 'LG QNED 75', 11999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025112', '2024-06-11', 'Notebooks', 'Acer Predator Helios', 9799.90, 'Entrega com Atraso', 3, 'Não', 'Não'),
('ERP-2025113', '2025-01-25', 'Acessórios', 'Cadeira Gamer ThunderX3', 1499.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025114', '2024-05-03', 'Outros', 'DJI Osmo Pocket 3', 4599.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025115', '2024-11-30', 'Smartphones', 'Sony Xperia 1 VI', 7499.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025116', '2024-09-02', 'Geladeiras/Eletro', 'Brastemp French Door', 8799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025117', '2025-04-18', 'TVs', 'Xiaomi TV Max 86', 16999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025118', '2024-10-08', 'Notebooks', 'HP Omen 16', 8999.90, 'Entregue no Prazo', 5, 'Não', 'Não');

INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025119', '2024-06-08', 'Smartphones', 'Oppo Find X7 Ultra', 6999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025120', '2024-08-27', 'TVs', 'Philips Ambilight 75', 12499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025121', '2025-01-13', 'Notebooks', 'Lenovo LOQ', 5899.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),
('ERP-2025122', '2024-11-22', 'Acessórios', 'Teclado Logitech MX Keys', 799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025123', '2024-03-18', 'Outros', 'Apple Vision Pro', 24999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025124', '2024-09-10', 'Geladeiras/Eletro', 'Electrolux Multidoor', 9999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025125', '2025-02-17', 'Smartphones', 'Asus ROG Phone 8', 7999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025126', '2024-07-13', 'TVs', 'Samsung Neo QLED 75', 18999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025127', '2024-10-31', 'Notebooks', 'Dell XPS 15', 13999.90, 'Entrega com Atraso', 3, 'Não', 'Não'),
('ERP-2025128', '2025-03-09', 'Acessórios', 'Controle Xbox Elite', 1299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025129', '2024-05-25', 'Outros', 'Simulador Logitech G923', 3499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025130', '2024-12-14', 'Smartphones', 'Honor Magic 6 Pro', 6299.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025131', '2024-08-05', 'Geladeiras/Eletro', 'Samsung Bespoke', 11999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025132', '2025-04-21', 'TVs', 'LG OLED Evo C4', 15999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025133', '2024-09-19', 'Notebooks', 'Framework Laptop 16', 10499.90, 'Entregue no Prazo', 5, 'Não', 'Não');
INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025134', '2024-06-16', 'Smartphones', 'Nubia RedMagic 9 Pro', 5599.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025135', '2024-11-05', 'TVs', 'Sony OLED Bravia XR', 17499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025136', '2025-01-29', 'Notebooks', 'MSI Raider GE78', 18499.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),
('ERP-2025137', '2024-07-22', 'Acessórios', 'Volante Logitech G29', 2299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025138', '2024-04-15', 'Outros', 'Valve Index VR', 8999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025139', '2024-10-09', 'Geladeiras/Eletro', 'LG InstaView Door-in-Door', 13499.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025140', '2025-03-15', 'Smartphones', 'iPhone Fold', 14999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025141', '2024-08-11', 'TVs', 'TCL Mini LED 75', 9799.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025142', '2024-12-02', 'Notebooks', 'ASUS ROG Zephyrus G16', 12499.90, 'Entrega com Atraso', 3, 'Não', 'Não'),
('ERP-2025143', '2025-02-27', 'Acessórios', 'Mesa Digitalizadora Wacom', 3199.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025144', '2024-05-29', 'Outros', 'Sim Racing Cockpit', 5999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025145', '2024-09-14', 'Smartphones', 'Motorola Edge 50 Ultra', 4999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025146', '2024-11-26', 'Geladeiras/Eletro', 'Panasonic Prime Fresh', 8499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025147', '2025-04-25', 'TVs', 'Samsung MicroLED 98', 54999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025148', '2024-10-18', 'Notebooks', 'Apple MacBook Pro M4 Max', 22499.90, 'Entregue no Prazo', 5, 'Não', 'Não');
INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025149', '2024-06-20', 'Smartphones', 'Galaxy S26 Ultra', 13999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025150', '2024-08-09', 'TVs', 'LG Signature OLED R', 79999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025151', '2025-01-16', 'Notebooks', 'Alienware X18', 25999.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),
('ERP-2025152', '2024-07-04', 'Acessórios', 'Headset SteelSeries Nova Pro', 2499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025153', '2024-03-27', 'Outros', 'DJI Inspire 3', 45999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025154', '2024-11-13', 'Geladeiras/Eletro', 'Samsung AI Family Hub', 18999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025155', '2025-02-06', 'Smartphones', 'Xiaomi Mix Fold 4', 11999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025156', '2024-09-24', 'TVs', 'Sony Mini LED 85', 26999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025157', '2024-12-20', 'Notebooks', 'Lenovo ThinkPad X1 Carbon', 14999.90, 'Entrega com Atraso', 3, 'Não', 'Não'),
('ERP-2025158', '2025-03-19', 'Acessórios', 'Monitor Samsung Odyssey OLED', 6999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025159', '2024-05-12', 'Outros', 'Meta Quest 4', 5999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025160', '2024-10-06', 'Smartphones', 'Huawei Mate XT', 9999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025161', '2024-08-16', 'Geladeiras/Eletro', 'LG MoodUP Refrigerator', 15999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025162', '2025-04-28', 'TVs', 'Samsung QD-OLED 77', 21999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025163', '2024-11-11', 'Notebooks', 'ROG Strix Scar 18', 27999.90, 'Entregue no Prazo', 5, 'Não', 'Não');
INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025164', '2024-06-25', 'Smartphones', 'Google Pixel Fold 2', 12999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025165', '2024-09-05', 'TVs', 'Hisense U8N 75', 10999.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025166', '2025-01-20', 'Notebooks', 'MSI Titan 18 HX', 34999.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),
('ERP-2025167', '2024-07-17', 'Acessórios', 'Teclado Corsair K100', 1899.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025168', '2024-04-22', 'Outros', 'Apple Vision Air', 18999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025169', '2024-10-14', 'Geladeiras/Eletro', 'Electrolux AutoSense', 9799.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025170', '2025-03-08', 'Smartphones', 'Realme GT Neo 6', 4399.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025171', '2024-08-28', 'TVs', 'Philips OLED+ 65', 14999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025172', '2024-12-24', 'Notebooks', 'Dell Precision 7780', 21999.90, 'Entrega com Atraso', 3, 'Não', 'Não'),
('ERP-2025173', '2025-02-12', 'Acessórios', 'Stream Deck XL', 1599.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025174', '2024-05-18', 'Outros', 'Drone FPV DJI Avata', 7999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025175', '2024-09-22', 'Smartphones', 'Nothing Phone 3', 5299.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025176', '2024-11-08', 'Geladeiras/Eletro', 'Brastemp Smart Frost Free', 11299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025177', '2025-04-30', 'TVs', 'LG Transparent OLED', 89999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025178', '2024-10-25', 'Notebooks', 'MacBook Pro M4 Ultra', 29999.90, 'Entregue no Prazo', 5, 'Não', 'Não');
INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025179', '2024-06-30', 'Smartphones', 'iPhone Air', 15999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025180', '2024-09-01', 'TVs', 'Samsung Neo QLED 98', 45999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025181', '2025-01-23', 'Notebooks', 'Acer Swift X Pro', 8999.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),
('ERP-2025182', '2024-07-20', 'Acessórios', 'Mouse Logitech MX Master 4', 799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025183', '2024-04-26', 'Outros', 'PlayStation Portal', 2499.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025184', '2024-10-20', 'Geladeiras/Eletro', 'Samsung Bespoke AI', 16999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025185', '2025-03-11', 'Smartphones', 'Galaxy Z Fold 7', 13999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025186', '2024-08-31', 'TVs', 'Sony Bravia 8K 85', 52999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025187', '2024-12-28', 'Notebooks', 'Lenovo Yoga Slim 9', 12499.90, 'Entrega com Atraso', 3, 'Não', 'Não'),
('ERP-2025188', '2025-02-18', 'Acessórios', 'Elgato Facecam Pro', 1899.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025189', '2024-05-21', 'Outros', 'Nintendo Switch 2', 3999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025190', '2024-09-27', 'Smartphones', 'Xiaomi 15 Ultra', 8999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025191', '2024-11-15', 'Geladeiras/Eletro', 'LG InstaView Smart', 14999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025192', '2025-04-07', 'TVs', 'TCL QD Mini LED 98', 38999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025193', '2024-10-29', 'Notebooks', 'HP Spectre x360', 10999.90, 'Entregue no Prazo', 5, 'Não', 'Não');
INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025194', '2024-06-07', 'Smartphones', 'Asus Zenfone Fold', 11999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025195', '2024-08-13', 'TVs', 'LG OLED Flex 42', 17999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025196', '2025-01-30', 'Notebooks', 'Dell Alienware m18 R2', 32999.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),
('ERP-2025197', '2024-07-02', 'Acessórios', 'Headset Logitech Astro A50', 2499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025198', '2024-03-30', 'Outros', 'GoPro Max 2', 5499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025199', '2024-10-11', 'Geladeiras/Eletro', 'Samsung Family Hub AI', 22999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025200', '2025-03-16', 'Smartphones', 'OnePlus Open 2', 9999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025201', '2024-09-06', 'TVs', 'Sony QD-OLED 77', 24999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025202', '2024-12-13', 'Notebooks', 'MacBook StudioBook M4', 26999.90, 'Entrega com Atraso', 3, 'Não', 'Não'),
('ERP-2025203', '2025-02-23', 'Acessórios', 'Monitor Alienware 360Hz', 5299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025204', '2024-05-24', 'Outros', 'DJI Mini 5 Pro', 6999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025205', '2024-09-18', 'Smartphones', 'Huawei Mate Fold X', 14999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025206', '2024-11-24', 'Geladeiras/Eletro', 'LG Signature InstaView', 28999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025207', '2025-04-12', 'TVs', 'Samsung Infinity Screen 110', 129999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025208', '2024-10-31', 'Notebooks', 'ROG Flow Z13', 18999.90, 'Entregue no Prazo', 5, 'Não', 'Não');
INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025209', '2024-06-09', 'Smartphones', 'Galaxy Z Roll', 17999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025210', '2024-08-22', 'TVs', 'LG OLED Signature T', 149999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025211', '2025-01-19', 'Notebooks', 'Acer Predator Triton X', 21999.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),
('ERP-2025212', '2024-07-15', 'Acessórios', 'Mouse Finalmouse ULX', 1299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025213', '2024-04-12', 'Outros', 'Valve Steam Deck 2', 6999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025214', '2024-10-03', 'Geladeiras/Eletro', 'Samsung Smart AI Fridge', 25999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025215', '2025-03-14', 'Smartphones', 'iPhone Ultra Fold', 19999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025216', '2024-09-09', 'TVs', 'Sony Crystal LED 100', 189999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025217', '2024-12-18', 'Notebooks', 'MacBook Ultra M4 Extreme', 39999.90, 'Entrega com Atraso', 3, 'Não', 'Não'),
('ERP-2025218', '2025-02-25', 'Acessórios', 'Teclado Wooting 80HE', 1899.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025219', '2024-05-27', 'Outros', 'Drone DJI Inspire X', 55999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025220', '2024-09-23', 'Smartphones', 'Pixel Fold Ultra', 15999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025221', '2024-11-20', 'Geladeiras/Eletro', 'LG AI MoodUP Max', 31999.90, 'Entregue no Prazo', 5, 'sim', 'sim'),
('ERP-2025222', '2025-04-15', 'TVs', 'Samsung Transparent OLED', 249999.90, 'Entregue no Prazo', 5, 'sim', 'sim'),
('ERP-2025223', '2024-10-26', 'Notebooks', 'Lenovo Legion Titan', 28999.90, 'Entregue no Prazo', 5, 'sim', 'sim');
INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025224', '2024-06-04', 'Smartphones', 'Samsung Galaxy Hyper X', 21999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025225', '2024-08-17', 'TVs', 'LG OLED Infinity 97', 279999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025226', '2025-01-12', 'Notebooks', 'ASUS ROG Titan X', 45999.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),
('ERP-2025227', '2024-07-10', 'Acessórios', 'Headset Razer Kraken V4', 1799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025228', '2024-03-22', 'Outros', 'Apple Vision Max', 34999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025229', '2024-10-01', 'Geladeiras/Eletro', 'Samsung Bespoke Infinite', 39999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025230', '2025-03-02', 'Smartphones', 'iPhone Fold Max', 24999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025231', '2024-09-11', 'TVs', 'Sony Crystal Vision 120', 319999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025232', '2024-12-07', 'Notebooks', 'Dell Alienware Ultra', 38999.90, 'Entrega com Atraso', 3, 'Não', 'Não'),
('ERP-2025233', '2025-02-09', 'Acessórios', 'Monitor ASUS ProArt OLED', 8999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025234', '2024-05-08', 'Outros', 'Drone DJI Cinema Pro', 74999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025235', '2024-09-13', 'Smartphones', 'Xiaomi Ultra Fold', 18999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025236', '2024-11-18', 'Geladeiras/Eletro', 'LG Signature AI Max', 45999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025237', '2025-04-19', 'TVs', 'Samsung Wall MicroLED', 499999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025238', '2024-10-30', 'Notebooks', 'MacBook Ultra Titanium', 54999.90, 'Entregue no Prazo', 5, 'sim', 'sim');

INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025239', '2024-06-14', 'Smartphones', 'Samsung Galaxy S27 Ultra', 18999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025240', '2024-08-21', 'TVs', 'LG OLED Crystal 88', 349999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025241', '2025-01-28', 'Notebooks', 'Alienware Aurora Laptop', 42999.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),
('ERP-2025242', '2024-07-07', 'Acessórios', 'Mouse Razer Viper V4 Pro', 999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025243', '2024-03-19', 'Outros', 'Meta Quest Infinite', 12999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025244', '2024-10-05', 'Geladeiras/Eletro', 'Samsung AI Kitchen Hub', 52999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025245', '2025-03-10', 'Smartphones', 'iPhone Fold Ultra Max', 27999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025246', '2024-09-17', 'TVs', 'Sony XR Master Series 98', 389999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025247', '2024-12-10', 'Notebooks', 'MacBook Ultra Carbon', 64999.90, 'Entrega com Atraso', 3, 'Não', 'Não'),
('ERP-2025248', '2025-02-14', 'Acessórios', 'Monitor Samsung Dual 8K', 11999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025249', '2024-05-16', 'Outros', 'DJI Inspire Infinity', 89999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025250', '2024-09-29', 'Smartphones', 'Pixel Hyper Fold', 20999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025251', '2024-11-27', 'Geladeiras/Eletro', 'LG Smart Ice Infinity', 61999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025252', '2025-04-23', 'TVs', 'Samsung MicroLED Infinity', 599999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025253', '2024-10-21', 'Notebooks', 'ROG Titan Supreme', 79999.90, 'Entregue no Prazo', 5, 'Não', 'Não');

INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025254', '2024-06-18', 'Smartphones', 'Galaxy Infinite Ultra', 32999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025255', '2024-08-26', 'TVs', 'LG Transparent OLED Max', 749999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025256', '2025-01-11', 'Notebooks', 'Alienware Quantum X', 89999.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),
('ERP-2025257', '2024-07-12', 'Acessórios', 'Headset HyperX Infinity', 2299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025258', '2024-03-25', 'Outros', 'Drone DJI Ultra Cinema', 129999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025259', '2024-10-13', 'Geladeiras/Eletro', 'Samsung Family Hub Infinity', 79999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025260', '2025-03-06', 'Smartphones', 'iPhone Infinity Fold', 34999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025261', '2024-09-20', 'TVs', 'Sony Crystal OLED Max', 899999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025262', '2024-12-04', 'Notebooks', 'MacBook Quantum M5', 99999.90, 'Entrega com Atraso', 3, 'Não', 'Não'),
('ERP-2025263', '2025-02-20', 'Acessórios', 'Monitor Gamer OLED 1000Hz', 15999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025264', '2024-05-10', 'Outros', 'Meta Universe VR', 45999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025265', '2024-09-25', 'Smartphones', 'Xiaomi Hyper Fold Pro', 24999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025266', '2024-11-21', 'Geladeiras/Eletro', 'LG Infinity AI Max', 94999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025267', '2025-04-16', 'TVs', 'Samsung Titan MicroLED', 1299999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025268', '2024-10-27', 'Notebooks', 'ROG Hyper Titan', 119999.90, 'Entregue no Prazo', 5, 'Não', 'Não');
INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025269', '2024-06-02', 'Smartphones', 'Samsung Galaxy Titan Ultra', 45999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025270', '2024-08-30', 'TVs', 'LG Infinity Glass OLED', 1499999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025271', '2025-01-26', 'Notebooks', 'MacBook Infinity M6', 149999.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),
('ERP-2025272', '2024-07-09', 'Acessórios', 'Mouse Logitech Quantum Pro', 1399.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025273', '2024-03-14', 'Outros', 'Apple Vision Infinity', 69999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025274', '2024-10-07', 'Geladeiras/Eletro', 'Samsung Smart AI Infinite', 119999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025275', '2025-03-04', 'Smartphones', 'iPhone Quantum Fold', 55999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025276', '2024-09-16', 'TVs', 'Sony Crystal Infinity 120', 1899999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025277', '2024-12-15', 'Notebooks', 'Alienware Infinity X', 179999.90, 'Entrega com Atraso', 3, 'Não', 'Não'),
('ERP-2025278', '2025-02-11', 'Acessórios', 'Monitor ASUS Hyper OLED', 22999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025279', '2024-05-13', 'Outros', 'DJI Titan Drone', 159999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025280', '2024-09-28', 'Smartphones', 'Pixel Infinity Ultra', 38999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025281', '2024-11-29', 'Geladeiras/Eletro', 'LG Smart Infinity Hub', 139999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025282', '2025-04-27', 'TVs', 'Samsung Diamond MicroLED', 2499999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025283', '2024-10-23', 'Notebooks', 'ROG Infinity Supreme', 199999.90, 'Entregue no Prazo', 5, 'Não', 'Não');
INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025299', '2024-06-10', 'Smartphones', 'Samsung Galaxy S24 Ultra', 6499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025300', '2024-08-15', 'TVs', 'LG OLED C4 65', 8999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025301', '2025-01-17', 'Notebooks', 'Dell G15 RTX 4060', 7299.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),
('ERP-2025302', '2024-07-08', 'Acessórios', 'Headset HyperX Cloud III', 599.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025303', '2024-03-20', 'Outros', 'PlayStation 5 Slim', 3999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025304', '2024-10-06', 'Geladeiras/Eletro', 'Samsung Duplex Frost Free', 4999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025305', '2025-03-03', 'Smartphones', 'iPhone 16 Pro Max', 10999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025306', '2024-09-18', 'TVs', 'Samsung QLED 55', 4599.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025307', '2024-12-14', 'Notebooks', 'Lenovo Legion 5i', 8499.90, 'Entrega com Atraso', 3, 'Não', 'Não'),
('ERP-2025308', '2025-02-13', 'Acessórios', 'Monitor LG UltraGear 27', 1799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025309', '2024-05-11', 'Outros', 'Xbox Series X', 4299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025310', '2024-09-24', 'Smartphones', 'Xiaomi 14T Pro', 4299.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025311', '2024-11-19', 'Geladeiras/Eletro', 'LG Frost Free Inverter', 6299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025312', '2025-04-08', 'TVs', 'TCL QLED 65', 5299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025313', '2024-10-28', 'Notebooks', 'MacBook Air M3', 11999.90, 'Entregue no Prazo', 5, 'Não', 'Não');

SELECT * FROM pedidos;
INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025314', '2024-06-12', 'Smartphones', 'Motorola Edge 50 Pro', 3499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025315', '2024-08-19', 'TVs', 'Philips Ambilight 55', 4799.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025316', '2025-01-21', 'Notebooks', 'Acer Nitro V15', 5699.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),
('ERP-2025317', '2024-07-06', 'Acessórios', 'Mouse Logitech G502 X', 449.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025318', '2024-03-28', 'Outros', 'Nintendo Switch OLED', 2399.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025319', '2024-10-04', 'Geladeiras/Eletro', 'Brastemp Frost Free', 4599.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025320', '2025-03-05', 'Smartphones', 'Galaxy Z Flip 6', 6999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025321', '2024-09-14', 'TVs', 'Samsung Crystal UHD 50', 2999.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025322', '2024-12-16', 'Notebooks', 'ASUS TUF Gaming F15', 6799.90, 'Entrega com Atraso', 3, 'Não', 'Não'),
('ERP-2025323', '2025-02-15', 'Acessórios', 'Teclado Redragon Kumara', 299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025324', '2024-05-18', 'Outros', 'Meta Quest 3', 3799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025325', '2024-09-26', 'Smartphones', 'iPhone 15', 5799.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025326', '2024-11-22', 'Geladeiras/Eletro', 'Electrolux Inverter', 5599.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025327', '2025-04-11', 'TVs', 'LG NanoCell 65', 6499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025328', '2024-10-30', 'Notebooks', 'Samsung Galaxy Book4', 4999.90, 'Entregue no Prazo', 5, 'Não', 'Não');
USE ecommerce_db;
INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025329', '2024-06-15', 'Smartphones', 'Xiaomi Redmi Note 13 Pro', 2499.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025330', '2024-08-23', 'TVs', 'TCL 55 QLED', 3899.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025331', '2025-01-25', 'Notebooks', 'Lenovo IdeaPad Gaming 3', 5399.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),
('ERP-2025332', '2024-07-04', 'Acessórios', 'Headset JBL Quantum 400', 399.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025333', '2024-03-17', 'Outros', 'Apple Watch Series 9', 3299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025334', '2024-10-09', 'Geladeiras/Eletro', 'Consul Duplex Frost Free', 3899.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025335', '2025-03-07', 'Smartphones', 'POCO X6 Pro', 2799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025336', '2024-09-12', 'TVs', 'Samsung Smart TV 43', 2299.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025337', '2024-12-19', 'Notebooks', 'Dell Inspiron 15', 4699.90, 'Entrega com Atraso', 3, 'Não', 'Não'),
('ERP-2025338', '2025-02-10', 'Acessórios', 'Mousepad Gamer RGB', 149.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025339', '2024-05-20', 'Outros', 'Kindle Paperwhite', 799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025340', '2024-09-28', 'Smartphones', 'Realme 12 Plus', 2199.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025341', '2024-11-25', 'Geladeiras/Eletro', 'Panasonic Frost Free', 4999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025342', '2025-04-13', 'TVs', 'LG UHD 55', 3599.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025343', '2024-10-22', 'Notebooks', 'HP Victus 15', 6299.90, 'Entregue no Prazo', 5, 'Não', 'Não');
USE ecommerce_db;

INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025344', '2024-06-11', 'Smartphones', 'Galaxy A55', 2199.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025345', '2024-08-20', 'TVs', 'Samsung DU8000 50', 2899.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025346', '2025-01-14', 'Notebooks', 'Lenovo LOQ RTX 4050', 5999.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),
('ERP-2025347', '2024-07-03', 'Acessórios', 'Teclado Logitech G213', 249.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025348', '2024-03-15', 'Outros', 'Echo Dot 5', 349.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025349', '2024-10-08', 'Geladeiras/Eletro', 'Electrolux Duplex', 4299.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025350', '2025-03-02', 'Smartphones', 'iPhone 14', 4999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025351', '2024-09-10', 'TVs', 'LG UHD 43', 2399.90, 'Entregue no Prazo', 4, 'Não', 'Não'),
('ERP-2025352', '2024-12-12', 'Notebooks', 'Acer Aspire 5', 3899.90, 'Entrega com Atraso', 3, 'Não', 'Não'),
('ERP-2025353', '2025-02-09', 'Acessórios', 'Mouse Gamer Redragon', 179.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025354', '2024-05-22', 'Outros', 'Fire TV Stick', 299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025355', '2024-09-30', 'Smartphones', 'Moto G84', 1899.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),
('ERP-2025356', '2024-11-18', 'Geladeiras/Eletro', 'Brastemp Inverse', 5999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025357', '2025-04-09', 'TVs', 'Philips Roku TV 58', 3199.90, 'Entregue no Prazo', 5, 'Não', 'Não'),
('ERP-2025358', '2024-10-25', 'Notebooks', 'Samsung Book2', 4299.90, 'Entregue no Prazo', 5, 'Não', 'Não');
USE ecommerce_db;

INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025359', '2024-06-13', 'Smartphones', 'iPhone 13', 4299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025360', '2024-08-24', 'TVs', 'Samsung Crystal UHD 55', 3499.90, 'Entregue no Prazo', 4, 'Não', 'Não'),

('ERP-2025361', '2025-01-18', 'Notebooks', 'Dell Inspiron 14', 4599.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),

('ERP-2025362', '2024-07-01', 'Acessórios', 'Headset Logitech G435', 399.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025363', '2024-03-21', 'Outros', 'Apple TV 4K', 1299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025364', '2024-10-07', 'Geladeiras/Eletro', 'Consul Frost Free', 4499.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025365', '2025-03-04', 'Smartphones', 'Galaxy S23 FE', 2999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025366', '2024-09-09', 'TVs', 'TCL 50 Google TV', 2699.90, 'Entregue no Prazo', 4, 'Não', 'Não'),

('ERP-2025367', '2024-12-20', 'Notebooks', 'HP Pavilion Gaming', 5599.90, 'Entrega com Atraso', 3, 'Não', 'Não'),

('ERP-2025368', '2025-02-08', 'Acessórios', 'Teclado Mecânico Redragon', 349.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025369', '2024-05-17', 'Outros', 'Chromecast Google TV', 399.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025370', '2024-09-27', 'Smartphones', 'Xiaomi Redmi Note 14', 2099.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025371', '2024-11-23', 'Geladeiras/Eletro', 'Samsung Inverter Duplex', 6799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025372', '2025-04-05', 'TVs', 'LG QNED 55', 5799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025373', '2024-10-19', 'Notebooks', 'MacBook Air M2', 8999.90, 'Entregue no Prazo', 5, 'Não', 'Não');
USE ecommerce_db;

INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025404', '2024-06-09', 'Smartphones', 'Motorola Edge 40 Neo', 2199.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025405', '2024-08-29', 'TVs', 'TCL 75 QLED', 7999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025406', '2025-01-27', 'Notebooks', 'ASUS Zenbook 14', 6899.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),

('ERP-2025407', '2024-07-11', 'Acessórios', 'Teclado Logitech MX Keys', 699.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025408', '2024-03-26', 'Outros', 'Galaxy Watch 6', 1499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025409', '2024-10-15', 'Geladeiras/Eletro', 'Brastemp Duplex Inverter', 6499.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025410', '2025-03-12', 'Smartphones', 'iPhone 15 Pro', 8999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025411', '2024-09-19', 'TVs', 'LG OLED 55 C3', 8499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025412', '2024-12-22', 'Notebooks', 'Samsung Galaxy Book3 Ultra', 9999.90, 'Entrega com Atraso', 3, 'Não', 'Não'),

('ERP-2025413', '2025-02-18', 'Acessórios', 'Mouse Razer DeathAdder V3', 499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025414', '2024-05-25', 'Outros', 'GoPro Hero 12', 2499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025415', '2024-09-23', 'Smartphones', 'Galaxy A25', 1799.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025416', '2024-11-30', 'Geladeiras/Eletro', 'LG Side by Side', 10999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025417', '2025-04-18', 'TVs', 'Samsung OLED S90D', 9999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025418', '2024-10-31', 'Notebooks', 'MacBook Pro M3', 14999.90, 'Entregue no Prazo', 5, 'Não', 'Não');/*
USE ecommerce_db;

INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025419', '2024-06-17', 'Smartphones', 'Xiaomi Redmi Note 14 Pro', 2799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025420', '2024-08-14', 'TVs', 'Philips The One 55', 4599.90, 'Entregue no Prazo', 4, 'Não', 'Não'),

('ERP-2025421', '2025-01-13', 'Notebooks', 'Dell Latitude 5440', 5899.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),

('ERP-2025422', '2024-07-16', 'Acessórios', 'Mouse Logitech MX Master 3S', 599.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025423', '2024-03-29', 'Outros', 'Apple Pencil USB-C', 799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025424', '2024-10-17', 'Geladeiras/Eletro', 'Consul Facilite Frost Free', 4799.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025425', '2025-03-18', 'Smartphones', 'iPhone 14 Plus', 6199.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025426', '2024-09-07', 'TVs', 'Samsung QLED 65', 6799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025427', '2024-12-23', 'Notebooks', 'Acer Swift Go 14', 5499.90, 'Entrega com Atraso', 3, 'Não', 'Não'),

('ERP-2025428', '2025-02-19', 'Acessórios', 'Headset JBL Quantum 610', 799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025429', '2024-05-28', 'Outros', 'Echo Studio', 1399.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025430', '2024-09-15', 'Smartphones', 'Galaxy M35', 1999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025431', '2024-11-12', 'Geladeiras/Eletro', 'Panasonic Frost Free Inverter', 7299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025432', '2025-04-20', 'TVs', 'LG NanoCell 75', 7499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025433', '2024-10-16', 'Notebooks', 'Lenovo Yoga 7i', 8799.90, 'Entregue no Prazo', 5, 'Não', 'Não');
USE ecommerce_db;

INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025419', '2024-06-17', 'Smartphones', 'Xiaomi Redmi Note 14 Pro', 2799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025420', '2024-08-14', 'TVs', 'Philips The One 55', 4599.90, 'Entregue no Prazo', 4, 'Não', 'Não'),

('ERP-2025421', '2025-01-13', 'Notebooks', 'Dell Latitude 5440', 5899.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),

('ERP-2025422', '2024-07-16', 'Acessórios', 'Mouse Logitech MX Master 3S', 599.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025423', '2024-03-29', 'Outros', 'Apple Pencil USB-C', 799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025424', '2024-10-17', 'Geladeiras/Eletro', 'Consul Facilite Frost Free', 4799.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025425', '2025-03-18', 'Smartphones', 'iPhone 14 Plus', 6199.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025426', '2024-09-07', 'TVs', 'Samsung QLED 65', 6799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025427', '2024-12-23', 'Notebooks', 'Acer Swift Go 14', 5499.90, 'Entrega com Atraso', 3, 'Não', 'Não'),

('ERP-2025428', '2025-02-19', 'Acessórios', 'Headset JBL Quantum 610', 799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025429', '2024-05-28', 'Outros', 'Echo Studio', 1399.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025430', '2024-09-15', 'Smartphones', 'Galaxy M35', 1999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025431', '2024-11-12', 'Geladeiras/Eletro', 'Panasonic Frost Free Inverter', 7299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025432', '2025-04-20', 'TVs', 'LG NanoCell 75', 7499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025433', '2024-10-16', 'Notebooks', 'Lenovo Yoga 7i', 8799.90, 'Entregue no Prazo', 5, 'Não', 'Não');
USE ecommerce_db;

INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025434', '2024-06-21', 'Smartphones', 'Motorola Moto G84', 1899.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025435', '2024-08-11', 'TVs', 'Samsung Crystal UHD 70', 5299.90, 'Entregue no Prazo', 4, 'Não', 'Não'),

('ERP-2025436', '2025-01-29', 'Notebooks', 'HP Victus RTX 4050', 7199.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),

('ERP-2025437', '2024-07-13', 'Acessórios', 'Teclado Gamer HyperX Alloy', 499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025438', '2024-03-16', 'Outros', 'Apple AirPods Pro 2', 1899.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025439', '2024-10-18', 'Geladeiras/Eletro', 'Samsung Frost Free Inverter', 6999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025440', '2025-03-21', 'Smartphones', 'Galaxy S24 FE', 3999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025441', '2024-09-04', 'TVs', 'LG UHD 65', 4899.90, 'Entregue no Prazo', 4, 'Não', 'Não'),

('ERP-2025442', '2024-12-26', 'Notebooks', 'ASUS TUF A15', 7499.90, 'Entrega com Atraso', 3, 'Não', 'Não'),

('ERP-2025443', '2025-02-24', 'Acessórios', 'Mouse Logitech G PRO X', 699.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025444', '2024-05-26', 'Outros', 'Amazon Fire HD 10', 1199.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025445', '2024-09-19', 'Smartphones', 'Redmi Note 13', 1699.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025446', '2024-11-14', 'Geladeiras/Eletro', 'LG Inverter Smart', 8499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025447', '2025-04-22', 'TVs', 'Philips Ambilight 75', 8999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025448', '2024-10-14', 'Notebooks', 'MacBook Air M2 15', 12999.90, 'Entregue no Prazo', 5, 'Não', 'Não');

USE ecommerce_db;

INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025449', '2024-06-24', 'Smartphones', 'iPhone 13 Mini', 3999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025450', '2024-08-16', 'TVs', 'TCL 50 P635', 2499.90, 'Entregue no Prazo', 4, 'Não', 'Não'),

('ERP-2025451', '2025-01-31', 'Notebooks', 'Dell G15 RTX 3050', 6399.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),

('ERP-2025452', '2024-07-15', 'Acessórios', 'Mousepad HyperX Fury', 129.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025453', '2024-03-27', 'Outros', 'Galaxy Buds FE', 599.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025454', '2024-10-21', 'Geladeiras/Eletro', 'Brastemp French Door', 8999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025455', '2025-03-25', 'Smartphones', 'POCO X6', 2299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025456', '2024-09-06', 'TVs', 'LG UR8750 55', 3799.90, 'Entregue no Prazo', 4, 'Não', 'Não'),

('ERP-2025457', '2024-12-29', 'Notebooks', 'Lenovo Legion Slim 5', 8799.90, 'Entrega com Atraso', 3, 'Não', 'Não'),

('ERP-2025458', '2025-02-27', 'Acessórios', 'Webcam Redragon Apex', 299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025459', '2024-05-30', 'Outros', 'Smart Speaker Alexa', 449.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025460', '2024-09-17', 'Smartphones', 'Moto G73', 1799.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025461', '2024-11-16', 'Geladeiras/Eletro', 'Samsung Side by Side', 11999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025462', '2025-04-24', 'TVs', 'Samsung QLED 75', 10999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025463', '2024-10-13', 'Notebooks', 'ASUS Zenbook OLED', 9499.90, 'Entregue no Prazo', 5, 'Não', 'Não');
USE ecommerce_db;

INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025464', '2024-06-26', 'Smartphones', 'Galaxy A15', 1299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025465', '2024-08-28', 'TVs', 'Philips 43 Full HD', 1999.90, 'Entregue no Prazo', 4, 'Não', 'Não'),

('ERP-2025466', '2025-01-15', 'Notebooks', 'Acer Aspire 3', 3499.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),

('ERP-2025467', '2024-07-18', 'Acessórios', 'Mouse Gamer Logitech G305', 249.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025468', '2024-03-13', 'Outros', 'Tablet Galaxy Tab S9 FE', 2999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025469', '2024-10-24', 'Geladeiras/Eletro', 'Electrolux Side by Side', 9499.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025470', '2025-03-28', 'Smartphones', 'iPhone 14 Pro', 7999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025471', '2024-09-03', 'TVs', 'Samsung Smart TV 58', 3699.90, 'Entregue no Prazo', 4, 'Não', 'Não'),

('ERP-2025472', '2024-12-27', 'Notebooks', 'Lenovo IdeaPad Flex 5', 5299.90, 'Entrega com Atraso', 3, 'Não', 'Não'),

('ERP-2025473', '2025-02-21', 'Acessórios', 'Teclado Gamer Logitech G Pro', 599.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025474', '2024-05-29', 'Outros', 'Apple Watch SE', 2399.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025475', '2024-09-11', 'Smartphones', 'Realme 11 Pro+', 2599.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025476', '2024-11-10', 'Geladeiras/Eletro', 'Samsung French Door Inverter', 12999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025477', '2025-04-26', 'TVs', 'LG OLED Evo 65', 11999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025478', '2024-10-15', 'Notebooks', 'MacBook Pro M2', 13999.90, 'Entregue no Prazo', 5, 'Não', 'Não');

USE ecommerce_db;

INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025479', '2024-06-06', 'Smartphones', 'Galaxy S23', 4599.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025480', '2024-08-10', 'TVs', 'LG UHD 70', 5999.90, 'Entregue no Prazo', 4, 'Não', 'Não'),

('ERP-2025481', '2025-01-20', 'Notebooks', 'Dell Inspiron Gaming', 6999.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),

('ERP-2025482', '2024-07-20', 'Acessórios', 'Headset Logitech Pro X', 899.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025483', '2024-03-12', 'Outros', 'iPad 10ª Geração', 4299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025484', '2024-10-26', 'Geladeiras/Eletro', 'Brastemp Duplex Frost Free', 6999.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025485', '2025-03-14', 'Smartphones', 'iPhone 15 Plus', 6999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025486', '2024-09-02', 'TVs', 'Samsung Neo QLED 65', 9999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025487', '2024-12-18', 'Notebooks', 'ASUS ROG Strix G16', 10999.90, 'Entrega com Atraso', 3, 'Não', 'Não'),

('ERP-2025488', '2025-02-23', 'Acessórios', 'Mouse HyperX Pulsefire', 349.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025489', '2024-05-31', 'Outros', 'Galaxy Watch 5 Pro', 2499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025490', '2024-09-14', 'Smartphones', 'Moto Edge 40', 2799.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025491', '2024-11-13', 'Geladeiras/Eletro', 'LG InstaView Door-in-Door', 13999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025492', '2025-04-28', 'TVs', 'Sony Bravia XR 75', 14999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025493', '2024-10-17', 'Notebooks', 'MacBook Air M3 15', 14999.90, 'Entregue no Prazo', 5, 'Não', 'Não');

USE ecommerce_db;

INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025494', '2024-06-22', 'Smartphones', 'Galaxy Z Flip 5', 5999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025495', '2024-08-07', 'TVs', 'Philips Ambilight 70', 7999.90, 'Entregue no Prazo', 4, 'Não', 'Não'),

('ERP-2025496', '2025-01-19', 'Notebooks', 'Lenovo Legion Pro 5', 9999.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),

('ERP-2025497', '2024-07-09', 'Acessórios', 'Teclado Corsair K70 RGB', 899.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025498', '2024-03-23', 'Outros', 'Apple AirPods 3', 1399.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025499', '2024-10-28', 'Geladeiras/Eletro', 'Samsung Duplex Evolution', 7499.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025500', '2025-03-16', 'Smartphones', 'Xiaomi 14 Ultra', 6999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025501', '2024-09-01', 'TVs', 'LG QNED 65', 8999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025502', '2024-12-14', 'Notebooks', 'Acer Predator Helios Neo', 8999.90, 'Entrega com Atraso', 3, 'Não', 'Não'),

('ERP-2025503', '2025-02-25', 'Acessórios', 'Mouse Razer Basilisk V3', 499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025504', '2024-05-27', 'Outros', 'Galaxy Buds 2 Pro', 899.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025505', '2024-09-18', 'Smartphones', 'iPhone 13 Pro', 6499.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025506', '2024-11-11', 'Geladeiras/Eletro', 'Electrolux French Door', 10999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025507', '2025-04-30', 'TVs', 'Samsung OLED 77', 16999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025508', '2024-10-12', 'Notebooks', 'HP Omen 16', 9499.90, 'Entregue no Prazo', 5, 'Não', 'Não');

USE ecommerce_db;

INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025509', '2024-06-19', 'Smartphones', 'Galaxy S24 Plus', 5799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025510', '2024-08-05', 'TVs', 'TCL C655 55', 4299.90, 'Entregue no Prazo', 4, 'Não', 'Não'),

('ERP-2025511', '2025-01-23', 'Notebooks', 'Dell XPS 13', 8999.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),

('ERP-2025512', '2024-07-14', 'Acessórios', 'Headset Corsair HS80', 799.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025513', '2024-03-30', 'Outros', 'Apple HomePod Mini', 899.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025514', '2024-10-29', 'Geladeiras/Eletro', 'LG Smart Inverter', 7799.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025515', '2025-03-11', 'Smartphones', 'Motorola Edge 50 Ultra', 4999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025516', '2024-09-08', 'TVs', 'Samsung DU7700 65', 5199.90, 'Entregue no Prazo', 4, 'Não', 'Não'),

('ERP-2025517', '2024-12-21', 'Notebooks', 'Lenovo ThinkPad E14', 6299.90, 'Entrega com Atraso', 3, 'Não', 'Não'),

('ERP-2025518', '2025-02-22', 'Acessórios', 'Mouse Logitech Lift', 399.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025519', '2024-05-24', 'Outros', 'Nintendo Switch Lite', 1499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025520', '2024-09-10', 'Smartphones', 'Redmi Note 14 Pro Plus', 3299.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025521', '2024-11-20', 'Geladeiras/Eletro', 'Brastemp Inverse Evox', 8999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025522', '2025-04-17', 'TVs', 'LG OLED B4 65', 9999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025523', '2024-10-11', 'Notebooks', 'ASUS Vivobook Go 15', 3799.90, 'Entregue no Prazo', 5, 'Não', 'Não');

USE ecommerce_db;

INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025524', '2024-06-27', 'Smartphones', 'iPhone 15 Pro Max', 9999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025525', '2024-08-30', 'TVs', 'Samsung Crystal UHD 43', 2299.90, 'Entregue no Prazo', 4, 'Não', 'Não'),

('ERP-2025526', '2025-01-26', 'Notebooks', 'Samsung Galaxy Book4 Pro', 8499.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),

('ERP-2025527', '2024-07-22', 'Acessórios', 'Teclado Mecânico Logitech G413', 449.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025528', '2024-03-19', 'Outros', 'Apple Magic Mouse', 699.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025529', '2024-10-31', 'Geladeiras/Eletro', 'Consul Inverter Duplex', 5799.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025530', '2025-03-13', 'Smartphones', 'Galaxy Z Fold 5', 11999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025531', '2024-09-05', 'TVs', 'Philips Roku TV 50', 2799.90, 'Entregue no Prazo', 4, 'Não', 'Não'),

('ERP-2025532', '2024-12-13', 'Notebooks', 'HP EliteBook 840', 6999.90, 'Entrega com Atraso', 3, 'Não', 'Não'),

('ERP-2025533', '2025-02-20', 'Acessórios', 'Headset Astro A10', 349.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025534', '2024-05-16', 'Outros', 'Meta Quest 2', 2999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025535', '2024-09-24', 'Smartphones', 'Moto G34', 1299.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025536', '2024-11-27', 'Geladeiras/Eletro', 'Samsung Family Hub', 15999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025537', '2025-04-29', 'TVs', 'Sony Bravia 65 4K', 11999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025538', '2024-10-09', 'Notebooks', 'Acer Swift X', 7499.90, 'Entregue no Prazo', 5, 'Não', 'Não');

USE ecommerce_db;

INSERT INTO pedidos 
(id_pedido, data_pedido, categoria, produto_modelo, preco_venda, status_logistica, avaliacao, produto_danificado, devolucao)
VALUES

('ERP-2025539', '2024-06-29', 'Smartphones', 'Xiaomi 13T Pro', 4599.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025540', '2024-08-12', 'TVs', 'LG NanoCell 50', 3399.90, 'Entregue no Prazo', 4, 'Não', 'Não'),

('ERP-2025541', '2025-01-28', 'Notebooks', 'Dell Alienware M16', 14999.90, 'Entrega com Atraso', 3, 'Não', 'Sim'),

('ERP-2025542', '2024-07-24', 'Acessórios', 'Mouse Logitech G502 HERO', 299.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025543', '2024-03-22', 'Outros', 'Apple TV HD', 999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025544', '2024-10-13', 'Geladeiras/Eletro', 'Electrolux Efficient', 6799.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025545', '2025-03-17', 'Smartphones', 'iPhone 14 Pro Max', 9499.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025546', '2024-09-21', 'TVs', 'Samsung Gaming TV 55', 5599.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025547', '2024-12-24', 'Notebooks', 'Lenovo Yoga Slim 6', 6599.90, 'Entrega com Atraso', 3, 'Não', 'Não'),

('ERP-2025548', '2025-02-28', 'Acessórios', 'Headset HyperX Cloud Alpha', 549.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025549', '2024-05-13', 'Outros', 'Drone DJI Mini 3', 4999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025550', '2024-09-26', 'Smartphones', 'Galaxy A54', 2499.90, 'Entrega com Atraso', 2, 'Sim', 'Sim'),

('ERP-2025551', '2024-11-15', 'Geladeiras/Eletro', 'LG InstaView Smart', 16999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025552', '2025-04-21', 'TVs', 'Sony Bravia OLED 65', 15999.90, 'Entregue no Prazo', 5, 'Não', 'Não'),

('ERP-2025553', '2024-10-23', 'Notebooks', 'MacBook Pro M3 Max', 18999.90, 'Entregue no Prazo', 5, 'Não', 'Não');*/
