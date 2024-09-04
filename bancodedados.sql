create database loja;
use loja;

create table usuarios(
	id INT primary key auto_increment,
    nome VARCHAR(45),
    email VARCHAR(45) not null unique,
    senha VARCHAR(45) not null,
    cargo ENUM("A", "U") default "U"
);

insert into usuarios(nome, email, senha, cargo)
values ("Letícia Lisboa", "leticia@gmail.com", "123123", "A"),
("Amanda Ferreira", "amanda@gmail.com", "123123", "A"),
("Maria Locks", "duda@gmail.com", "123123", "A");

create table produtos(
	id INT primary key auto_increment,
    nome VARCHAR(45) not null,
    descricao VARCHAR(45) not null,
    valor DOUBLE not null
);

create table carrinho(
	id INT primary key auto_increment,
    usuarios_id INT not null,
    foreign key(usuarios_id) references usuarios(id),
    produtos_id INT not null,
    foreign key(produtos_id) references produtos(id)
);

create table favoritos(
	id INT primary key auto_increment,
	usuarios_id INT not null,
    foreign key(usuarios_id) references usuarios(id),
	produtos_id INT not null,
    foreign key(produtos_id) references produtos(id),
    favoritado TINYINT
);