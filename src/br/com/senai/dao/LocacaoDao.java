package br.com.senai.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.senai.model.Automovel;
import br.com.senai.model.Cliente;
import br.com.senai.model.Devolucao;
import br.com.senai.model.Exemplar;
import br.com.senai.model.Grupo;
import br.com.senai.model.Locacao;
import br.com.senai.model.Loja;
import br.com.senai.model.Opcional;
import br.com.senai.model.Protecao;

@Repository
public class LocacaoDao {
	private Connection conexao;

	@Autowired
	public LocacaoDao(DataSource data) {
		try {
			this.conexao = data.getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void alteraStatusExemplar(String status, int id) {
		try {
			PreparedStatement start = conexao
					.prepareStatement("update exemplar as e inner join locacao as l on e.id = l.exemplar_id set e.status=? where l.id=?");
			start.setString(1, status);
			start.setLong(2, id);

			start.execute();
			start.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public void removerItemOpcional(Locacao locacoes) {
		try {
			PreparedStatement start = conexao
					.prepareStatement("delete io from itemopcional as io, locacao as l where l.id = io.Locacao_id and l.id=?");
			start.setLong(1, locacoes.getId());

			start.execute();
			start.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void alteraStatusExemplar(int id) {
		try {
			PreparedStatement start = conexao
					.prepareStatement("update exemplar as e inner join locacao as l on e.id = l.exemplar_id set e.status=? where l.id=?");
			start.setString(1, "Alugado");
			start.setLong(2, id);

			start.execute();
			start.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void alteraStatusExemplar() {
		try {
			PreparedStatement start = conexao
					.prepareStatement("update exemplar as e inner join locacao as l on e.id = l.exemplar_id set e.status=? where l.id=?");
			start.setString(1, "Alugado");
			start.setLong(2, ultimoId());

			start.execute();
			start.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void adiciona(Locacao locacoes) {
		try {
			PreparedStatement start = conexao
					.prepareStatement("update locacao set local_Reserva=?,data_Retirada=?,hora_Retirada=?,data_Prevista=?,hora_Prevista=?,protecao_id=?,grupo_id=?,cliente_id=?,exemplar_id=? where id=?");
			start.setString(1, locacoes.getLocal_Reserva());
			start.setDate(2, formataData(locacoes.getData_Retirada()));
			start.setTime(3, formataHora(locacoes.getHora_Retirada()));
			start.setDate(4, formataData(locacoes.getData_Prevista()));
			start.setTime(5, formataHora(locacoes.getHora_Prevista()));
			start.setString(6, locacoes.getProtecao());
			start.setString(7, locacoes.getGrupo());
			start.setString(8, locacoes.getCliente());
			start.setString(9, locacoes.getExemplar());
			start.setLong(10, ultimoId());

			start.execute();
			start.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void adicionaCliente(Cliente cliente) {
		String sql = "INSERT INTO cliente (nome,dataNascimento,rg,cpf,sexo,email,"
				+ "telefone,tipoTelefone,rua,numRua,complemento,bairro,cidade,uf,cep,cnh,validadeCnh,emissaoCnh) values"
				+ "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try{
			PreparedStatement start = conexao.prepareStatement(sql);

			start.setString(1, cliente.getNome());
			start.setString(2, cliente.getDataNascimento());
			start.setString(3, cliente.getRg());
			start.setString(4, cliente.getCpf());
			start.setString(5, cliente.getSexo());
			start.setString(6, cliente.getEmail());
			start.setString(7, cliente.getTelefone());
			start.setString(8, cliente.getTipoTelefone());
			start.setString(9, cliente.getRua());
			start.setInt(10, cliente.getNumRua());
			start.setString(11, cliente.getComplemento());
			start.setString(12, cliente.getBairro());
			start.setString(13, cliente.getCidade());
			start.setString(14, cliente.getUf());
			start.setString(15, cliente.getCep());
			start.setString(16, cliente.getCnh());
			start.setString(17, cliente.getValidadeCnh());
			start.setString(18, cliente.getEmissaoCnh());
			start.executeUpdate();
			start.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void adicionaItem(Locacao locacoes) {
		String sql = "INSERT INTO itemOpcional (opcional_id,locacao_id)"
				+ "values(?,?)";
		try {
			PreparedStatement start = conexao.prepareStatement(sql);
			long opcional = 0;

			if (locacoes.getOpcional() != null) {
				for (int i = 0; i < locacoes.getOpcional().length; i++) {

					opcional = locacoes.getOpcional()[i];

					start.setLong(1, opcional);
					start.setLong(2, ultimoId());
					start.execute();
				}
				start.close();
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public void adicionaItemL(Locacao locacoes) {
		String sql = "INSERT INTO itemOpcional (opcional_id,locacao_id)"
				+ "values(?,?)";
		try {
			PreparedStatement start = conexao.prepareStatement(sql);
			long opcional = 0;

			if (locacoes.getOpcional() != null) {
				for (int i = 0; i < locacoes.getOpcional().length; i++) {

					opcional = locacoes.getOpcional()[i];

					start.setLong(1, opcional);
					start.setLong(2, locacoes.getId());
					start.execute();
				}
				start.close();
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void adicionaItens(Locacao locacoes) {
		String sql = "INSERT INTO itemOpcional (opcional_id,locacao_id)"
				+ "values(?,?)";
		try {
			PreparedStatement start = conexao.prepareStatement(sql);
			long opcional = 0;

			if (locacoes.getOpcional() != null) {
				for (int i = 0; i < locacoes.getOpcional().length; i++) {

					opcional = locacoes.getOpcional()[i];

					start.setLong(1, opcional);
					start.setLong(2, locacoes.getId());
					start.execute();
				}
				start.close();
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void adicionaReserva(Locacao locacoes) {
		String sql = "INSERT INTO locacao (local_Reserva,data_Retirada,hora_Retirada,data_Prevista,hora_Prevista,protecao_id,grupo_id,cliente_id,exemplar_id)"
				+ "values(?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement start = conexao.prepareStatement(sql);
			start.setString(1, locacoes.getLocal_Reserva());
			start.setDate(2, formataData(locacoes.getData_Retirada()));
			start.setTime(3, formataHora(locacoes.getHora_Retirada()));
			start.setDate(4, formataData(locacoes.getData_Prevista()));
			start.setTime(5, formataHora(locacoes.getHora_Prevista()));
			start.setString(6, 1 + "");
			start.setString(7, 1 + "");
			start.setString(8, 1 + "");
			start.setString(9, 1 + "");

			start.executeUpdate();
			start.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public int ultimoId() throws SQLException {
		String sql = "SELECT MAX(ID) as id FROM locacao";
		PreparedStatement stmt = (PreparedStatement) conexao
				.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		rs.next();
		int ultimoId = rs.getInt("id");

		rs.close();
		stmt.close();

		return ultimoId;
	}

	public int ultimoIdCliente() throws SQLException {
		String sql = "SELECT MAX(ID) as id FROM cliente";
		PreparedStatement stmt = (PreparedStatement) conexao
				.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		rs.next();
		int ultimoId = rs.getInt("id");

		rs.close();
		stmt.close();

		return ultimoId;
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

	public static java.sql.Time formataHora(String hora) throws Exception {
		if (hora == null || hora.equals(""))
			return null;
		java.sql.Time hor = null;
		try {
			DateFormat formatter = new SimpleDateFormat("HH:mm");
			hor = new java.sql.Time((formatter.parse(hora)).getTime());
		} catch (ParseException e) {
			throw e;
		}
		return hor;
	}

	public List<Loja> ListaLoja() {
		try {
			List<Loja> lojas = new ArrayList<Loja>();
			PreparedStatement stmt = this.conexao
					.prepareStatement("Select * from loja");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Loja loja = new Loja();
				loja.setId((int) rs.getLong("id"));
				loja.setCnpj(rs.getString("cnpj"));
				loja.setTelefone(rs.getString("telefone"));
				loja.setRua(rs.getString("rua"));
				loja.setNumRua(rs.getString("numRua"));
				loja.setComplemento(rs.getString("complemento"));
				loja.setBairro(rs.getString("bairro"));
				loja.setCidade(rs.getString("cidade"));
				loja.setUf(rs.getString("uf"));
				loja.setCep(rs.getString("cep"));
				loja.setTipo(rs.getString("tipo"));
				lojas.add(loja);
			}
			rs.close();
			stmt.close();
			return lojas;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Exemplar> listarExemplar() {
		try {
			List<Exemplar> exemplares = new ArrayList<Exemplar>();
			PreparedStatement stmt = this.conexao
					.prepareStatement("Select * from Exemplar,automovel,grupo where exemplar.automovel_id = automovel.id and automovel.grupo_id = grupo.id and exemplar.status='disponivel'");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Exemplar exemplar = new Exemplar();
				exemplar.setId((int) rs.getLong("id"));
				exemplar.setPlaca(rs.getString("placa"));
				exemplar.setFoto(rs.getBytes("foto"));
				exemplar.setLoja(rs.getString("loja_id"));
				exemplar.setAutomovel(rs.getString("grupo.nome"));
				exemplar.setCor(rs.getString("automovel.modelo"));
				exemplar.setStatus(rs.getString("status"));
				exemplares.add(exemplar);
			}
			rs.close();
			stmt.close();
			return exemplares;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Automovel> listarAutomovel() {
		try {
			List<Automovel> lista = new ArrayList<Automovel>();
			PreparedStatement stmt = this.conexao
					.prepareStatement("select * from automovel, grupo where grupo.id = automovel.grupo_id");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Automovel a = new Automovel();
				a.setId(rs.getLong("id"));
				a.setMarca(rs.getString("marca"));
				a.setModelo(rs.getString("modelo"));
				a.setAno(rs.getString("ano"));
				a.setMotor(rs.getString("motor"));
				a.setTransmissao(rs.getString("transmissao"));
				a.setBombaCombustivel(rs.getString("bombaCombustivel"));
				a.setGrupo(rs.getString("grupo.nome"));

				lista.add(a);
			}
			rs.close();
			stmt.close();

			return lista;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public List<Protecao> listarProtecao() {
		try {
			List<Protecao> protecoes = new ArrayList<Protecao>();
			PreparedStatement stmt = this.conexao
					.prepareStatement("Select * from protecao");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Protecao protecao = new Protecao();
				protecao.setId((int) rs.getLong("id"));
				protecao.setDescricao(rs.getString("descricao"));
				protecao.setPreco(rs.getDouble("preco"));
				protecao.setFoto(rs.getBytes("foto"));

				protecoes.add(protecao);

			}
			rs.close();
			stmt.close();
			return protecoes;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Opcional> listarOpcional() {
		try {
			List<Opcional> opcionais = new ArrayList<Opcional>();
			PreparedStatement stmt = this.conexao
					.prepareStatement("Select * from opcional");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Opcional opcional = new Opcional();
				opcional.setId((int) rs.getLong("id"));
				opcional.setNome(rs.getString("nome"));
				opcional.setPreco(rs.getDouble("preco"));
				opcional.setFoto(rs.getBytes("foto"));

				opcionais.add(opcional);

			}
			rs.close();
			stmt.close();
			return opcionais;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Grupo> listarGrupo() {
		try {
			List<Grupo> lista = new ArrayList<Grupo>();
			PreparedStatement stmt = this.conexao
					.prepareStatement("select * from grupo");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Grupo g = new Grupo();
				g.setId(rs.getInt("id"));
				g.setNome(rs.getString("nome"));
				g.setDescricao(rs.getString("descricao"));
				g.setPreco(rs.getDouble("preco"));
				g.setFoto(rs.getBytes("foto"));
				g.setLoja(rs.getString("loja_id"));

				lista.add(g);
			}
			rs.close();
			stmt.close();

			return lista;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public Locacao buscaId(long id) {
		Locacao l = null;
		String sql = "select * from locacao where id = ?";
		try {
			PreparedStatement stmt = this.conexao.prepareStatement(sql);
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				l = new Locacao();
				l.setId(rs.getLong("id"));
			}
			rs.close();
			stmt.close();

		} catch (Exception e) {

		}
		return l;
	}

	public Locacao buscarCodigo(int id) {
		System.out.println("passou aqui");
		System.out.println(id);
		Locacao l = null;
		String sql = "SELECT * FROM locacao WHERE id =?";
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				l = new Locacao();
				l.setId(Integer.parseInt(rs.getString("id")));
			}
			stmt.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return l;
	}

	public Locacao buscaUltimoId() {
		Locacao l = null;
		String sql = "select * from locacao, protecao, grupo where locacao.Protecao_id = protecao.id and locacao.Grupo_id = grupo.id and locacao.id = ?";
		try {
			PreparedStatement stmt = this.conexao.prepareStatement(sql);
			stmt.setLong(1, ultimoId());
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				l = new Locacao();
				l.setId(rs.getLong("locacao.id"));
				l.setLocal_Reserva(rs.getString("local_Reserva"));

				Date g = rs.getDate("data_Retirada");
				SimpleDateFormat formata = new SimpleDateFormat("dd/MM/yyyy");
				l.setData_Retirada(formata.format(g));

				Time t = rs.getTime("hora_Retirada");
				SimpleDateFormat formata3 = new SimpleDateFormat("HH:mm");
				l.setHora_Retirada(formata3.format(t));

				Date g2 = rs.getDate("data_Prevista");
				SimpleDateFormat formata2 = new SimpleDateFormat("dd/MM/yyyy");
				l.setData_Prevista(formata2.format(g2));
				
				
				Time t2 = rs.getTime("hora_Retirada");
				SimpleDateFormat formata4 = new SimpleDateFormat("HH:mm");
				
				l.setHora_Prevista(formata4.format(t2));

				l.setGrupo(rs.getString("grupo.preco"));
				l.setProtecao(rs.getString("protecao.preco"));
			}
			rs.close();
			stmt.close();

		} catch (Exception e) {

		}
		return l;
	}

	// Resumo da Locação
	public Locacao buscaLocacao() {
		Locacao l = null;
		String sql = "select l.id, l.data_Retirada, l.hora_Retirada, l.data_Prevista, l.hora_Prevista, loja.bairro, c.id as cliente_id, p.id as protecao_id, g.id as grupo_id from locacao as l, loja, cliente as c, protecao as p, grupo as g where loja.id = l.local_Reserva and l.cliente_id = c.id and l.protecao_id = p.id and l.grupo_id = g.id and l.id = ?";
		try {
			PreparedStatement stmt = this.conexao.prepareStatement(sql);
			stmt.setLong(1, ultimoId());
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				l = new Locacao();
				l.setId(rs.getLong("l.id"));
				l.setLocal_Reserva(rs.getString("loja.bairro"));

				Date g = rs.getDate("l.data_Retirada");
				SimpleDateFormat formata = new SimpleDateFormat("dd/MM/yyyy");
				l.setData_Retirada(formata.format(g));

				Time t = rs.getTime("l.hora_Retirada");
				SimpleDateFormat formata3 = new SimpleDateFormat("HH:mm");
				l.setHora_Retirada(formata3.format(t));

				Date g2 = rs.getDate("l.data_Prevista");
				SimpleDateFormat formata2 = new SimpleDateFormat("dd/MM/yyyy");
				l.setData_Prevista(formata2.format(g2));

				Time t2 = rs.getTime("l.hora_Prevista");
				SimpleDateFormat formata4 = new SimpleDateFormat("HH:mm");
				l.setHora_Prevista(formata4.format(t2));

				l.setProtecao(rs.getString("p.id"));
				l.setGrupo(rs.getString("g.id"));
				l.setCliente(rs.getString("c.id"));
			}
			rs.close();
			stmt.close();

		} catch (Exception e) {

		}
		return l;
	}

	public Cliente buscaCliente() {
		Cliente c = null;
		String sql = "select * from cliente where id = ?";
		try {
			PreparedStatement stmt = this.conexao.prepareStatement(sql);
			stmt.setLong(1, ultimoIdCliente());
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				c = new Cliente();
				c.setId(rs.getLong("id"));
				c.setNome(rs.getString("nome"));
				c.setRg(rs.getString("rg"));
				c.setCpf(rs.getString("cpf"));
				c.setSexo(rs.getString("sexo"));
				c.setEmail(rs.getString("email"));
				c.setTelefone(rs.getString("telefone"));
				c.setTipoTelefone(rs.getString("tipoTelefone"));
				c.setDataNascimento(rs.getString("dataNascimento"));
				c.setRua(rs.getString("rua"));
				c.setNumRua(rs.getInt("numRua"));
				c.setComplemento(rs.getString("complemento"));
				c.setBairro(rs.getString("bairro"));
				c.setCidade(rs.getString("cidade"));
				c.setUf(rs.getString("uf"));
				c.setCep(rs.getString("cep"));
				c.setCnh(rs.getString("cnh"));
				c.setValidadeCnh(rs.getString("validadeCnh"));
				c.setEmissaoCnh(rs.getString("emissaoCnh"));
			}
			rs.close();
			stmt.close();

		} catch (Exception e) {

		}
		return c;
	}

	public int diasLocacao() {
		int day = 0, day2 = 0;
		int month = 0, month2 = 0;
		int dayFinal = 0;
		String sql = "select data_Retirada, data_Prevista from locacao where id = ?";
		try {
			PreparedStatement stmt = this.conexao.prepareStatement(sql);
			stmt.setLong(1, ultimoId());
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {

				Calendar c = Calendar.getInstance();
				Date g2 = rs.getDate("data_Prevista");
				c.setTime(g2);
				day = c.get(Calendar.DAY_OF_MONTH);
				month = c.get(Calendar.MONTH);

				Calendar c2 = Calendar.getInstance();
				Date g = rs.getDate("data_Retirada");
				c2.setTime(g);
				day2 = c2.get(Calendar.DAY_OF_MONTH);
				month2 = c2.get(Calendar.MONTH);

				if (month2 < month) {
					dayFinal = day + (31 - day2);
				} else {
					dayFinal = day - day2;
				}
			}
			rs.close();
			stmt.close();

		} catch (Exception e) {

		}
		return dayFinal;
	}

	public Grupo buscaGrupo() {
		Grupo g = null;
		String sql = "select g.id, g.nome, g.descricao, g.preco, g.foto from grupo as g, locacao where locacao.id = ?";
		try {
			PreparedStatement stmt = this.conexao.prepareStatement(sql);
			stmt.setInt(1, ultimoId());
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				g = new Grupo();
				g.setId(rs.getInt("g.id"));
				g.setNome(rs.getString("g.nome"));
				g.setDescricao(rs.getString("g.descricao"));
				g.setPreco(rs.getDouble("g.preco"));
				g.setFoto(rs.getBytes("g.foto"));
			}
			rs.close();
			stmt.close();

		} catch (Exception e) {

		}
		return g;
	}

	public Protecao buscarProtecao() {

		Protecao p = null;
		String sql = "select p.id, p.descricao, p.preco from protecao as p, locacao where locacao.id = ?";
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setLong(1, ultimoId());
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				p = new Protecao();
				p.setId(rs.getInt("p.id"));
				p.setDescricao(rs.getString("p.descricao"));
				p.setPreco(rs.getDouble("p.preco"));

			}
			stmt.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return p;
	}

	public List<Opcional> buscarOpcionais() {
		try {
			List<Opcional> opcionais = new ArrayList<Opcional>();
			String sql = "select o.id, o.nome, o.preco from locacao as l, opcional as o, itemopcional as io where l.id = io.Locacao_id and o.id = io.Opcional_id and l.id = ?";
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setLong(1, ultimoId());
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Opcional o = new Opcional();
				o.setId((int) rs.getLong("o.id"));
				o.setNome(rs.getString("o.nome"));
				o.setPreco(rs.getDouble("o.preco"));

				opcionais.add(o);
			}
			rs.close();
			stmt.close();
			return opcionais;

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public double somaOpcionais() {
		try {
			List<Double> n = new ArrayList<Double>();
			String sql = "select o.id, o.nome, o.preco from locacao as l, opcional as o, itemopcional as io where l.id = io.Locacao_id and o.id = io.Opcional_id and l.id = ?";
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setLong(1, ultimoId());
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				n.add(rs.getDouble("o.preco"));
			}
			double total = 0;
			for (double k : n)
				total = total + k;

			rs.close();
			stmt.close();
			return total;

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void remover(Locacao locacao) {
		try {

			PreparedStatement stmt = conexao
					.prepareStatement("delete from locacao where id=?");
			stmt.setLong(1, locacao.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}

	public List<Locacao> ListaLocacao() {
		try {
			List<Locacao> locacoes = new ArrayList<Locacao>();
			PreparedStatement stmt = this.conexao
					.prepareStatement("Select * from locacao");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Locacao locacao = new Locacao();
				locacao.setId((int) rs.getLong("id"));
				locacao.setGrupo(rs.getString("grupo_id"));
				locacao.setProtecao(rs.getString("protecao_id"));

				locacoes.add(locacao);

			}
			rs.close();
			stmt.close();
			return locacoes;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	public List<Locacao> ListaLocacaoGeral() {
		try {
			List<Locacao> locacoes = new ArrayList<Locacao>();
			PreparedStatement stmt = this.conexao
					.prepareStatement("Select * from locacao as l,grupo as g, protecao as p, cliente as c where l.grupo_id = g.id and l.protecao_id = p.id and l.cliente_id = c.id");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Locacao locacao = new Locacao();
				locacao.setId((int) rs.getLong("id"));
				locacao.setGrupo(rs.getString("g.nome"));
				locacao.setProtecao(rs.getString("p.descricao"));
				locacao.setCliente(rs.getString("c.nome"));
				
				Date g2 = rs.getDate("data_Retirada");
				SimpleDateFormat formata2 = new SimpleDateFormat("dd/MM/yyyy");
				locacao.setData_Retirada(formata2.format(g2));
				
				Date g3 = rs.getDate("data_Prevista");
				SimpleDateFormat formata3 = new SimpleDateFormat("dd/MM/yyyy");
				locacao.setData_Prevista(formata3.format(g3));

				
				locacoes.add(locacao);

			}
			rs.close();
			stmt.close();
			return locacoes;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}


	public List<Locacao> ListaLocacaoPorId(long id) {
		try {
			List<Locacao> locacoes = new ArrayList<Locacao>();
			PreparedStatement stmt = this.conexao
					.prepareStatement("Select * from locacao where id=?");
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Locacao locacao = new Locacao();
				locacao.setId((int) rs.getLong("id"));
				locacao.setGrupo(rs.getString("grupo_id"));
				locacao.setProtecao(rs.getString("protecao_id"));

				locacoes.add(locacao);
			}
			rs.close();
			stmt.close();
			return locacoes;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Locacao buscaLocacao(long id) {
		Locacao l = null;
		String sql = "select l.id, e.id, e.placa, l.data_Retirada, l.hora_Retirada, l.data_Prevista, l.hora_Prevista, loja.bairro from locacao as l, exemplar as e, loja where l.exemplar_id = e.id and loja.id = l.local_Reserva and l.id = ?";
		try {
			PreparedStatement stmt = this.conexao.prepareStatement(sql);
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				l = new Locacao();
				l.setId(rs.getLong("l.id"));
				l.setLocal_Reserva(rs.getString("loja.bairro"));

				Date g = rs.getDate("l.data_Retirada");
				SimpleDateFormat formata = new SimpleDateFormat("dd/MM/yyyy");
				l.setData_Retirada(formata.format(g));

				Time t = rs.getTime("l.hora_Retirada");
				SimpleDateFormat formata3 = new SimpleDateFormat("HH:mm");
				l.setHora_Retirada(formata3.format(t));

				Date g2 = rs.getDate("l.data_Prevista");
				SimpleDateFormat formata2 = new SimpleDateFormat("dd/MM/yyyy");
				l.setData_Prevista(formata2.format(g2));

				Time t2 = rs.getTime("l.hora_Prevista");
				SimpleDateFormat formata4 = new SimpleDateFormat("HH:mm");
				l.setHora_Prevista(formata4.format(t2));
				
				l.setExemplar(rs.getString("e.id"));
				l.setCliente(rs.getString("e.placa"));
			}
			rs.close();
			stmt.close();

		} catch (Exception e) {

		}
		return l;
	}

	public Cliente buscaCliente(int id) {
		Cliente c = null;
		String sql = "select * from cliente as c, locacao where locacao.Cliente_id = c.id and locacao.id = ?";
		try {
			PreparedStatement stmt = this.conexao.prepareStatement(sql);
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				c = new Cliente();
				c.setId(rs.getLong("c.id"));
				c.setNome(rs.getString("c.nome"));
				c.setRg(rs.getString("c.rg"));
				c.setCpf(rs.getString("c.cpf"));
				c.setSexo(rs.getString("c.sexo"));
				c.setEmail(rs.getString("c.email"));
				c.setTelefone(rs.getString("c.telefone"));
				c.setTipoTelefone(rs.getString("c.tipoTelefone"));
				c.setDataNascimento(rs.getString("c.dataNascimento"));
				c.setRua(rs.getString("c.rua"));
				c.setNumRua(rs.getInt("c.numRua"));
				c.setComplemento(rs.getString("c.complemento"));
				c.setBairro(rs.getString("c.bairro"));
				c.setCidade(rs.getString("c.cidade"));
				c.setUf(rs.getString("c.uf"));
				c.setCep(rs.getString("c.cep"));
				c.setCnh(rs.getString("c.cnh"));
				c.setValidadeCnh(rs.getString("c.validadeCnh"));
				c.setEmissaoCnh(rs.getString("c.emissaoCnh"));
			}
			rs.close();
			stmt.close();

		} catch (Exception e) {

		}
		return c;
	}

	public Devolucao buscaDevolucao(int id) {
		Devolucao d = null;
		String sql = "select l.id,l.data_Prevista, l.hora_Prevista, d.id, d.data_Devolucao,d.hora_Devolucao from devolucao as d, locacao as l where d.Locacao_id = l.id and l.id = ?";
		try {
			PreparedStatement stmt = this.conexao.prepareStatement(sql);
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				d = new Devolucao();
				d.setId(rs.getLong("d.id"));

				Date g = rs.getDate("d.data_Devolucao");
				SimpleDateFormat formata = new SimpleDateFormat("dd/MM/yyyy");
				d.setData_Devolucao(formata.format(g));

				d.setHora_Devolucao(rs.getString("d.hora_Devolucao"));
			}
			rs.close();
			stmt.close();

		} catch (Exception e) {

		}
		return d;
	}

	public int diasLocacao(int id) {
		int day = 0, day2 = 0;
		int dayFinal = 0;
		int month = 0, month2 = 0;
		String sql = "select data_Retirada, data_Prevista from locacao where id = ?";
		try {
			PreparedStatement stmt = this.conexao.prepareStatement(sql);
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {

				Calendar c = Calendar.getInstance();
				Date g2 = rs.getDate("data_Prevista");
				c.setTime(g2);
				day = c.get(Calendar.DAY_OF_MONTH);
				month = c.get(Calendar.MONTH);

				Calendar c2 = Calendar.getInstance();
				Date g = rs.getDate("data_Retirada");
				c2.setTime(g);
				day2 = c2.get(Calendar.DAY_OF_MONTH);
				month2 = c2.get(Calendar.MONTH);

				if (month2 < month) {
					dayFinal = day + (31 - day2);
				} else {
					dayFinal = day - day2;
				}
			}
			rs.close();
			stmt.close();

		} catch (Exception e) {

		}
		return dayFinal;
	}

	public int diasLocacaoFinal(int id) {
		int day = 0, day3 = 0;
		int dayFinal = 0;
		int month = 0, month2 = 0;
		String sql = "select l.id,l.data_Prevista, l.hora_Prevista, d.data_Devolucao,d.hora_Devolucao from devolucao as d, locacao as l where d.Locacao_id = l.id and l.id = ?";
		try {
			PreparedStatement stmt = this.conexao.prepareStatement(sql);
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {

				Calendar c = Calendar.getInstance();
				Date g2 = rs.getDate("l.data_Prevista");
				c.setTime(g2);
				day = c.get(Calendar.DAY_OF_MONTH);
				month = c.get(Calendar.MONTH);

				Calendar c3 = Calendar.getInstance();
				Date g3 = rs.getDate("d.data_Devolucao");
				c3.setTime(g3);
				day3 = c3.get(Calendar.DAY_OF_MONTH);
				month2 = c3.get(Calendar.MONTH);

				if (month < month2) {
					dayFinal = day + (31 - day3);
				} else {
					dayFinal = day3 - day;
				}
			}
			rs.close();
			stmt.close();

		} catch (Exception e) {

		}
		return dayFinal;
	}

	public Grupo buscaGrupo(int id) {
		Grupo g = null;
		String sql = "select g.id, g.nome, g.descricao, g.preco, g.foto from grupo as g, locacao where g.id = locacao.grupo_id and locacao.id = ?";
		try {
			PreparedStatement stmt = this.conexao.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				g = new Grupo();
				g.setId(rs.getInt("g.id"));
				g.setNome(rs.getString("g.nome"));
				g.setDescricao(rs.getString("g.descricao"));
				g.setPreco(rs.getDouble("g.preco"));
				g.setFoto(rs.getBytes("g.foto"));
			}
			rs.close();
			stmt.close();

		} catch (Exception e) {

		}
		return g;
	}

	public Protecao buscarProtecao(int id) {

		Protecao p = null;
		String sql = "select p.id, p.descricao, p.preco from protecao as p, locacao where p.id = locacao.protecao_id and locacao.id = ?";
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				p = new Protecao();
				p.setId(rs.getInt("p.id"));
				p.setDescricao(rs.getString("p.descricao"));
				p.setPreco(rs.getDouble("p.preco"));
			}
			stmt.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return p;
	}

	public List<Opcional> buscarOpcionais(int id) {
		try {
			List<Opcional> opcionais = new ArrayList<Opcional>();
			String sql = "select o.id, o.nome, o.preco from locacao as l, opcional as o, itemopcional as io where l.id = io.Locacao_id and o.id = io.Opcional_id and l.id = ?";
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Opcional o = new Opcional();
				o.setId((int) rs.getLong("o.id"));
				o.setNome(rs.getString("o.nome"));
				o.setPreco(rs.getDouble("o.preco"));

				opcionais.add(o);
			}
			rs.close();
			stmt.close();
			return opcionais;

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public double somaOpcionais(int id) {
		try {
			List<Double> n = new ArrayList<Double>();
			String sql = "select o.id, o.nome, o.preco from locacao as l, opcional as o, itemopcional as io where l.id = io.Locacao_id and o.id = io.Opcional_id and l.id = ?";
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setLong(1, id);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				n.add(rs.getDouble("o.preco"));
			}
			double total = 0;
			for (double k : n)
				total = total + k;

			rs.close();
			stmt.close();
			return total;

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void altera(Locacao locacoes) {
		try {
			PreparedStatement start = conexao
					.prepareStatement("update locacao set local_Reserva=?,data_Retirada=?,hora_Retirada=?,data_Prevista=?,hora_Prevista=?,protecao_id=?,grupo_id=?,cliente_id=? where id=?");

			start.setString(1, locacoes.getLocal_Reserva());
			start.setDate(2, formataData(locacoes.getData_Retirada()));
			start.setTime(3, formataHora(locacoes.getHora_Retirada()));
			start.setDate(4, formataData(locacoes.getData_Prevista()));
			start.setTime(5, formataHora(locacoes.getHora_Prevista()));
			start.setString(6, locacoes.getProtecao());
			start.setString(7, locacoes.getGrupo());
			start.setString(8, locacoes.getCliente());
			start.setLong(9, locacoes.getId());

			start.execute();
			start.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void alteraAluguel(Locacao locacoes) {
		try {
			PreparedStatement start = conexao
					.prepareStatement("update locacao set local_Reserva=?,data_Retirada=?,hora_Retirada=?,data_Prevista=?,hora_Prevista=?,protecao_id=?,grupo_id=?,cliente_id=?,exemplar_id=? where id=?");

			start.setString(1, locacoes.getLocal_Reserva());
			start.setDate(2, formataData(locacoes.getData_Retirada()));
			start.setTime(3, formataHora(locacoes.getHora_Retirada()));
			start.setDate(4, formataData(locacoes.getData_Prevista()));
			start.setTime(5, formataHora(locacoes.getHora_Prevista()));
			start.setString(6, locacoes.getProtecao());
			start.setString(7, locacoes.getGrupo());
			start.setString(8, locacoes.getCliente());
			start.setString(9, locacoes.getExemplar());
			start.setLong(10, locacoes.getId());

			start.execute();
			start.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void adicionaDevolucao(Locacao locacoes) {
		try {
			PreparedStatement start = conexao
					.prepareStatement("insert into Devolucao(data_devolucao,hora_Devolucao,locacao_id) values (?,?,?)");

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date hora = Calendar.getInstance().getTime(); // Ou qualquer outra
															// forma que tem
			String dataFormatada = sdf.format(hora);
			start.setString(1, dataFormatada);

			SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
			Date hora2 = Calendar.getInstance().getTime(); // Ou qualquer outra
															// forma que tem
			String dataFormatada2 = sdf2.format(hora2);
			start.setString(2, dataFormatada2);

			start.setLong(3, locacoes.getId());

			start.execute();
			start.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
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
	// ================================================================================================
	// ================================================================================================
	// ================================================================================================
	
	
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

