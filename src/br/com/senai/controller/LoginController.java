package br.com.senai.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.senai.dao.ClienteDao;
import br.com.senai.model.Cliente;
import br.com.senai.model.Locacao;

@Controller
public class LoginController {
	private final ClienteDao dao;

	//injecção de dependencia, localizada nos controllers e dao
	@Autowired
	public LoginController(ClienteDao dao) {
		this.dao = dao;
	}

	@RequestMapping("efetuaLogin")
	public String efetuaLogin(Cliente cliente, HttpSession session, Locacao locacao,Model model) {
		if (dao.existeContato(cliente, locacao) != null) {
			// ele recebe o nome do objeto
			session.setAttribute("usuarioLogado", cliente);
			model.addAttribute("locacao",dao.ListaLocacao());
			model.addAttribute("lojas", dao.ListaLoja());
			model.addAttribute("grupos", dao.listarGrupo());
			model.addAttribute("protecoes", dao.listarProtecao());
			model.addAttribute("opcionais", dao.listarOpcional());
			return "lista/listaLocacao";
		}
		return "redirect:index.jsp";
	}

	
}
