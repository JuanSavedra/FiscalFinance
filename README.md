# FiscalFinance

## Descrição

FiscalFinance é um sistema de gerenciamento financeiro pessoal que ajuda os usuários a controlar suas receitas, despesas e economias. A aplicação web permite que os usuários cadastrem e gerenciem suas transações financeiras e depósitos em poupança, fornecendo uma visão geral de sua saúde financeira.

## Funcionalidades

- **Dashboard:** Visualize um resumo de suas finanças, incluindo o total de receitas, despesas e economias.
- **Gerenciamento de Transações:**
    - Registre novas transações (receitas e despesas) com nome, tipo, valor e descrição.
    - Edite e exclua transações existentes.
    - Liste todas as transações para uma visão detalhada.
- **Gerenciamento de Poupança:**
    - Registre novos depósitos na poupança com descrição e valor.
    - Edite e exclua depósitos existentes.
    - Liste todos os seus depósitos.
- **Autenticação de Usuário:**
    - Crie uma conta de usuário para gerenciar suas finanças de forma privada.
    - Faça login para acessar seu dashboard e informações financeiras.

## Tecnologias Utilizadas

- **Backend:**
    - Java 8
    - Jakarta Servlet 6.1.0
    - Jakarta Mail 2.1.3 (para funcionalidades de e-mail)
- **Frontend:**
    - JSP (Jakarta Server Pages)
    - JSTL (Jakarta Standard Tag Library)
    - HTML/CSS/JavaScript
- **Banco de Dados:**
    - Oracle Database
    - OJDBC 11
- **Build e Gerenciamento de Dependências:**
    - Apache Maven

## Estrutura do Banco de Dados

O banco de dados é composto por três tabelas principais:

- `t_conta`: Armazena as informações da conta do usuário.
- `t_transacao`: Armazena os detalhes das transações financeiras.
- `t_poupanca`: Armazena as informações dos depósitos na poupança.

Para mais detalhes, consulte o arquivo `FiscalFinance.sql`.

## Imagens do Projeto
**Tela de login:**
<img width="1913" height="811" alt="Captura de tela 2025-09-29 135737" src="https://github.com/user-attachments/assets/754c42e9-7235-43fd-8cae-8727511c9c1c" />

**Página inicial:**
<img width="1912" height="430" alt="Captura de tela 2025-09-29 135753" src="https://github.com/user-attachments/assets/69c8c79c-a941-4d57-88de-e3581bb87e9b" />

**Transações:**
<img width="1913" height="726" alt="Captura de tela 2025-09-29 135807" src="https://github.com/user-attachments/assets/07687bb4-2e3f-44c5-a8be-e6c699a8e24f" />

**Depósitos:**
<img width="1914" height="517" alt="Captura de tela 2025-09-29 135818" src="https://github.com/user-attachments/assets/dea27c58-b198-49f8-9899-3e817fef5e91" />

**Adicionar:**
<img width="1916" height="796" alt="Captura de tela 2025-09-29 135829" src="https://github.com/user-attachments/assets/a85130fd-d357-4e3e-8856-a47260188ca6" />

## Como Executar o Projeto

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/seu-usuario/FiscalFinance.git
   ```
2. **Configure o banco de dados:**
   - Certifique-se de ter o Oracle Database instalado e em execução.
   - Execute o script `FiscalFinance.sql` para criar as tabelas necessárias.
   - Atualize as credenciais do banco de dados no arquivo `src/main/java/br/com/fiscalfinance/manager/ConnectionManager.java`.
3. **Compile e empacote o projeto:**
   ```bash
   mvn clean install
   ```
4. **Implante o arquivo WAR:**
   - Implante o arquivo `FiscalFinance.war` (gerado na pasta `target/`) em um servidor de aplicação compatível com Jakarta EE, como o Apache Tomcat.
5. **Acesse a aplicação:**
   - Abra seu navegador e acesse `http://localhost:8080/FiscalFinance/` (a URL pode variar dependendo da configuração do seu servidor).

## Como Usar

1. **Crie uma conta:**
   - Na página inicial, clique em "Registrar" e preencha o formulário para criar uma nova conta.
2. **Faça login:**
   - Use suas credenciais para fazer login e acessar o dashboard.
3. **Gerencie suas finanças:**
   - Use os menus de navegação para adicionar, editar e visualizar suas transações e depósitos na poupança.
