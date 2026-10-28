# modelagem-dados-sinitro-group-dev

## A diferença entre modo conceitual, lógico e físico, e onde MER e DER entram nisso

O modelo conceitual diz quais dados serão armazenados e as regras de negócio usando uma linguagem, é o rascunho. O modelo lógico define as tabelas, chaves primárias, chaves estrangeiras e tipo de dados no geral. O modelo fisico é a implementação de fato do código SQL puro, é o que leva as coisas a funcionar de fato.

MER é o conceito, é a teoria, é feito de entidades e relacionamentos

DER é o gráfico, onde tem os desenhos, os losangos, as linhas pra você ilustrar o próprio MER.

## entidades, atributos, chave primária e chave estrangeira
- entidade — É um objeto, conceito, ação.
- Chave primaria — É a forma unica de identificar um registro de uma tabela
- Chave estrangeira — É uma chave primária de outra tabela

## relacionamentos e cardinalidade (1:1, 1:N, N:N) e como um N:N vira tabela associativa

relacionamento 1:1 (um para um) 1:N (um para muitos) N:N (muitos para muitos)

Para eles virarem uma tabela associativa é suposto você criar uma tabela nova, importar chaves estrangeiras, definir a chave primária composta e armazenar os dados depois, podendo guardar informações extras dos vinculos.

## normalização: o que é, qual problema resolve e o que caracteriza 1FN, 2FN e 3FN
A normalização classifica as informações, fazendo com que uma base de dados seja fácil de administrar e manter

1FN assegura que não haja informações repetidas em uma tabela e organiza os dados em grupos lógicos.

