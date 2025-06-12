# 💰 Gerenciador de Conta Corrente

Aplicação web desenvolvida com **Ruby on Rails 8.0.2** para simular um sistema de conta corrente com funcionalidades de saldo, extrato, saque, depósito, transferência e mais.

---

## 🚀 Tecnologias utilizadas

- [Ruby 3.4.4](https://www.ruby-lang.org/)  
- [Rails 8.0.2](https://rubyonrails.org/)  
- [PostgreSQL](https://www.postgresql.org/)  
- [Redis](https://redis.io/)  
- [Node.js](https://nodejs.org/)
- [Yarn](https://yarnpkg.com/)
- [Visual Studio Code](https://code.visualstudio.com/)

---

## ⚙️ Pré-requisitos

Antes de começar, você precisará ter instalado:

- [Ruby 3.4.4](https://www.ruby-lang.org/)
- [Rails 8.0.2](https://rubyonrails.org/)
- [PostgreSQL](https://www.postgresql.org/)
- [Redis](https://redis.io/)
- [Node.js](https://nodejs.org/) 
- [Yarn](https://yarnpkg.com/)

---

## 🔧 Instalação

### 1. **Clone o repositório**

-  git clone https://github.com/seuusuario/gerenciador_conta_corrente.git
-  cd gerenciador_conta_corrente
  
### 2. **Abra o Visual Studio Code**
- Abra o terminal do Visual Studio Code na pasta do projeto
- No terminal, instale as dependências
  -  ```bundle install ```

### 3. **Crie e configure o banco de dados**

- No terminal, siga os passos abaixo:
  - rails db:create
  - rails db:migrate
  - rails db:seed

- Dois usuários serão criados automaticamente e o banco de dados será populado:
- O arquivo onde estão localizados os usuários é **seeds.rb**

  - Conta: 12345 | Senha: 1234 | Tipo: Normal

  - Conta: 54321 | Senha: 4321 | Tipo: VIP
 
### 4. **Rode o projeto**

- Abra o [Visual Studio Code](https://code.visualstudio.com/) na pasta do projeto
- Abra o terminal do Visual Studio Code
- Digite ```rails s``` para subir o servidor
- Abra o navegador em http://localhost:3000

### 5. **Video do projeto**

https://github.com/user-attachments/assets/93ae30dd-56af-4d38-9a9c-22229e377724


