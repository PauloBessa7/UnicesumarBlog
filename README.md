
# UnicesuBlog - Projeto para a Disciplina de Imersão Profissional

## Aplicação com TypeScript, Express e MySQL

### Documento de Requisitos

Especificação de Requisitos e Avaliação Bimestral

Video de como funcionar o sistema [https://youtu.be/dliA9qIJ2lc]

---

## Passo 1: Configuração Inicial do Projeto com TypeScript

1. **Criando o Diretório do Projeto**  
   Inicie criando o diretório do projeto e entre nele:
   ```bash
   mkdir mysql-api-ads
   cd mysql-api-ads
   npm init -y
   ```

2. **Instalando Pacotes Necessários**  
   Instale os pacotes essenciais:
   ```bash
   npm install express ejs mysql2
   ```

3. **Adicionando TypeScript e Tipos para Express**  
   Instale o TypeScript e os tipos necessários:
   ```bash
   npm install typescript ts-node @types/node @types/express @types/mysql --save-dev
   ```

4. **Gerando e Configurando o Arquivo `tsconfig.json`**  
   Gere o arquivo de configuração do TypeScript:
   ```bash
   npx tsc --init
   ```
   Em seguida, altere o conteúdo do arquivo `tsconfig.json` para:
   ```json
   {
     "compilerOptions": {
       "target": "ES2023",
       "module": "commonjs",
       "strict": false,
       "esModuleInterop": true,
       "skipLibCheck": true,
       "outDir": "./dist"
     },
     "include": ["src/**/*"],
     "exclude": ["node_modules"]
   }
   ```

---

## Passo 2: Organizando a Estrutura de Pastas

Crie os diretórios necessários e o arquivo principal:
```bash
mkdir src
mkdir src/views
touch src/index.ts
```

---

## Passo 3: Desenvolvendo o Código

Implemente o código dentro de `src/index.ts` conforme o repositório de referência. Caso esse arquivo ainda não esteja no projeto, crie-o.

Também, crie os arquivos de template na pasta `src/views`, seguindo a estrutura do repositório original.

---

## Passo 4: Executando a Aplicação

Configure o script de inicialização da aplicação no arquivo `package.json`:
```json
"scripts": {
    "start": "ts-node --transpile-only src/index.ts"
}
```

Adicione um arquivo `docker-compose.yaml` na raiz do projeto, conforme o modelo fornecido no repositório de referência.

Para iniciar a aplicação, execute:
```bash
docker compose up -d
npm start
```
**Observação:** Certifique-se de que o Docker esteja ativo antes de iniciar o projeto.

---

## API Endpoints

A seguir, estão descritos os principais endpoints da API, que utilizam TypeScript, Express e MySQL, detalhando suas funcionalidades e métodos.

### 1. **Listar Usuários**

- **URL:** `/users`
- **Método:** `GET`
- **Descrição:** Retorna uma lista de usuários, incluindo ID, nome, e-mail, status (ativo), descrição do papel, e a data de criação formatada.
- **Resposta:** Renderiza a página `users/index` com a lista de usuários recuperados do banco de dados.
- **Detalhes do SQL:**
  - Realiza uma consulta `JOIN` entre as tabelas `users` e `papel` para obter o papel associado a cada usuário.
  - Ordena os resultados pelo ID do usuário em ordem crescente.
- **Tratamento de Erros:** Em caso de erro, retorna o status `500 - Internal Server Error` e exibe um log da falha no console.

```bash
GET /users
```

Exemplo de resposta esperada:
```json
[
    {
        "id": 1,
        "name": "João Silva",
        "email": "joao@example.com",
        "ativo": 1,
        "descricao": "Administrador",
        "formatted_date": "23-09-2024"
    },
    {
        "id": 2,
        "name": "Maria Souza",
        "email": "maria@example.com",
        "ativo": 0,
        "descricao": "Usuário",
        "formatted_date": "15-08-2024"
    }
]
```

---

### 2. **Formulário de Adição de Usuário**

- **URL:** `/users/add`
- **Método:** `GET`
- **Descrição:** Exibe um formulário para adicionar um novo usuário.
- **Resposta:** Renderiza a página `users/form` para entrada dos dados de um novo usuário.

```bash
GET /users/add
```

---

### 3. **Login de Usuário**

- **URL:** `/login`
- **Método:** `GET`
- **Descrição:** Exibe a página de login para os usuários entrarem no sistema.
- **Resposta:** Renderiza a página `users/login`.

```bash
GET /login
```

---

### 4. **Página Principal (Blog)**

- **URL:** `/`
- **Método:** `GET`
- **Descrição:** Exibe a página principal do blog.
- **Resposta:** Renderiza a página `users/blog`.

```bash
GET /
```

---

## Tratamento de Erros

Caso haja problemas ao recuperar os dados dos usuários no endpoint `/users`, o servidor retornará um erro 500 com a mensagem "Internal Server Error". 

---

### 5. **Adicionar Usuário**

- **URL:** `/users`
- **Método:** `POST`
- **Descrição:** Adiciona um novo usuário ao sistema com as informações fornecidas (nome, e-mail, senha, ativo, papel).
- **Resposta:** Redireciona para a lista de usuários após a adição bem-sucedida.
- **Tratamento de Erros:** Caso as senhas não coincidam ou ocorra um erro ao inserir o usuário, retorna ao formulário de adição de usuário com um status `500 - Internal Server Error` exibindo um log da falha no console.

```bash
POST /users
```

### 6. **Excluir Usuário**

- **URL:** `/users/:id/delete`
- **Método:** `POST`
- **Descrição:** Exclui um usuário específico baseado no ID fornecido.
- **Resposta:** Redireciona para a lista de usuários após a exclusão bem-sucedida.

```bash
POST /users/:id/delete
```

### 7. **Login de Usuário (Autenticação)**

- **URL:** `/login`
- **Método:** `POST`
- **Descrição:** Autentica o usuário com base no e-mail e senha fornecidos.
- **Resposta:** Se as credenciais estiverem corretas, renderiza a página principal do blog. Caso contrário, renderiza a página de login novamente.
- **Tratamento de Erros:** Caso ocorra algum erro durante a autenticação, o erro é tratado no console.

```bash
POST /login
```
