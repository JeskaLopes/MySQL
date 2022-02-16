-- Criação do Banco de dados
create database db_game_online;

-- Seleciona o Banco de dados para conseguirmos fazer as requisições
use db_game_online;

-- Criação da primeira tabela, tabela de classes

create table tb_classes(
 id bigint auto_increment,
 nome varchar(255) not null,
 habilidade varchar(255),
 arma varchar(255),
 primary key (id)
 );
 
 -- Inserção dos dados na tabela de classes, lembrando que cada valor corresponde a uma coluna da tabela
 
 insert into tb_classes (nome, habilidade, arma) 
 values ("Feiticeiro", "Rajadão", "Cajado");
 insert into tb_classes (nome, habilidade, arma) 
 values ("Arqueiro", "Tempestade de flechas", "Arco e Flecha"); 
 insert into tb_classes (nome, habilidade, arma) 
 values ("Curandeiro", "Cura", "Poções"); 

-- Lista todas as informações da tabela de classes
select * from tb_classes;

-- Cria da segunda tabela, tabela de personagens
create table tb_personagens(
id bigint auto_increment,
nome varchar(100),
nivel int,
ataque int,
defesa int,
classe_id bigint,
primary key (id),

-- na criação da foreign key, é importante colocar a chave estrangeira do mesmo tipo de dado da chave primaria da tabela que você quer relacionar, no caso, bigint
foreign key (classe_id) references tb_classes(id)
);

-- Inserção de dados da tabela personagem
insert into tb_personagens (nome, nivel, ataque, defesa, classe_id) 
values ("Tacador de flecha", 500, 3000, 1200, 2);
INSERT INTO tb_personagens (nome, nivel, ataque, defesa, classe_id) 
VALUES ("Fada Sensata", 300, 1500, 500, 1);
INSERT INTO tb_personagens (nome, nivel, ataque, defesa, classe_id) 
VALUES ("Cura mais", 800, 2500, 4000, 3);
INSERT INTO tb_personagens (nome, nivel, ataque, defesa, classe_id) 
VALUES ("Maga Loka", 400, 1500, 500, 1);
INSERT INTO tb_personagens (nome, nivel, ataque, defesa, classe_id) 
VALUES ("Lire", 400, 3500, 500, 2);
INSERT INTO tb_personagens (nome, nivel, ataque, defesa, classe_id) 
VALUES ("Elfa Azul", 1000, 2000, 5000, 3);
INSERT INTO tb_personagens (nome, nivel, ataque, defesa, classe_id) 
VALUES ("Dany Bond", 5000, 10000, 15000, 2);


-- selects e joins

-- lista todos os personagens
select * from tb_personagem;

-- Faça um select que retorne os personagens com o poder de ataque maior do que 2000.
select * from tb_personagem where ataque > 2000;

-- Faça um select trazendo  os personagens com poder de defesa entre 1000 e 2000. Com duas maneiras de se conseguir o resultado esperado
select * from tb_personagem where defesa >=1000 and defesa < 2000;
select * from tb_personagem where defesa between 1000 and 2000;

-- Faça um select  utilizando LIKE buscando os personagens com a letra C.
-- Na parte onde temos o %, ele pode ser usado da forma "c%", indicando que procuramos nomes que começem com a letra C, ou da forma "c%", indicando que procuramos nomes que terminem com C. Usando "%c%" indicamos que queremos dados que contenham a letra C.
select * from tb_personagem where nome like "%c%";

-- Faça um um select com Inner join entre  tabela classe e personagem.
select * from tb_personagem 
inner join tb_classe on tb_classe.id = tb_personagem.id;

-- Faça um select onde traga todos os personagem de uma classe específica (exemplo todos os personagens que são arqueiros).
select * from tb_personagem 
inner join tb_classe on tb_classe.id = tb_personagem.id
where tb_classe.id = 2;




