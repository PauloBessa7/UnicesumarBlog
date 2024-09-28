CREATE TABLE users (
  id INT AUTO_INCREMENT,
  name VARCHAR(30),
  email VARCHAR(50),
  senha VARCHAR(30),  
  ativo BOOLEAN, 
  papel VARCHAR(15), 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT id_users_pk PRIMARY KEY (id)
);


INSERT INTO users(name, email, senha, ativo, papel) 
VALUES ("Paulo Bessa", "paulo.bessa@gmail.com", "Admin", true, 'Administrador');

INSERT INTO users(name, email, senha, ativo, papel) 
VALUES ("Rafael Labegalini", "rafael.labegalini@gmail.com", "123Mudar@", true, 'Administrador');

INSERT INTO users(name, email, senha, ativo, papel) 
VALUES ("Maria Silva", "maria.silva@gmail.com", "123Mudar@", true, 'Usuario');

INSERT INTO users(name, email, senha, ativo, papel) 
VALUES ("João Souza", "joao.souza@gmail.com", "123Mudar@", true, 'Usuario');

INSERT INTO users(name, email, senha, ativo, papel) 
VALUES ("Carla Ferreira", "carla.ferreira@gmail.com", "123Mudar@", true, 'Usuario');

INSERT INTO users(name, email, senha, ativo, papel) 
VALUES ("Pedro Oliveira", "pedro.oliveira@gmail.com", "123Mudar@", true, 'Usuario');

INSERT INTO users(name, email, senha, ativo, papel) 
VALUES ("Ana Lima", "ana.lima@gmail.com", "123Mudar@", true, 'Usuario');

INSERT INTO users(name, email, senha, ativo, papel) 
VALUES ("Lucas Martins", "lucas.martins@gmail.com", "123Mudar@", true, 'Usuario');
