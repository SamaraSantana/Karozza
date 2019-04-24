package br.com.senai.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.senai.dao.ClienteDao;
import br.com.senai.model.Cliente;
import br.com.senai.model.ListaNegra;

@Controller
public class ClienteController {

	private ClienteDao dao;

	@Autowired
	public ClienteController(ClienteDao dao) {
		this.dao = dao;
	}

	@RequestMapping("novoCliente")
	public String novoCliente() {
		return "formulario/cadastraCliente";
	}

	@RequestMapping("adicionaCliente")
	public String adiciona(Cliente cliente) {
		dao.adiciona(cliente);
		return "redirect:novoCliente";
	}
	
	@RequestMapping("listaCliente")
	public String listaCliente(Model model) {
		model.addAttribute("clientes", dao.listar());
		return "lista/listaCliente";
	}
	
	@RequestMapping("alterarC")
	public String alterarC(int id, Model model, Cliente c) {
		model.addAttribute("cliente", dao.buscaId(id));
		return "altera/alteraCliente";
	}
	
	@RequestMapping("alterarCliente")
	public String alterarCliente(Cliente c, Model model) {	
		dao.alterar(c);
		return "redirect:listaCliente";
	}
	
	@RequestMapping("removerCliente")
	public String removerCliente(Cliente cliente) {
		dao.remover(cliente);
		return "redirect:listaCliente";
	}
		
	@RequestMapping("listaNegra")
	public String listaNegra(Model model, Cliente cliente) {
		model.addAttribute("loja", dao.listarLoja());
		model.addAttribute("cliente", dao.buscaId(cliente.getId()));
		return "formulario/listaNegra";
	}
	
	@RequestMapping("adicionaNaListaNegra")
	public String adicionaNaListaNegra(ListaNegra listaNegra) {
		dao.enviarListaNegra(listaNegra);
		return "redirect:listaCliente";
	}
	
	@RequestMapping("listaClienteListaNegra")
	public String listaClienteListaNegra(Model model) {
		model.addAttribute("listaNegra", dao.listarClientesListaNegra());
		return "lista/listaClienteListaNegra";
	}
	
}
