package com.study.tw.lib;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class Login {

	public void LoginAuth(HttpServletResponse res)  {

			try {
				res.setContentType("text/html;charset=UTF-8");
		        res.setCharacterEncoding("UTF-8");
				PrintWriter out;
				out = res.getWriter();
				out.println("<script>");
				out.println("alert('로그인후 이용해주세요')");
				out.print("location.href='../auth/login'");
				out.println("</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
