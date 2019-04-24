package br.com.senai.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.senai.dao.LocacaoDao;
import br.com.senai.model.Automovel;
import br.com.senai.model.Cliente;
import br.com.senai.model.Locacao;

@Controller
public class LocacaoController {

	private LocacaoDao dao;

	@Autowired
	public LocacaoController(LocacaoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("adm")
	public String adm(Model model){
		dao.exemplaresAlugados();
		
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
		
		model.addAttribute("totalMatriz", dao.totalMatriz());
		model.addAttribute("totalFilial", dao.totalFilial());
		
		model.addAttribute("entregue", dao.veiculosEntregues());
		model.addAttribute("naoEntregue", dao.veiculosNaoEntregues());
		model.addAttribute("entregueHoje", dao.veiculosDataAtual());
		
		model.addAttribute("total", dao.exemplaresTotal());
		model.addAttribute("disponiveis", dao.exemplaresDisponiveis());
		model.addAttribute("alugados", dao.exemplaresAlugados());
		model.addAttribute("manutencao", dao.exemplaresManutencao());
		
		dao.usoVeiculoFilial();
		model.addAttribute("usoVeiculoMatriz", dao.usoVeiculoMatriz());
		model.addAttribute("usoVeiculoFilial", dao.usoVeiculoFilial());
		model.addAttribute("veiculoMatriz", dao.veiculoMatriz());
		model.addAttribute("veiculoFilial", dao.veiculoFilial());
	
		return "index";
	}
	
	@RequestMapping("carrosKarozza")
	public String buy(Model model){
		model.addAttribute("lojas", dao.ListaLoja());
		model.addAttribute("grupos", dao.listarGrupo());
		model.addAttribute("protecoes", dao.listarProtecao());
		model.addAttribute("opcionais", dao.listarOpcional());
		return "modelo_carros";
	}

	@RequestMapping("buysalerent")
	public String buysalerent(Model model) {
		model.addAttribute("lojas", dao.ListaLoja());
		model.addAttribute("grupos", dao.listarGrupo());
		model.addAttribute("protecoes", dao.listarProtecao());
		model.addAttribute("opcionais", dao.listarOpcional());
		return "buysalerent";
	}

	@RequestMapping("teste")
	public String samara(Model model, HttpServletRequest request) {
		model.addAttribute("lojas", dao.ListaLoja());
		return "inicial";
	}
	

	@RequestMapping("sobreNos")
	public String sobre(Model model, HttpServletRequest request) {
		return "sobreNos";
	}

	@RequestMapping("novaLocacao")
	public String novaLocacao(Model model) {
		model.addAttribute("lojas", dao.ListaLoja());
		model.addAttribute("grupos", dao.listarGrupo());
		model.addAttribute("protecoes", dao.listarProtecao());
		model.addAttribute("opcionais", dao.listarOpcional());
		return "formulario/cadastraLocacao";
	}

	@RequestMapping("reserva")
	public String reserva(Model model, Locacao locacao) {
		model.addAttribute("lojas", dao.ListaLoja());
		model.addAttribute("grupos", dao.listarGrupo());
		model.addAttribute("protecoes", dao.listarProtecao());
		model.addAttribute("opcionais", dao.listarOpcional());

		dao.adicionaReserva(locacao);
		model.addAttribute("locacao", dao.buscaUltimoId());
		model.addAttribute("clientes", dao.buscaCliente());
		return "buysalerent";
	}

	@RequestMapping("adicionaLocacao")
	public String adiciona(Locacao locacao, Model model, Cliente cliente) {
		dao.adicionaCliente(cliente);
		dao.adiciona(locacao);
		dao.adicionaItem(locacao);
		
		model.addAttribute("resumo", dao.buscaLocacao());
		model.addAttribute("resumoGrupo", dao.buscaGrupo());
		model.addAttribute("resumoProtecao", dao.buscarProtecao());
		model.addAttribute("resumoOpcionais", dao.buscarOpcionais());
		model.addAttribute("resumoCliente", dao.buscaCliente());
		
		model.addAttribute("somaOpcionais", dao.somaOpcionais());
		
		model.addAttribute("dias", dao.diasLocacao());
		
		return "folha";
	}
	
	@RequestMapping("listaLocacao")
	public String listaLocacao(Model model) {
		model.addAttribute("locacao", dao.ListaLocacao());
		return "lista/listaLocacao";
	}
	
	@RequestMapping("listaLocacao2")
	public String listaLocacao2(Model model) {
		model.addAttribute("locacao", dao.ListaLocacaoGeral());
		return "lista/listaLocacao2";
	}
	
	@RequestMapping("removerLocacao")
	public String removerLocacao(Locacao locacao) {
		dao.remover(locacao);
		return "redirect:listaLocacao2";
	}
	
	@RequestMapping("alterarLoc")
	public String alterarA(int id, Model model, Automovel a) {
		model.addAttribute("lojas", dao.ListaLoja());
		model.addAttribute("lojaLocacao", dao.buscaLocacao(id));
		model.addAttribute("grupos", dao.listarGrupo());
		model.addAttribute("grupoLocacao", dao.buscaGrupo(id));
		model.addAttribute("protecoes", dao.listarProtecao());
		model.addAttribute("protecaoLocacao", dao.buscarProtecao(id));
		model.addAttribute("opcionais", dao.listarOpcional());
		model.addAttribute("opcionalLocacao", dao.buscarOpcionais(id));
		model.addAttribute("clientes", dao.buscaCliente(id));
		return "altera/buysalerent";
	}
	
	@RequestMapping("alterarLocF")
	public String alterarF(int id, Model model, Automovel a) {
		model.addAttribute("clientes", dao.buscaCliente(id));
		model.addAttribute("lojas", dao.ListaLoja());
		model.addAttribute("lojaLocacao", dao.buscaLocacao(id));
		model.addAttribute("grupos", dao.listarGrupo());
		model.addAttribute("grupoLocacao", dao.buscaGrupo(id));
		model.addAttribute("protecoes", dao.listarProtecao());
		model.addAttribute("protecaoLocacao", dao.buscarProtecao(id));
		model.addAttribute("opcionais", dao.listarOpcional());
		model.addAttribute("opcionalLocacao", dao.buscarOpcionais(id));
		return "altera/buysalerent2";
		
	}

	@RequestMapping("alteraLocacao")
	public String alterarLocacao(Locacao l, Model model, int id) {
		dao.altera(l);
		model.addAttribute("resumo", dao.buscaLocacao(id));
		model.addAttribute("resumoGrupo", dao.buscaGrupo(id));
		model.addAttribute("resumoProtecao", dao.buscarProtecao(id));
		model.addAttribute("resumoOpcionais", dao.buscarOpcionais(id));
		model.addAttribute("resumoCliente", dao.buscaCliente(id));		
		model.addAttribute("somaOpcionais", dao.somaOpcionais(id));
		model.addAttribute("dias", dao.diasLocacao(id));
		return "folha";
	}
	
	@RequestMapping("alteraLocacaoFuncionario")
	public String alterarLocacaoFuncionario(Locacao l, Model model, int id) {
		dao.altera(l);
		model.addAttribute("resumo", dao.buscaLocacao(id));
		model.addAttribute("resumoGrupo", dao.buscaGrupo(id));
		model.addAttribute("resumoProtecao", dao.buscarProtecao(id));
		model.addAttribute("resumoOpcionais", dao.buscarOpcionais(id));
		model.addAttribute("resumoCliente", dao.buscaCliente(id));		
		model.addAttribute("somaOpcionais", dao.somaOpcionais(id));
		model.addAttribute("dias", dao.diasLocacao(id));
		return "folha2";
	}
	
	@RequestMapping("alteraAluguelFuncionario")
	public String alterarLocacaoFuncionario2(Locacao l, Model model, int id) {
		dao.removerItemOpcional(l);
		dao.alteraAluguel(l);
		dao.adicionaItemL(l);
		model.addAttribute("resumo", dao.buscaLocacao(id));
		model.addAttribute("resumoGrupo", dao.buscaGrupo(id));
		model.addAttribute("resumoProtecao", dao.buscarProtecao(id));
		model.addAttribute("resumoOpcionais", dao.buscarOpcionais(id));
		model.addAttribute("resumoCliente", dao.buscaCliente(id));		
		model.addAttribute("somaOpcionais", dao.somaOpcionais(id));
		model.addAttribute("dias", dao.diasLocacao(id));

		dao.alteraStatusExemplar(id);
		return "folha2";
	}
	
	@RequestMapping("adicionaDevolucao")
	public String adicionaDevolucao(Locacao l, Model model, int id) {
		dao.adicionaDevolucao(l);
		model.addAttribute("resumo", dao.buscaLocacao(id));
		model.addAttribute("resumoGrupo", dao.buscaGrupo(id));
		model.addAttribute("resumoProtecao", dao.buscarProtecao(id));
		model.addAttribute("resumoOpcionais", dao.buscarOpcionais(id));
		model.addAttribute("resumoCliente", dao.buscaCliente(id));		
		model.addAttribute("somaOpcionais", dao.somaOpcionais(id));
		model.addAttribute("dias", dao.diasLocacao(id));
		
		model.addAttribute("resumoDevolucao", dao.buscaDevolucao(id));
		model.addAttribute("diasFinal", dao.diasLocacaoFinal(id));
		return "folha2";
	}
	
	@RequestMapping("aluguel")
	public String aluguel(Model model, Locacao locacao){
		model.addAttribute("lojas", dao.ListaLoja());
		model.addAttribute("grupos", dao.listarGrupo());
		model.addAttribute("exemplares", dao.listarExemplar());
		model.addAttribute("protecoes", dao.listarProtecao());
		model.addAttribute("opcionais", dao.listarOpcional());

		model.addAttribute("locacao", dao.buscaUltimoId());
		model.addAttribute("clientes", dao.buscaCliente());
		model.addAttribute("locacoes", dao.ListaLocacao());
		return "formulario/aluguel";
	}
	
	@RequestMapping("adicionaLocacaoFuncionario")
	public String adiciona2(Locacao locacao, Model model, Cliente cliente) {
		model.addAttribute("locacoes", dao.ListaLocacao());
		dao.adicionaReserva(locacao);
		dao.adicionaCliente(cliente);
		dao.adiciona(locacao);
		dao.adicionaItem(locacao);
		
		model.addAttribute("resumo", dao.buscaLocacao());
		model.addAttribute("resumoGrupo", dao.buscaGrupo());
		model.addAttribute("resumoProtecao", dao.buscarProtecao());
		model.addAttribute("resumoOpcionais", dao.buscarOpcionais());
		model.addAttribute("resumoCliente", dao.buscaCliente());
		
		model.addAttribute("somaOpcionais", dao.somaOpcionais());
		
		model.addAttribute("dias", dao.diasLocacao());

		dao.alteraStatusExemplar();
		
		return "folha2";
	}
	
	@RequestMapping("buscaLocacao")
	public String busca(Model model,int id,HttpSession session) {
		model.addAttribute("locacoes", dao.ListaLocacaoPorId(id));
		if (dao.buscarCodigo(id) != null) {
			session.setAttribute("busca", id);
			model.addAttribute("clientes", dao.buscaCliente(id));
			model.addAttribute("lojas", dao.ListaLoja());
			model.addAttribute("lojaLocacao", dao.buscaLocacao(id));
			model.addAttribute("grupos", dao.listarGrupo());
			model.addAttribute("grupoLocacao", dao.buscaGrupo(id));
			model.addAttribute("protecoes", dao.listarProtecao());
			model.addAttribute("protecaoLocacao", dao.buscarProtecao(id));
			model.addAttribute("opcionais", dao.listarOpcional());
			model.addAttribute("opcionalLocacao", dao.buscarOpcionais(id));
			model.addAttribute("exemplares", dao.listarExemplar());
			return "altera/buysalerentAluguel";
		}
		return "redirect:aluguel";
	}
	
	@RequestMapping("devolucao")
	public String devolucao(Model model,int id,HttpSession session,Locacao l) {
		model.addAttribute("locacoes", dao.ListaLocacaoPorId(id));
		if (dao.buscarCodigo(id) != null) {
			session.setAttribute("busca", id);
			model.addAttribute("resumo", dao.buscaLocacao(id));
			model.addAttribute("resumoGrupo", dao.buscaGrupo(id));
			model.addAttribute("resumoProtecao", dao.buscarProtecao(id));
			model.addAttribute("resumoOpcionais", dao.buscarOpcionais(id));
			model.addAttribute("resumoCliente", dao.buscaCliente(id));		
			model.addAttribute("somaOpcionais", dao.somaOpcionais(id));
			model.addAttribute("dias", dao.diasLocacao(id));
			
			model.addAttribute("resumoDevolucao", dao.buscaDevolucao(id));
			model.addAttribute("diasFinal", dao.diasLocacaoFinal(id));
			dao.adicionaDevolucao(l);
			return "contrato_funcionario";
		}
		return "redirect:aluguel";
	}
}