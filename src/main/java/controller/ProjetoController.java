package controller;

import java.util.Map;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

@WebServlet(name = "ProjetoController",urlPatterns = {"/ProjetoController", "/cadastroProjeto", "/listaProjeto", "/editarProjeto", "/selecaoProjeto", "/excluirProjeto"})
public class ProjetoController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /*
     * Mapa utilizado para associar as rotas às páginas JSP.
     *
     * Exemplo:
     *
     * /cadastroProjeto → cadastroProjeto.jsp
     *
     * O Map é utilizado aqui para evitar a necessidade de criar
     * vários blocos if/else apenas para encaminhar o usuário
     * para uma página.
     */
    private Map<String, String> rotas;
  
}
