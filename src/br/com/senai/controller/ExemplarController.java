package br.com.senai.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import br.com.senai.dao.ExemplarDao;
import br.com.senai.model.Exemplar;

@Controller
public class ExemplarController {

	private ExemplarDao dao;

	@Autowired
	public ExemplarController(ExemplarDao dao) {
		this.dao = dao;
	}

	@RequestMapping("novoExemplar")
	public String novoExemplar(Model model) {
		model.addAttribute("loja", dao.listarLoja());
		model.addAttribute("automovel", dao.listarAutomovel());
		return "formulario/cadastraExemplar";
	}

	@RequestMapping("adicionaExemplar")
	public String adicionaExemplar(Exemplar exemplar,MultipartFile arquivo) {
		if (!arquivo.isEmpty()) {
			try {
				exemplar.setFoto(arquivo.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		dao.adiciona(exemplar);
		return "redirect:novoExemplar";
	}
	
	@RequestMapping("listaExemplar")
	public String listaExemplar(Model model) {
		model.addAttribute("exemplares", dao.listar());
		return "lista/listaExemplar";
	}
	
	@RequestMapping("alterarE")
	public String alterarE(int id, Model model, Exemplar e) {
		model.addAttribute("exemplar", dao.buscaId(id));
		model.addAttribute("loja", dao.listarLoja());
		model.addAttribute("automovel", dao.listarAutomovel());
		return "altera/alteraExemplar";
	}
	
	@RequestMapping("alterarExemplar")
	public String alterarExemplar(Exemplar e, Model model) {	
		dao.alterar(e);
		return "redirect:listaExemplar";
	}
	
	@RequestMapping("removerExemplar")
	public String removerAutomovel(Exemplar exemplar) {
		dao.remover(exemplar);
		return "redirect:listaExemplar";
	}
}
