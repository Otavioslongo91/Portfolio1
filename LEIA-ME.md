# CRUD de Miniaturas dentro do Portfolio1

Este pacote NÃO substitui o projeto do professor: ele é acrescentado ao Portfolio1.
Não há `pom.xml` aqui de propósito: vale o do professor (JSTL, jsp-api e MySQL já estão nele).

## 1. Pegar o projeto do professor (seu repositório)
1. Entre em https://github.com/Karli-IFC-Videira/Portfolio1 logado no GitHub e clique em **Fork**.
2. Clone o SEU fork: `git clone https://github.com/SEU_USUARIO/Portfolio1.git`

## 2. Acrescentar o CRUD
Copie a pasta `src` deste pacote para dentro da pasta do projeto, mesclando com a `src` existente.
Nada do professor é sobrescrito: tudo usa nomes novos.

| Novo arquivo | Observação |
|---|---|
| `src/main/java/br/edu/ifc/videira/miniaturas/...` | pacote próprio |
| `src/main/webapp/WEB-INF/views/miniaturas/*.jsp` | pasta própria |
| `src/main/webapp/css/miniaturas.css` | nome próprio |
| `sql/miniatura.sql` | tabela nova no banco `portfolio` |

## 3. Ajustar a versão do Java no pom.xml (se o seu JDK for 21)
O pom do professor pede Java 23. Com JDK 21 o Maven dá "release version 23 not supported".
Troque 23 por 21 em três lugares: `maven.compiler.release`, `<source>` e `<target>`.

## 4. Banco
Rode `sql/miniatura.sql` no phpMyAdmin e cole o conteúdo no final do `portfolio.sql`.

## 5. Compilar e publicar
```
mvn clean package
Copy-Item target\Portfolio1.war "C:\Program Files\Apache Software Foundation\Tomcat 11.0\webapps\"   (PowerShell como administrador)
```

## 6. Abrir
http://localhost:8080/Portfolio1/miniaturas

## Observações (testado)
- Endereço: `http://localhost:8080/Portfolio1/miniaturas` (com ou sem barra no final).
  A raiz `http://localhost:8080/Portfolio1/` dá 404 porque o projeto do professor não tem página inicial.
- `ProjetoController.java` do professor é um esqueleto que importa `dao.CadastroProjetos`,
  classe que não existe no projeto. Para compilar, apague a linha `import dao.CadastroProjetos;`.
- Não commite a pasta `target/`.
