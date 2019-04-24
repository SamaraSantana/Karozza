package br.com.senai.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.senai.dao.FuncionarioDao;
import br.com.senai.model.Funcionario;

@Controller
public class FuncionarioController {

	private FuncionarioDao dao;

	@Autowired
	public FuncionarioController(FuncionarioDao dao) {
		this.dao = dao;
	}

	@RequestMapping("novoFuncionario")
	public String novoFuncionario(Model model) {
		model.addAttribute("loja", dao.listarLoja());
		return "formulario/cadastraFuncionario";
	}

	@RequestMapping("adicionaFuncionario")
	public String adiciona(Funcionario funcionario) {
		dao.adiciona(funcionario);
		return "redirect:novoFuncionario";
	}
	
	@RequestMapping("listaFuncionario")
	public String listaFuncionario(Model model) {
		model.addAttribute("funcionarios", dao.listar());
		return "lista/listaFuncionario";
	}
	
	@RequestMapping("alterarF")
	public String alterarF(int id, Model model, Funcionario f) {
		model.addAttribute("funcionario", dao.buscaId(id));
		model.addAttribute("loja", dao.listarLoja());
		return "altera/alteraFuncionario";
	}
	
	@RequestMapping("alterarFuncionario")
	public String alterarFuncionario(Funcionario f, Model model) {	
		dao.alterar(f);
		return "redirect:listaFuncionario";
	}
	
	@RequestMapping("removerFuncionario")
	public String removerAutomovel(Funcionario funcionario) {
		dao.remover(funcionario);
		return "redirect:listaFuncionario";
	}
}
