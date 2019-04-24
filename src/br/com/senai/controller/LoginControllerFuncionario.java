package br.com.senai.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.senai.dao.FuncionarioDao;
import br.com.senai.model.Funcionario;

@Controller
public class LoginControllerFuncionario {

	private final FuncionarioDao dao;

	@Autowired
	public LoginControllerFuncionario(FuncionarioDao dao) {
		this.dao = dao;
	}

	@RequestMapping("efetuaLoginFuncionario")
	public String efetuaLoginF(Funcionario funcionario, HttpSession session, Model model) {
		if (dao.existeFuncionario(funcionario) != null) {
			if (funcionario.getTipo().equals("administradorMatriz")) {
				session.setAttribute("funcionarioLogado", funcionario);
				model.addAttribute("exemplaresAlugados", dao.exemplaresAlugados());
				
				model.addAttribute("exemplaresManutencao", dao.exemplaresManutencao());
				model.addAttribute("locacoesHoje", dao.locacaoHoje());
				model.addAttribute("exemplaresDisponiveis", dao.exemplaresDisponiveis());
				model.addAttribute("janeiro", dao.chartJaneiro());
				model.addAttribute("fevereiro", dao.chartFevereiro());
				model.addAttribute("marco", dao.chartMarco());
				model.addAttribute("abril", dao.chartAbril());
				model.addAttribute("maio", dao.chartMaio());
				model.addAttribute("junho", dao.chartJunho());
				model.addAttribute("julho", dao.chartJulho());
				model.addAttribute("agosto", dao.chartAgosto());
				model.addAttribute("setembro", dao.chartSetembro());
				model.addAttribute("outubro", dao.chartOutubro());
				model.addAttribute("novembro", dao.chartNovembro());
				model.addAttribute("dezembro", dao.chartDezembro());
				
				model.addAttribute("entregue", dao.veiculosEntregues());
				model.addAttribute("naoEntregue", dao.veiculosNaoEntregues());
				model.addAttribute("entregueHoje", dao.veiculosDataAtual());
				
				model.addAttribute("total", dao.exemplaresTotal());
				model.addAttribute("disponiveis", dao.exemplaresDisponiveis());
				model.addAttribute("alugados", dao.exemplaresAlugados());
				model.addAttribute("manutencao", dao.exemplaresManutencao());
				
				model.addAttribute("totalMatriz", dao.totalMatriz());
				model.addAttribute("totalFilial", dao.totalFilial());
				
				model.addAttribute("usoVeiculoMatriz", dao.usoVeiculoMatriz());
				model.addAttribute("usoVeiculoFilial", dao.usoVeiculoFilial());
				model.addAttribute("veiculoMatriz", dao.veiculoMatriz());
				model.addAttribute("veiculoFilial", dao.veiculoFilial());
				return "index";
			} else {
			session.setAttribute("funcionarioLogado", funcionario);
			model.addAttribute("exemplaresAlugados", dao.exemplaresAlugados(Integer.parseInt(funcionario.getLoja())));		
			model.addAttribute("exemplaresManutencao", dao.exemplaresManutencao(Integer.parseInt(funcionario.getLoja())));
			model.addAttribute("locacoesHoje", dao.locacaoHoje(Integer.parseInt(funcionario.getLoja())));
			model.addAttribute("exemplaresDisponiveis", dao.exemplaresDisponiveis(Integer.parseInt(funcionario.getLoja())));
			
			model.addAttribute("janeiro", dao.chartJaneiro(Integer.parseInt(funcionario.getLoja())));
			model.addAttribute("fevereiro", dao.chartFevereiro(Integer.parseInt(funcionario.getLoja())));
			model.addAttribute("marco", dao.chartMarco(Integer.parseInt(funcionario.getLoja())));
			model.addAttribute("abril", dao.chartAbril(Integer.parseInt(funcionario.getLoja())));
			model.addAttribute("maio", dao.chartMaio(Integer.parseInt(funcionario.getLoja())));
			model.addAttribute("junho", dao.chartJunho(Integer.parseInt(funcionario.getLoja())));
			model.addAttribute("julho", dao.chartJulho(Integer.parseInt(funcionario.getLoja())));
			model.addAttribute("agosto", dao.chartAgosto(Integer.parseInt(funcionario.getLoja())));
			model.addAttribute("setembro", dao.chartSetembro(Integer.parseInt(funcionario.getLoja())));
			model.addAttribute("outubro", dao.chartOutubro(Integer.parseInt(funcionario.getLoja())));
			model.addAttribute("novembro", dao.chartNovembro(Integer.parseInt(funcionario.getLoja())));
			model.addAttribute("dezembro", dao.chartDezembro(Integer.parseInt(funcionario.getLoja())));
			
			model.addAttribute("entregue", dao.veiculosEntregues(Integer.parseInt(funcionario.getLoja())));
			model.addAttribute("naoEntregue", dao.veiculosNaoEntregues(Integer.parseInt(funcionario.getLoja())));
			model.addAttribute("entregueHoje", dao.veiculosDataAtual(Integer.parseInt(funcionario.getLoja())));
			
			model.addAttribute("totalFilial", dao.totalFilial(Integer.parseInt(funcionario.getLoja())));
			
			model.addAttribute("usoVeiculoMatriz", dao.usoVeiculoMatriz(Integer.parseInt(funcionario.getLoja())));
			model.addAttribute("usoVeiculoFilial", dao.usoVeiculoFilial(Integer.parseInt(funcionario.getLoja())));
			model.addAttribute("veiculoFilial", dao.veiculoFilial(Integer.parseInt(funcionario.getLoja())));
			}
			
			return "index";
		}
		return "redirect:loginFuncionarioo.jsp";
	}
	
	@RequestMapping("sair")
	public String sair(HttpSession session) {
		// para destruir a sessao
		session.invalidate();
		return "redirect:loginFuncionarioo.jsp";
	}

}