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

insert into produto (nomeProduto, preco) values ("PC GAMER",7239.00);
insert into produto (nomeProduto, preco) values ("NOTEBOOK",10449.00);
insert into produto (nomeProduto, preco) values ("MEMORIA RAM",250.00);
insert into produto (nomeProduto, preco) values ("XBOX SERIES S",2649.00);


insert into compra (fk_IdReg) values (3);

alter table compra_produto add qtd_produto int ;

insert into compra_produto (fkCompra,fkProduto,qtd_produto) values (1,3,5);
insert into compra_produto (fkCompra,fkProduto,qtd_produto) values (1,2,2);

select * from compra_produto as cp
inner join produto as p on p.IdProduto = cp.fkProduto
inner join compra as c on c.IdCompra = cp.fkCompra
inner join reg as r on r.id = c.fk_IdReg;

select * from compra;



