package br.com.senai.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AutorizadoLoginFuncionario extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		String uri = request.getRequestURI();
		if (uri.endsWith("loginFuncionario") || uri.endsWith("efetuaLoginFuncionario") || uri.contains("services") || uri.contains("resources")) {
			return true;
		}
		if (request.getSession().getAttribute("funcionarioLogado") != null) {
			return true;
		}
		response.sendRedirect("loginFuncionarioo.jsp");
		return false;

	}
}