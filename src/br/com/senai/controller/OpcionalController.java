package br.com.senai.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import br.com.senai.dao.OpcionalDao;
import br.com.senai.model.Opcional;

@Controller
public class OpcionalController {

	private OpcionalDao dao;

	@Autowired
	public OpcionalController(OpcionalDao dao) {
		this.dao = dao;
	}

	@RequestMapping("novoOpcional")
	public String novoOpcional() {
		return "formulario/cadastraOpcional";
	}

	@RequestMapping("adicionaOpcional")
	public String adicionaOpcional(Opcional opcional, MultipartFile arquivo) {
		if (!arquivo.isEmpty()) {
			try {
				opcional.setFoto(arquivo.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		dao.adiciona(opcional);
		return "redirect:novoOpcional";

	}

	
	@RequestMapping("listaOpcional")
	public String listaOpcional(Model model) {
		model.addAttribute("opcionais", dao.listaOpcional());
		return "lista/listaOpcional";
	}

	@RequestMapping("removerOpcional")
	public String removerOpcional(Opcional opcional) {
		dao.remover(opcional);
		return "redirect:listaOpcional";

	}

	@RequestMapping("alterarO")
	public String alterarO(long id, Model model, Opcional opcional) {
		model.addAttribute("opcional", dao.buscaId(id));
		return "altera/alteraOpcional";
	}

	@RequestMapping("alterarOpcional")
	public String alterarOpcional(Opcional opcional, Model model) {
		dao.altera(opcional);
		return "redirect:listaOpcional";
	}
	
}
