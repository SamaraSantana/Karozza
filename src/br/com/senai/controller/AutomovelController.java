package br.com.senai.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.senai.dao.AutomovelDao;
import br.com.senai.model.Automovel;

@Controller
public class AutomovelController {

	private AutomovelDao dao;

	@Autowired
	public AutomovelController(AutomovelDao dao) {
		this.dao = dao;
	}

	@RequestMapping("novoAutomovel")
	public String novoAutomovel(Model model) {
		model.addAttribute("grupo", dao.listarGrupo());
		return "formulario/cadastraAutomovel";
	}

	@RequestMapping("adicionaAutomovel")
	public String adiciona(Automovel automovel) {
		dao.adiciona(automovel);
		return "redirect:novoAutomovel";
	}

	@RequestMapping("listaAutomovel")
	public String listaAutomovel(Model model) {
		model.addAttribute("automoveis", dao.listar());
		return "lista/listaAutomovel";
	}

	@RequestMapping("alterarA")
	public String alterarA(int id, Model model, Automovel a) {
		model.addAttribute("automovel", dao.buscaId(id));
		model.addAttribute("grupo", dao.listarGrupo());
		return "altera/alteraAutomovel";
	}

	@RequestMapping("alterarAutomovel")
	public String alterarAutomovel(Automovel a, Model model) {
		dao.alterar(a);
		return "redirect:listaAutomovel";
	}

	@RequestMapping("removerAutomovel")
	public String removerAutomovel(Automovel automovel) {
		dao.remover(automovel);
		return "redirect:listaAutomovel";
	}
}
