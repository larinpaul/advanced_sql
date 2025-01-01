CREATE DATABASE exampleDatabase;

CREATE TABLE client (
    clientID int not null
    , firstName varchar(50)
    , lastName varchar(50)
    , gender varchar(1)
    , yearsServiced int
    , discountRate float
);

INSERT INTO client
values (2, 'Kristen', 'Moss', 'F', 1, 0.01);

INSERT INTO client
values (3, 'Johny', 'Carson', 'm', 4, 0.05);

INSERT INTO client
values (3, 'Alex', 'Porter', null, 4, 0.02);
