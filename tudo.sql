SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `test`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `city`
--

CREATE TABLE `city` (
  `idCity` int(11) NOT NULL,
  `nameCity` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `city`
--

INSERT INTO `city` (`idCity`, `nameCity`) VALUES
(1, 'Campinas'),
(2, 'Ortolândia'),
(4, 'Sumaré');

-- --------------------------------------------------------

--
-- Estrutura da tabela `profile_reg`
--

CREATE TABLE `profile_reg` (
  `idProfile` int(11) NOT NULL,
  `nameProfile` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `profile_reg`
--

INSERT INTO `profile_reg` (`idProfile`, `nameProfile`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Estrutura da tabela `reg`
--

CREATE TABLE `reg` (
  `name` varchar(20) NOT NULL UNIQUE,
  `username` varchar(20) NOT NULL UNIQUE,
  `password` varchar(50) NOT NULL,
  `city` varchar(15) NOT NULL,
  `image` varchar(50),
  `gender` varchar(10),
  `id` int(11) NOT NULL UNIQUE,
  `fk_idProfile` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `reg`
--

INSERT INTO `reg` (`name`, `username`, `password`, `city`, `image`, `gender`, `id`, `fk_idProfile`) VALUES
('Bikash', 'bikash', 'bikash', 'knp', 'image/images.png', 'male', 2, NULL),
('Alciomar Hollanda', 'alciomar@gmail.com', '123', 'knp', 'image/github-octocat.png', 'male', 3, 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`idCity`);

--
-- Índices para tabela `profile_reg`
--
ALTER TABLE `profile_reg`
  ADD PRIMARY KEY (`idProfile`);

--
-- Índices para tabela `reg`
--
ALTER TABLE `reg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_idProfile` (`fk_idProfile`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `city`
--
ALTER TABLE `city`
  MODIFY `idCity` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `profile_reg`
--
ALTER TABLE `profile_reg`
  MODIFY `idProfile` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `reg`
--
ALTER TABLE `reg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `reg`
--
ALTER TABLE `reg`
  ADD CONSTRAINT `reg_ibfk_1` FOREIGN KEY (`fk_idProfile`) REFERENCES `profile_reg` (`idProfile`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

CREATE TABLE compra(
	IdCompra INT PRIMARY KEY AUTO_INCREMENT,
	dataCompra datetime DEFAULT now(),
    valorCompraTotal float,
    fk_IdReg int not null,
    foreign key (fk_IdReg) references reg(id)
);


CREATE TABLE produto(
	IdProduto INT PRIMARY KEY AUTO_INCREMENT,
	nomeProduto VARCHAR(50) NOT NULL,
    preco float not null
);

CREATE TABLE compra_produto(
	fkCompra INT NOT NULL,
	fkProduto INT NOT NULL,
    
	PRIMARY KEY (fkCompra, fkProduto),
	FOREIGN KEY(fkCompra) REFERENCES compra(IdCompra),
	FOREIGN KEY(fkProduto) REFERENCES produto(IdProduto)
);

insert into produto (nomeProduto, preco) values ("Memoria RAM",350.90);
insert into produto (nomeProduto, preco) values ("Placa de Video",952.50);
insert into produto (nomeProduto, preco) values ("HD",390.50);


insert into compra (fk_IdReg) values (3);

alter table compra_produto add qtd_produto int ;

insert into compra_produto (fkCompra,fkProduto,qtd_produto) values (1,3,5);
insert into compra_produto (fkCompra,fkProduto,qtd_produto) values (1,2,2);

select * from compra_produto as cp
inner join produto as p on p.IdProduto = cp.fkProduto
inner join compra as c on c.IdCompra = cp.fkCompra
inner join reg as r on r.id = c.fk_IdReg;

select * from compra;
