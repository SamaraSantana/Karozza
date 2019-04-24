package br.com.senai.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.senai.dao.ListaNegraDao;
import br.com.senai.model.ListaNegra;
import br.com.senai.model.Loja;

@Controller
public class ListaNegraController {

	private ListaNegraDao dao;

	@Autowired
	public ListaNegraController(ListaNegraDao dao) {
		this.dao = dao;
	}

	@RequestMapping("novaListaNegra")
	public String novaListaNegra(Model model) {
		return "formulario/cadastraListaNegra";
	}

	@RequestMapping("adicionaListaNegra")
	public String adicionaListaNegra(ListaNegra listaNegra) {
		dao.adiciona(listaNegra);
		return "redirect:novaListaNegra";

	}
	
	
	@RequestMapping("listarListaNegra")
	public String listarListaNegra(Model model) {
		model.addAttribute("listaNegra", dao.listarListaNegra());
		return "lista/listarListaNegra";
	}

	/*
	@RequestMapping("removerListaNegra")
	public String removerListaNegra(ListaNegra listaNegra) {
		dao.remover(listaNegra);
		return "redirect:ListarListaNegra";

	}

*/
	@RequestMapping("alterarLista")
	public String alterarLista(long id, Model model, ListaNegra listaNegra) {
		model.addAttribute("listaNegra", dao.buscaId(id));
		model.addAttribute("cliente", dao.listarCliente());
		return "altera/alteraListaNegra";
	}

	@RequestMapping("alterarListaNegra")
	public String alterarListaNegra(ListaNegra listaNegra, Model model) {
		dao.alterar(listaNegra);
		return "redirect:listarListaNegra";

	}

}
