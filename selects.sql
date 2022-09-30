-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)

SELECT
p.id, p.status, p.cliente_id, pr.id, pr.nome, pr.tipo,
pr."preço", pr.pts_de_lealdade
FROM pedidos p
JOIN produtos_pedidos pp ON p.id = pp.pedido_id
JOIN produtos pr ON pr.id = pp.produto_id;
-- 2)

SELECT 
  p.id
FROM pedidos p
JOIN produtos_pedidos pp ON pp.pedido_id = p.id
JOIN produtos pr ON pp.produto_id = pr.id
WHERE pr.nome ILIKE('%fritas%');

-- 3)

SELECT
  cl.nome gostam_de_fritas
FROM clientes cl
JOIN pedidos p ON cl.id = p.cliente_id
JOIN produtos_pedidos pp ON p.id = pp.pedido_id
JOIN produtos pr ON pp.produto_id = pr.id
WHERE pr.nome ILIKE('%fritas%');
-- 4)

SELECT
  SUM(pr."preço")
FROM
  produtos pr
JOIN produtos_pedidos pp ON pr.id = pp.produto_id
JOIN pedidos p ON pp.pedido_id = p.id
JOIN clientes cl ON p.cliente_id = cl.id
WHERE cl.nome = 'Laura';
-- 5)

SELECT
  pr.nome, COUNT(p)
FROM
  produtos pr
JOIN produtos_pedidos pp ON pr.id = pp.produto_id
JOIN pedidos p ON pp.pedido_id = p.id
GROUP BY pr.nome
ORDER BY pr.nome ASC;