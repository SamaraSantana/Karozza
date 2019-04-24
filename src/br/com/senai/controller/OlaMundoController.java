package br.com.senai.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.senai.dao.LocacaoDao;

//usando isso quer dizer que o spring controla essa informação
@Controller
public class OlaMundoController {
	
	private LocacaoDao dao;

	
	
	@Autowired
	public OlaMundoController(LocacaoDao dao) {
		this.dao = dao;
	}
	
	
	@RequestMapping("aba")
	public String aba(Model model){	
		return "aba3";
	}
	
	@RequestMapping("contact")
	public String contato(Model model){	
		return "contact";
	}

	@RequestMapping("charts")
	public String charts(){
		//System.out.println("Ola Mundo no controller");
		return "charts";
	}
	@RequestMapping("tables")
	public String tables(){
		//System.out.println("Ola Mundo no controller");
		return "tables";
	}
	@RequestMapping("forms")
	public String forms(){
		//System.out.println("Ola Mundo no controller");
		return "forms";
	}
	@RequestMapping("bootstrap-elements")
	public String bootstrapElements(){
		//System.out.println("Ola Mundo no controller");
		return "bootstrap-elements";
	}
	@RequestMapping("bootstrap-grid")
	public String bootstrapGrid(){
		//System.out.println("Ola Mundo no controller");
		return "bootstrap-grid";
	}
	@RequestMapping("blank-page")
	public String sblankPage(){
		//System.out.println("Ola Mundo no controller");
		return "blank-page";
	}
	@RequestMapping("index-rtl")
	public String indexRtl(){
		//System.out.println("Ola Mundo no controller");
		return "index-rtl";
	}
	

}
