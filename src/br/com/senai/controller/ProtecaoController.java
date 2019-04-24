package br.com.senai.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import br.com.senai.dao.ProtecaoDao;
import br.com.senai.model.Protecao;

@Controller
public class ProtecaoController {

	private ProtecaoDao dao;

	@Autowired
	public ProtecaoController(ProtecaoDao dao) {
		this.dao = dao;
	}

	@RequestMapping("novaProtecao")
	public String novaProtecao() {
		return "formulario/cadastraProtecao";
	}

	@RequestMapping("adicionaProtecao")

	public String adicionaProtecao(Protecao protecao, MultipartFile arquivo) {
		if (!arquivo.isEmpty()) {
			try {
				protecao.setFoto(arquivo.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		dao.adiciona(protecao);
		return "redirect:novaProtecao";

	}

	@RequestMapping("listaProtecao")
	public String listaProtecao(Model model) {
		model.addAttribute("protecoes", dao.listaProtecao());
		return "lista/listaProtecao";
	}

	@RequestMapping("removerProtecao")
	public String removerProtecao(Protecao protecao) {
		dao.remover(protecao);
		return "redirect:listaProtecao";

	}

	@RequestMapping("alterarP")
	public String alterarP(long id, Model model, Protecao p) {
		model.addAttribute("protecao", dao.buscaId(id));
		return "altera/alteraProtecao";
	}

	@RequestMapping("alterarProtecao")
	public String alterarProtecao(Protecao p, Model model) {
		dao.alterarProtecao(p);
		return "redirect:listaProtecao";
	}

}
