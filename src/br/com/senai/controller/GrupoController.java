package br.com.senai.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import br.com.senai.dao.GrupoDao;
import br.com.senai.model.Grupo;

@Controller
public class GrupoController {

	private GrupoDao dao;

	@Autowired
	public GrupoController(GrupoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("novoGrupo")
	public String novoGrupo(Model model) {
	model.addAttribute("loja", dao.listarLoja());
		return "formulario/cadastraGrupo";
	}

	@RequestMapping("adicionaGrupo")
	public String adicionaGrupo(Grupo grupo, MultipartFile arquivo) {
		if (!arquivo.isEmpty()) {
			try {
				grupo.setFoto(arquivo.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		dao.adiciona(grupo);
		return "redirect:novoGrupo";
	}
	
	@RequestMapping("listaGrupo")
	public String listaGrupo(Model model) {
		model.addAttribute("grupos", dao.listar());
		return "lista/listaGrupo";
	}
	
	@RequestMapping("alterarG")
	public String alterarG(int id, Model model, Grupo g) {
		model.addAttribute("grupo", dao.buscaId(id));
		model.addAttribute("loja", dao.listarLoja());
		return "altera/alteraGrupo";
	}
	
	@RequestMapping("alterarGrupo")
	public String alterarGrupo(Grupo g, Model model) {	
		dao.alterar(g);
		return "redirect:listaGrupo";
	}
	
	@RequestMapping("removerGrupo")
	public String removerGrupo(Grupo grupo) {
		dao.remover(grupo);
		return "redirect:listaGrupo";
	}
}
