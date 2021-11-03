-- connect to api db user dba
\c api dba

--begin work;
create schema api;
create table api.todos (
  id serial primary key,
  done boolean not null default false,
  task text not null,
  due timestamptz
);

insert into api.todos (task) values
  ('finish tutorial 0'),
  ('pat self on back');

-- create 'group' to provide grants to users
create role web_anon nologin;
grant web_anon to authenticator;
grant usage on schema api to web_anon;
grant select on api.todos to web_anon;


--commit;
