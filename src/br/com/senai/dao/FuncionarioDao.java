package br.com.senai.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.senai.model.Funcionario;
import br.com.senai.model.Loja;

@Repository
public class FuncionarioDao {
	private Connection conexao;

	@Autowired
	public FuncionarioDao(DataSource data) {
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

					veiculo = rs.getString("automovel.modelo ");
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

					veiculo = rs.getString("automovel.modelo ");
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
						.prepareStatement("select count(*) from exemplar where status='alugado'");
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
		
		public int locacaoHoje() {
			int locacoesHoje = 0;
			try {
				PreparedStatement stmt = conexao
						.prepareStatement("select count(*) as id from locacao where data_Retirada = curdate();");
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {

					locacoesHoje = rs.getInt("id");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return locacoesHoje;
		}
	
	public Funcionario login2(Funcionario funcionario) {
		if (funcionario == null) {
			throw new IllegalArgumentException("Funcionário não existe");
		}

		try {
			PreparedStatement stmt = conexao.prepareStatement("select * from funcionario where login=? and senha=?");
			stmt.setString(1, funcionario.getLogin());
			stmt.setString(2, funcionario.getSenha());
			
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				funcionario.setId(rs.getLong("id"));
				funcionario.setNome(rs.getString("nome"));
		
				funcionario.setDataNascimento(rs.getString("dataNascimento"));

				funcionario.setRg(rs.getString("rg"));
				funcionario.setCpf(rs.getString("cpf"));
				funcionario.setSexo(rs.getString("sexo"));
				funcionario.setEmail(rs.getString("email"));
				funcionario.setTelefone(rs.getString("telefone"));
				funcionario.setRua(rs.getString("rua"));
				funcionario.setNumRua(rs.getInt("numRua"));
				funcionario.setComplemento(rs.getString("complemento"));
				funcionario.setBairro(rs.getString("bairro"));
				funcionario.setCidade(rs.getString("cidade"));
				funcionario.setUf(rs.getString("uf"));
				funcionario.setCep(rs.getString("cep"));
				funcionario.setSenha(rs.getString("senha"));
				funcionario.setLogin(rs.getString("login"));
				funcionario.setTipo(rs.getString("tipo"));
				funcionario.setLoja(rs.getString("loja_id"));
			} else {
				funcionario = null;
			}
			rs.close();
			stmt.close();
			
			return funcionario;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public Funcionario login(String login, String senha) {
		Funcionario f = null;
		
		try {
			PreparedStatement stmt = conexao.prepareStatement("select * from funcionario where login=? and senha=?");
			stmt.setString(1, 
					login);
			stmt.setString(2, senha);

			ResultSet rs = stmt.executeQuery();
			
			
			if (rs.next()) {
				f = new Funcionario();
				f.setId(rs.getLong("id"));
				f.setNome(rs.getString("nome"));

				f.setDataNascimento(rs.getString("dataNascimento"));

				f.setRg(rs.getString("rg"));
				f.setCpf(rs.getString("cpf"));
				f.setSexo(rs.getString("sexo"));
				f.setEmail(rs.getString("email"));
				f.setTelefone(rs.getString("telefone"));
				f.setRua(rs.getString("rua"));
				f.setNumRua(rs.getInt("numRua"));
				f.setComplemento(rs.getString("complemento"));
				f.setBairro(rs.getString("bairro"));
				f.setCidade(rs.getString("cidade"));
				f.setUf(rs.getString("uf"));
				f.setCep(rs.getString("cep"));
				f.setSenha(rs.getString("senha"));
				f.setLogin(rs.getString("login"));
				f.setTipo(rs.getString("tipo"));
				f.setLoja(rs.getString("loja_id"));
			} else {
				f = null;
			}		
			rs.close();
			stmt.close();
			
			return f;
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public int usoVeiculoMatriz(int loja) {
		int usoVeiculo = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) from exemplar, locacao, loja where locacao.Exemplar_id = exemplar.id and exemplar.Loja_id = loja.id and loja.tipo = 'Matriz' and loja.id = ?");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				usoVeiculo = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return usoVeiculo;
	}
	
	public int usoVeiculoFilial(int loja) {
		int usoVeiculo = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) from exemplar, locacao, loja where locacao.Exemplar_id = exemplar.id and exemplar.Loja_id = loja.id and loja.tipo = 'Filial' and loja.id = ?");
			stmt.setLong(1, loja);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				usoVeiculo = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return usoVeiculo;
	}
	
	public String veiculoFilial(int loja) {
		String veiculo = "";
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select distinct exemplar.placa from exemplar, locacao, automovel, loja where locacao.Exemplar_id = exemplar.id and exemplar.Automovel_id = automovel.id and exemplar.loja_id = loja.id and loja.tipo = 'Filial' and loja.id = ?");
			stmt.setLong(1, loja);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				veiculo = rs.getString("exemplar.placa");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return veiculo;
	}
	
	
	public int totalFilial(int loja) {
		int filial = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) from locacao, loja where locacao.local_Reserva = loja.id and loja.tipo = 'Filial' and loja.id =?");
			stmt.setLong(1, loja);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				filial = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return filial;
	}
	
	// Chart Locação Info
		public int veiculosNaoEntregues(int loja) {
			int naoEntregue = 0;
			try {
				PreparedStatement stmt = conexao
						.prepareStatement("select count(*) as naoEntregue from devolucao, locacao,loja where locacao.id = devolucao.Locacao_id and devolucao.data_Devolucao != locacao.data_Prevista and locacao.local_Reserva = loja.id and loja.id =?");
				stmt.setLong(1, loja);
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {

					naoEntregue = rs.getInt("naoEntregue");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return naoEntregue;
		}
		
		public int veiculosEntregues(int loja) {
			int entregue = 0;
			try {
				PreparedStatement stmt = conexao
						.prepareStatement(" select count(*) as entregue from devolucao, locacao,loja where locacao.id = devolucao.Locacao_id and devolucao.data_Devolucao = locacao.data_Prevista and locacao.local_reserva = loja.id and loja.id = ?");
				stmt.setLong(1, loja);
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {

					entregue = rs.getInt("entregue");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return entregue;
		}
		
		public int veiculosDataAtual(int loja) {
			int entregueHoje = 0;
			try {
				PreparedStatement stmt = conexao
						.prepareStatement("select count(*) as entregueHoje from locacao,loja where locacao.data_Prevista = curdate() and locacao.local_reserva = loja.id and loja.id=?");
				stmt.setLong(1, loja);
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
		public int chartJaneiro(int loja) {
			int janeiro = 0;
			try {
				PreparedStatement stmt = conexao
						.prepareStatement("select count(*) as janeiro from locacao, loja where data_Prevista like ('%-01-%') and locacao.local_Reserva = loja.id and loja.id =?");
				stmt.setLong(1, loja);
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {

					janeiro = rs.getInt("janeiro");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return janeiro;
		}
		
		public int chartFevereiro(int loja) {
			int fevereiro = 0;
			try {
				PreparedStatement stmt = conexao
						.prepareStatement("select count(*) as fevereiro from locacao,loja where data_Prevista like ('%-02-%') and locacao.local_reserva = loja.id and loja.id =?");
				stmt.setLong(1, loja);
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {

					fevereiro = rs.getInt("fevereiro");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return fevereiro;
		}
		
		public int chartMarco(int loja) {
			int marco = 0;
			try {
				PreparedStatement stmt = conexao
						.prepareStatement("select count(*) as marco from locacao,loja where data_Prevista like ('%-03-%') and locacao.local_reserva = loja.id and loja.id =?");
				stmt.setLong(1, loja);
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {

					marco = rs.getInt("marco");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return marco;
		}

		public int chartAbril(int loja) {
			int abril = 0;
			try {
				PreparedStatement stmt = conexao
						.prepareStatement("select count(*) as abril from locacao,loja where data_Prevista like ('%-04-%') and locacao.local_reserva = loja.id and loja.id =?");
				stmt.setLong(1, loja);
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {

					abril = rs.getInt("abril");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return abril;
		}
		
		public int chartMaio(int loja) {
			int maio = 0;
			try {
				PreparedStatement stmt = conexao
						.prepareStatement("select count(*) as maio from locacao,loja where data_Prevista like ('%-05-%') and locacao.local_Reserva = loja.id and loja.id = ?");
				stmt.setLong(1, loja);
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {

					maio = rs.getInt("maio");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return maio;
		}
		
		public int chartJunho(int loja) {
			int junho = 0;
			try {
				PreparedStatement stmt = conexao
						.prepareStatement("select count(*) as junho from locacao,loja where data_Prevista like ('%-06-%') and locacao.local_reserva = loja.id and loja.id =?");
				stmt.setLong(1, loja);
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {

					junho = rs.getInt("junho");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return junho;
		}
		
		public int chartJulho(int loja) {
			int julho = 0;
			try {
				PreparedStatement stmt = conexao
						.prepareStatement("select count(*) as julho from locacao,loja where data_Prevista like ('%-07-%') and locacao.local_reserva = loja.id and loja.id =?");
				stmt.setLong(1, loja);
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {

					julho = rs.getInt("julho");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return julho;
		}
		
		public int chartAgosto(int loja) {
			int agosto = 0;
			try {
				PreparedStatement stmt = conexao
						.prepareStatement("select count(*) as agosto from locacao,loja where data_Prevista like ('%-08-%') and locacao.local_reserva = loja.id and loja.id =?");
				stmt.setLong(1, loja);
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {

					agosto = rs.getInt("agosto");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return agosto;
		}
		
		public int chartSetembro(int loja) {
			int setembro = 0;
			try {
				PreparedStatement stmt = conexao
						.prepareStatement("select count(*) as setembro from locacao,loja where data_Prevista like ('%-09-%') and locacao.local_reserva = loja.id and loja.id =? ");
				stmt.setLong(1, loja);
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {

					setembro = rs.getInt("setembro");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return setembro;
		}
		
		public int chartOutubro(int loja) {
			int outubro = 0;
			try {
				PreparedStatement stmt = conexao
						.prepareStatement("select count(*) as outubro from locacao,loja where data_Prevista like ('%-10-%') and locacao.local_reserva = loja.id and loja.id =?");
				stmt.setLong(1, loja);
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {

					outubro = rs.getInt("outubro");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return outubro;
		}
		
		public int chartNovembro(int loja) {
			int novembro = 0;
			try {
				PreparedStatement stmt = conexao
						.prepareStatement("select count(*) as novembro from locacao,loja where data_Prevista like ('%-11-%') and locacao.local_reserva = loja.id and loja.id=?");
				stmt.setLong(1, loja);
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {

					novembro = rs.getInt("novembro");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return novembro;
		}
		
		public int chartDezembro(int loja) {
			int dezembro = 0;
			try {
				PreparedStatement stmt = conexao
						.prepareStatement("select count(*) as dezembro from locacao,loja where data_Prevista like ('%-12-%') and locacao.local_reserva = loja.id and loja.id=?");
				stmt.setLong(1, loja);
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {

					dezembro = rs.getInt("dezembro");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return dezembro;
		}
	
	public int exemplaresDisponiveis(long loja) {
		int exemplarDisponivel = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) from exemplar as e, loja as l where e.loja_id = l.id and e.status ='disponivel' and l.id = ?");
			stmt.setLong(1, loja);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				exemplarDisponivel = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return exemplarDisponivel;
	}

	public int exemplaresAlugados(int loja) {
		int exemplarAlugado = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) from exemplar as e, loja as l where e.loja_id = l.id and e.status ='alugado' and l.id = ?");
			stmt.setLong(1, loja);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				exemplarAlugado = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return exemplarAlugado;
	}
	
	public int exemplaresManutencao(int loja) {
		int exemplarManutencao = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) from exemplar as e, loja as l where e.loja_id = l.id and e.status ='manutencao' and l.id = ?");
			stmt.setLong(1, loja);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				exemplarManutencao = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return exemplarManutencao;
	}

	public int locacaoHoje(int loja) {
		int locacoesHoje = 0;
		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select count(*) from locacao, exemplar where locacao.Exemplar_id = exemplar.id and data_Retirada = curdate() and exemplar.Loja_id = ?");
			stmt.setLong(1, loja);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {

				locacoesHoje = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return locacoesHoje;
	}

	public void adiciona(Funcionario funcionarios) {
		String sql = "INSERT INTO funcionario (nome,dataNascimento,rg,cpf,sexo,email,"
				+ "telefone,rua,numRua,complemento,bairro,cidade,uf,cep,senha,login,tipo,loja_id) values"
				+ "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			PreparedStatement start = conexao.prepareStatement(sql);
			start.setString(1, funcionarios.getNome());
			start.setString(2, funcionarios.getDataNascimento());
			start.setString(3, funcionarios.getRg());
			start.setString(4, funcionarios.getCpf());
			start.setString(5, funcionarios.getSexo());
			start.setString(6, funcionarios.getEmail());
			start.setString(7, funcionarios.getTelefone());
			start.setString(8, funcionarios.getRua());
			start.setInt(9, funcionarios.getNumRua());
			start.setString(10, funcionarios.getComplemento());
			start.setString(11, funcionarios.getBairro());
			start.setString(12, funcionarios.getCidade());
			start.setString(13, funcionarios.getUf());
			start.setString(14, funcionarios.getCep());
			start.setString(15, funcionarios.getSenha());
			start.setString(16, funcionarios.getLogin());
			start.setString(17, funcionarios.getTipo());
			start.setString(18, funcionarios.getLoja());

			start.execute();
			start.close();
			conexao.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void alterar(Funcionario funcionarios) {
		try {
			PreparedStatement start = conexao
					.prepareStatement("update funcionario set nome=?,dataNascimento=?,rg=?,cpf=?,sexo=?,email=?,telefone=?,rua=?,numRua=?,"
							+ "complemento=?,bairro=?,cidade=?,uf=?,cep=?,senha=?,login=?,tipo=?,loja_id=? where id=?");
			start.setString(1, funcionarios.getNome());
			start.setString(2, funcionarios.getDataNascimento());
			start.setString(3, funcionarios.getRg());
			start.setString(4, funcionarios.getCpf());
			start.setString(5, funcionarios.getSexo());
			start.setString(6, funcionarios.getEmail());
			start.setString(7, funcionarios.getTelefone());
			start.setString(8, funcionarios.getRua());
			start.setInt(9, funcionarios.getNumRua());
			start.setString(10, funcionarios.getComplemento());
			start.setString(11, funcionarios.getBairro());
			start.setString(12, funcionarios.getCidade());
			start.setString(13, funcionarios.getUf());
			start.setString(14, funcionarios.getCep());
			start.setString(15, funcionarios.getSenha());
			start.setString(16, funcionarios.getLogin());
			start.setString(17, funcionarios.getTipo());
			start.setString(18, funcionarios.getLoja());
			start.setLong(19, funcionarios.getId());

			start.execute();
			start.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public List<Funcionario> listar() {
		try {
			List<Funcionario> lista = new ArrayList<Funcionario>();
			PreparedStatement stmt = this.conexao
					.prepareStatement("select * from funcionario");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Funcionario f = new Funcionario();
				f.setId(rs.getLong("id"));
				f.setNome(rs.getString("nome"));
				f.setDataNascimento(rs.getString("dataNascimento"));
				f.setRg(rs.getString("rg"));
				f.setCpf(rs.getString("cpf"));
				f.setSexo(rs.getString("sexo"));
				f.setEmail(rs.getString("email"));
				f.setTelefone(rs.getString("telefone"));
				f.setRua(rs.getString("rua"));
				f.setNumRua(rs.getInt("numRua"));
				f.setComplemento(rs.getString("complemento"));
				f.setBairro(rs.getString("bairro"));
				f.setCidade(rs.getString("cidade"));
				f.setUf(rs.getString("uf"));
				f.setCep(rs.getString("cep"));
				f.setSenha(rs.getString("senha"));
				f.setLogin(rs.getString("login"));
				f.setTipo(rs.getString("tipo"));
				f.setLoja(rs.getString("loja_id"));

				lista.add(f);
			}
			rs.close();
			stmt.close();

			return lista;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public Funcionario buscaId(int id) {
		Funcionario f = null;
		String sql = "select * from funcionario where id = ?";
		try {
			PreparedStatement stmt = this.conexao.prepareStatement(sql);
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				f = new Funcionario();
				f.setId(rs.getLong("id"));
				f.setNome(rs.getString("nome"));

		
				f.setDataNascimento(rs.getString("dataNascimento"));

				f.setRg(rs.getString("rg"));
				f.setCpf(rs.getString("cpf"));
				f.setSexo(rs.getString("sexo"));
				f.setEmail(rs.getString("email"));
				f.setTelefone(rs.getString("telefone"));
				f.setRua(rs.getString("rua"));
				f.setNumRua(rs.getInt("numRua"));
				f.setComplemento(rs.getString("complemento"));
				f.setBairro(rs.getString("bairro"));
				f.setCidade(rs.getString("cidade"));
				f.setUf(rs.getString("uf"));
				f.setCep(rs.getString("cep"));
				f.setSenha(rs.getString("senha"));
				f.setLogin(rs.getString("login"));
				f.setTipo(rs.getString("tipo"));
				f.setLoja(rs.getString("loja_id"));
			}
			rs.close();
			stmt.close();

		} catch (Exception e) {

		}
		return f;
	}

	public List<Loja> listarLoja() {
		try {
			List<Loja> lista = new ArrayList<Loja>();
			PreparedStatement stmt = this.conexao
					.prepareStatement("select * from loja");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Loja l = new Loja();
				l.setId(rs.getLong("id"));
				l.setCnpj(rs.getString("cnpj"));
				l.setTipo(rs.getString("tipo"));
				l.setBairro(rs.getString("bairro"));

				lista.add(l);
			}
			rs.close();
			stmt.close();

			return lista;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public static java.sql.Date formataData(String data) throws Exception {
		if (data == null || data.equals(""))
			return null;
		java.sql.Date date = null;
		try {
			DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			date = new java.sql.Date(
					((java.util.Date) formatter.parse(data)).getTime());
		} catch (ParseException e) {
			throw e;
		}
		return date;
	}

	public void remover(Funcionario funcionarios) {
		try {
			PreparedStatement start = conexao
					.prepareStatement("delete from funcionario where id=?");
			start.setLong(1, funcionarios.getId());

			start.execute();
			start.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public Funcionario existeFuncionario(Funcionario funcionario) {
		if (funcionario == null) {
			throw new IllegalArgumentException("Funcionário não existe");
		}

		try {
			PreparedStatement stmt = conexao
					.prepareStatement("select * from funcionario where login=? and senha=? and tipo=?");
			stmt.setString(1, funcionario.getLogin());
			stmt.setString(2, funcionario.getSenha());
			stmt.setString(3, funcionario.getTipo());

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				funcionario.setId(rs.getLong("id"));
				funcionario.setNome(rs.getString("nome"));

		
				funcionario.setDataNascimento(rs.getString("dataNascimento"));

				funcionario.setRg(rs.getString("rg"));
				funcionario.setCpf(rs.getString("cpf"));
				funcionario.setSexo(rs.getString("sexo"));
				funcionario.setEmail(rs.getString("email"));
				funcionario.setTelefone(rs.getString("telefone"));
				funcionario.setRua(rs.getString("rua"));
				funcionario.setNumRua(rs.getInt("numRua"));
				funcionario.setComplemento(rs.getString("complemento"));
				funcionario.setBairro(rs.getString("bairro"));
				funcionario.setCidade(rs.getString("cidade"));
				funcionario.setUf(rs.getString("uf"));
				funcionario.setCep(rs.getString("cep"));
				funcionario.setSenha(rs.getString("senha"));
				funcionario.setLogin(rs.getString("login"));
				funcionario.setTipo(rs.getString("tipo"));
				funcionario.setLoja(rs.getString("loja_id"));
			} else {
				funcionario = null;
			}
			rs.close();
			stmt.close();

			return funcionario;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
