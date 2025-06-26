create table role (
    id serial primary key,
    role VARCHAR(25)
);

insert into role (role) values ('ADMIN');
insert into role (role) values ('USER');
