package br.com.senai.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.senai.dao.InfracaoDao;
import br.com.senai.model.Infracao;

@Controller
public class InfracaoController {

	private InfracaoDao dao;

	@Autowired
	public InfracaoController(InfracaoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("novaInfracao")
	public String novaInfracao() {
		return "formulario/cadastraInfracao";
	}

	@RequestMapping("adicionaInfracao")
	public String adicionaInfracao(Infracao infracao) {
		dao.adiciona(infracao);
		return "redirect:novaInfracao";
	}
	
	@RequestMapping("listaInfracao")
	public String listaInfracao(Model model) {
		model.addAttribute("infracoes", dao.listar());
		return "lista/listaInfracao";
	}
	
	@RequestMapping("alterarI")
	public String alterarI(int id, Model model, Infracao i) {
		model.addAttribute("infracao", dao.buscaId(id));
		return "altera/alteraInfracao";
	}
	
	@RequestMapping("alterarInfracao")
	public String alterarInfracao(Infracao i, Model model) {	
		dao.alterar(i);
		return "redirect:listaInfracao";
	}
	
	@RequestMapping("removerInfracao")
	public String removerInfracao(Infracao infracao) {
		dao.remover(infracao);
		return "redirect:listaInfracao";
	}
}
