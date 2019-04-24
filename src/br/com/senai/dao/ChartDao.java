package br.com.senai.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartDao {
	private Connection conexao;

	@Autowired
	public ChartDao(DataSource data) {
		try {
			this.conexao = data.getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	// Ranking de uso Veiculo
	public int usoVeiculoMatriz() {
		int usoVeiculo = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) from exemplar, locacao, loja where locacao.Exemplar_id = exemplar.id and exemplar.Loja_id = loja.id and loja.tipo = 'Matriz'");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				usoVeiculo = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return usoVeiculo;
	}
	
	public int usoVeiculoFilial() {
		int usoVeiculo = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) from exemplar, locacao, loja where locacao.Exemplar_id = exemplar.id and exemplar.Loja_id = loja.id and loja.tipo = 'Filial'");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				usoVeiculo = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return usoVeiculo;
	}
	
	public String veiculoMatriz() {
		String veiculo = "";
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select distinct automovel.modelo from exemplar, locacao, automovel, loja where locacao.Exemplar_id = exemplar.id and exemplar.Automovel_id = automovel.id and exemplar.loja_id = loja.id and loja.tipo = 'Matriz'");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				veiculo = rs.getString("automovel.modelo");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return veiculo;
	}
	
	public String veiculoFilial() {
		String veiculo = "";
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select distinct automovel.modelo from exemplar, locacao, automovel, loja where locacao.Exemplar_id = exemplar.id and exemplar.Automovel_id = automovel.id and exemplar.loja_id = loja.id and loja.tipo = 'Filial'");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				veiculo = rs.getString("automovel.modelo");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return veiculo;
	}
	
	// Loja
	public int totalMatriz() {
		int matriz = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) from locacao, loja where locacao.local_Reserva = loja.id and loja.tipo = 'Matriz'");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				matriz = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return matriz;
	}
	
	public int totalFilial() {
		int filial = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) from locacao, loja where locacao.local_Reserva = loja.id and loja.tipo = 'Filial'");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				filial = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return filial;
	}
	
	// Veiculos
	public int exemplaresTotal() {
		int exemplarDisponivel = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) from exemplar");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				exemplarDisponivel = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return exemplarDisponivel;
	}
	
	public int exemplaresDisponiveis() {
		int exemplarDisponivel = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) from exemplar where status='disponivel'");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				exemplarDisponivel = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return exemplarDisponivel;
	}
	
	public int exemplaresAlugados() {
		int exemplarAlugado = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) from exemplar where status='alugados'");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				exemplarAlugado = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return exemplarAlugado;
	}

	public int exemplaresManutencao() {
		int exemplarManutencao = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) from exemplar where status='manutencao'");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				exemplarManutencao = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return exemplarManutencao;
	}

	
	// Chart Locação Info
	public int veiculosNaoEntregues() {
		int naoEntregue = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement(" select count(*) as naoEntregue from devolucao, locacao where locacao.id = devolucao.Locacao_id and devolucao.data_Devolucao != locacao.data_Prevista");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				naoEntregue = rs.getInt("naoEntregue");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return naoEntregue;
	}
	
	public int veiculosEntregues() {
		int entregue = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement(" select count(*) as entregue from devolucao, locacao where locacao.id = devolucao.Locacao_id and devolucao.data_Devolucao = locacao.data_Prevista");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				entregue = rs.getInt("entregue");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return entregue;
	}
	
	public int veiculosDataAtual() {
		int entregueHoje = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) as entregueHoje from locacao where locacao.data_Prevista = curdate()");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				entregueHoje = rs.getInt("entregueHoje");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return entregueHoje;
	}

	// Chart Locação Feitas
	public int chartJaneiro() {
		int janeiro = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) as janeiro from locacao where data_Prevista like ('%-01-%')");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				janeiro = rs.getInt("janeiro");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return janeiro;
	}
	
	public int chartFevereiro() {
		int fevereiro = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) as fevereiro from locacao where data_Prevista like ('%-02-%')");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				fevereiro = rs.getInt("fevereiro");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return fevereiro;
	}
	
	public int chartMarco() {
		int marco = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) as marco from locacao where data_Prevista like ('%-03-%')");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				marco = rs.getInt("marco");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return marco;
	}

	public int chartAbril() {
		int abril = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) as abril from locacao where data_Prevista like ('%-04-%')");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				abril = rs.getInt("abril");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return abril;
	}
	
	public int chartMaio() {
		int maio = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) as maio from locacao where data_Prevista like ('%-05-%')");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				maio = rs.getInt("maio");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return maio;
	}
	
	public int chartJunho() {
		int junho = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) as junho from locacao where data_Prevista like ('%-06-%')");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				junho = rs.getInt("junho");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return junho;
	}
	
	public int chartJulho() {
		int julho = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) as julho from locacao where data_Prevista like ('%-07-%')");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				julho = rs.getInt("julho");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return julho;
	}
	
	public int chartAgosto() {
		int agosto = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) as agosto from locacao where data_Prevista like ('%-08-%')");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				agosto = rs.getInt("agosto");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return agosto;
	}
	
	public int chartSetembro() {
		int setembro = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) as setembro from locacao where data_Prevista like ('%-09-%')");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				setembro = rs.getInt("setembro");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return setembro;
	}
	
	public int chartOutubro() {
		int outubro = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) as outubro from locacao where data_Prevista like ('%-10-%')");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				outubro = rs.getInt("outubro");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return outubro;
	}
	
	public int chartNovembro() {
		int novembro = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) as novembro from locacao where data_Prevista like ('%-11-%')");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				novembro = rs.getInt("novembro");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return novembro;
	}
	
	public int chartDezembro() {
		int dezembro = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) as dezembro from locacao where data_Prevista like ('%-12-%')");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				dezembro = rs.getInt("dezembro");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return dezembro;
	}
}
