package br.com.senai.model;

public class Devolucao {
	private long id;
	private String data_Devolucao;
	private String hora_Devolucao;
	private String locacao;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getData_Devolucao() {
		return data_Devolucao;
	}
	public void setData_Devolucao(String data_Devolucao) {
		this.data_Devolucao = data_Devolucao;
	}
	public String getHora_Devolucao() {
		return hora_Devolucao;
	}
	public void setHora_Devolucao(String hora_Devolucao) {
		this.hora_Devolucao = hora_Devolucao;
	}
	public String getLocacao() {
		return locacao;
	}
	public void setLocacao(String locacao) {
		this.locacao = locacao;
	}
}
