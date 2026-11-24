# CRUD de Miniaturas dentro do Portfolio1

# Portfolio1 — CRUD de Miniaturas

Funcionalidade CRUD (Create, Read, Update, Delete) acrescentada ao projeto **Portfolio1**,
desenvolvida com **Java, Servlets, JSP e JDBC** seguindo o padrão **MVC**.

O CRUD cadastra uma coleção de miniaturas de carros, organizadas em quatro listas:
HotWheels Mainline, HotWheels Premium, Matchbox e Outras Marcas.

## Funcionalidades

| Operação | O que faz |
|---|---|
| **Create** | Cadastra uma miniatura (quantidade, marca, modelo, cor, ano, categoria e imagem) |
| **Read** | Lista as miniaturas em quatro tabelas, uma por categoria, com a imagem de cada uma |
| **Update** | Edita os dados, muda a categoria, troca a imagem ou remove a imagem |
| **Delete** | Exclui a miniatura, com confirmação |

Validações feitas no servidor:

- Quantidade: número inteiro positivo.
- Marca e cor: apenas letras.
- Modelo: obrigatório.
- Ano: 4 dígitos e não pode ser futuro.
- Imagem: obrigatória no cadastro; aceita JPEG, PNG, GIF e WebP, com até 2 MB.

As mensagens de erro aparecem na própria tela e os campos preenchidos são mantidos.

## Arquitetura (MVC)

Todos os arquivos novos ficam no pacote `br.edu.ifc.videira.miniaturas`.

| Camada | Arquivo | Responsabilidade |
|---|---|---|
| Model | `model/Miniatura.java`, `model/Categoria.java`, `model/Imagem.java` | Dados da miniatura, categorias e imagem |
| DAO | `dao/MiniaturaDAO.java` | Todo o SQL do CRUD, com `PreparedStatement` |
| Util | `util/Conexao.java` | Conexão JDBC com o MySQL |
| Controller | `controller/MiniaturaServlet.java` | Recebe as requisições, valida e chama o DAO |
| Controller | `controller/ImagemServlet.java` | Entrega a imagem de uma miniatura (`/miniaturas/imagem?id=`) |
| View | `webapp/WEB-INF/views/miniaturas/listar.jsp` | Formulário de cadastro e as quatro tabelas |
| View | `webapp/WEB-INF/views/miniaturas/editar.jsp` | Formulário de edição |
| Estilo | `webapp/css/miniaturas.css` | CSS da aplicação |

O fluxo segue o padrão Post-Redirect-Get: depois de criar, editar ou excluir, o Servlet
redireciona para a lista, e a mensagem de sucesso aparece uma única vez.

## Tecnologias

Java 17 ou superior, Jakarta Servlet / JSP / JSTL, JDBC, MySQL (MariaDB), Maven,
Apache Tomcat 11 e CSS.

## Banco de dados

O arquivo `portfolio.sql`, na raiz do repositório, contém o banco completo.
Além das tabelas do projeto (`usuario`, `postagem` e `project`), ele inclui a tabela `miniatura`:

| Coluna | Tipo | Observação |
|---|---|---|
| `id` | INT | Chave primária, auto incremento |
| `categoria` | TINYINT | 1 Mainline, 2 Premium, 3 Matchbox, 4 Outras (`CHECK` de 1 a 4) |
| `quantidade` | INT | `CHECK` maior que 0 |
| `marca`, `modelo`, `cor` | VARCHAR | |
| `ano` | SMALLINT | |
| `imagem` | MEDIUMBLOB | Imagem guardada no próprio banco |
| `imagem_tipo` | VARCHAR(50) | Tipo MIME, por exemplo `image/png` |

## Como executar

**Requisitos:** JDK 17 ou superior, Maven, Tomcat 11 e MySQL (por exemplo, o do XAMPP).

1. Inicie o **MySQL**.
2. No phpMyAdmin, crie o banco `portfolio` (collation `utf8mb4_general_ci`) e importe o `portfolio.sql`.
3. Confira o usuário e a senha em `util/Conexao.java` (padrão do XAMPP: usuário `root`, sem senha).
4. Na raiz do projeto, compile:
   ```
   mvn clean package
   ```
5. Copie `target/Portfolio1.war` para a pasta `webapps` do Tomcat 11 e inicie o servidor.
6. Acesse:
   ```
   http://localhost:8080/Portfolio1/miniaturas
   ```

## Alterações feitas no projeto base

- **`pom.xml`:** a versão do Java foi ajustada de 23 para 17, para compilar e rodar em
  ambientes com JDK ou Tomcat em Java 17 ou 21.
- **`controller/ProjetoController.java`:** foi removida a linha `import dao.CadastroProjetos;`.
  A classe não existe no projeto base e impedia a compilação. O restante do arquivo não foi alterado.

## Observações

- As consultas usam `PreparedStatement`, e os dados exibidos nas JSPs são escapados com
  `<c:out>`, o que evita SQL Injection e XSS.
- A imagem fica no banco (`MEDIUMBLOB`). Se o MySQL recusar imagens grandes, aumente o
  `max_allowed_packet` no arquivo `my.ini` do XAMPP.
- A raiz `http://localhost:8080/Portfolio1/` não tem página inicial, porque o projeto base
  não define uma. A aplicação é acessada em `/miniaturas`.