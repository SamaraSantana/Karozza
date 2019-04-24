package br.com.senai.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.senai.dao.ChartDao;

@Controller
public class ChartController {

	private ChartDao dao;

	@Autowired
	public ChartController(ChartDao dao) {
		this.dao = dao;
	}

	@RequestMapping("chart1")
	public String chart1(Model model){
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
		return "chart/locacoesFeitas";
	}
	
	@RequestMapping("chart2")
	public String chart2(Model model){
		model.addAttribute("entregue", dao.veiculosEntregues());
		model.addAttribute("naoEntregue", dao.veiculosNaoEntregues());
		model.addAttribute("entregueHoje", dao.veiculosDataAtual());
		return "chart/locacoesInfo";
	}
	
	@RequestMapping("chart3")
	public String chart3(Model model){
		model.addAttribute("total", dao.exemplaresTotal());
		model.addAttribute("disponiveis", dao.exemplaresDisponiveis());
		model.addAttribute("alugados", dao.exemplaresAlugados());
		model.addAttribute("manutencao", dao.exemplaresManutencao());
		return "chart/veiculos";
	}
	
	@RequestMapping("chart4")
	public String chart4(Model model){
		model.addAttribute("totalMatriz", dao.totalMatriz());
		model.addAttribute("totalFilial", dao.totalFilial());
		return "chart/loja";
	}
	
	@RequestMapping("chart5")
	public String chart5(Model model){
		model.addAttribute("usoVeiculoMatriz", dao.usoVeiculoMatriz());
		model.addAttribute("usoVeiculoFilial", dao.usoVeiculoFilial());
		model.addAttribute("veiculoMatriz", dao.veiculoMatriz());
		model.addAttribute("veiculoFilial", dao.veiculoFilial());
		return "chart/rankingUso";
	}
}
