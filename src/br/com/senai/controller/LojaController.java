package br.com.senai.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.senai.dao.LojaDao;
import br.com.senai.model.Loja;

@Controller
public class LojaController {

	private LojaDao dao;

	@Autowired
	public LojaController(LojaDao dao) {
		this.dao = dao;
	}

	@RequestMapping("novaLoja")
	public String novaLoja(Model model) {
		if (dao.matriz() == true) {
			return "formulario/cadastraLojaFilial";
		}
		return "formulario/cadastraLoja";
	}

	@RequestMapping("adicionaLoja")
	public String adiciona(Loja loja) {
		dao.adiciona(loja);
		return "redirect:novaLoja";
	}

	@RequestMapping("listaLoja")
	public String listaLoja(Model model) {
		model.addAttribute("lojas", dao.ListaLoja());
		return "lista/listaLoja";
	}

	@RequestMapping("removerLoja")
	public String removerLoja(Loja loja) {
		dao.remover(loja);
		return "redirect:listaLoja";
	}

	@RequestMapping("alterarL")
	public String alterar(long id, Model model, Loja loja) {
		model.addAttribute("loja", dao.buscaId(id));
		return "altera/alteraLoja";
	}

	@RequestMapping("alterarLoja")
	public String alterarContato(Loja loja, Model model) {
		dao.altera(loja);
		return "redirect:listaLoja";
	}
}