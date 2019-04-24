package br.com.senai.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.senai.dao.MultaDao;
import br.com.senai.model.Multa;

@Controller
public class MultaController {

	private MultaDao dao;

	@Autowired
	public MultaController(MultaDao dao) {
		this.dao = dao;
	}

	@RequestMapping("novaMulta")
	public String novoaMulta(Model model) {
		model.addAttribute("exemplar", dao.listarExemplar());
		model.addAttribute("infracao", dao.listarInfracao());
		return "formulario/cadastraMulta";
	}

	@RequestMapping("adicionaMulta")
	public String adicionaMulta(Multa multa) throws Exception {
		dao.adiciona(multa);
		return "redirect:novaMulta";
	}
	
	@RequestMapping("listaMulta")
	public String listaMulta(Model model) {
		model.addAttribute("multas", dao.listar());
		return "lista/listaMulta";
	}
	
	@RequestMapping("alterarM")
	public String alterarM(int id, Model model, Multa m) {
		model.addAttribute("multa", dao.buscaId(id));
		model.addAttribute("exemplar", dao.listarExemplar());
		model.addAttribute("infracao", dao.listarInfracao());
		return "altera/alteraMulta";
	}
	
	@RequestMapping("alterarMulta")
	public String alterarMulta(Multa m, Model model) {	
		dao.alterar(m);
		return "redirect:listaMulta";
	}
	
	@RequestMapping("removerMulta")
	public String removerMulta(Multa multa) {
		dao.remover(multa);
		return "redirect:listaMulta";
	}
}
