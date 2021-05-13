package com.study.tw.lib;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class ScriptUtils {

	public static void init(HttpServletResponse response) {
        response.setContentType("text/html; charset=euc-kr");
        response.setCharacterEncoding("utf-8");
    }
 
    public static void alert(HttpServletResponse response, String alertText) throws IOException {
        init(response);
        PrintWriter out = response.getWriter();
        out.println("<script>alert('" + alertText + "');</script> ");
        out.flush();
    }
 
    public static void location(HttpServletResponse response, String url)
            throws IOException {
        init(response);
        PrintWriter out = response.getWriter();
        out.println("<script> location.href='/tw/" + url + "';</script> ");
        out.flush();
    }
 
    public static void historyBack(HttpServletResponse response) throws IOException {
        init(response);
        PrintWriter out = response.getWriter();
        out.println("<script> history.go(-1); </script>");
        out.flush();
    }
    public static void alertHistory(HttpServletResponse response,String text) throws IOException {
        init(response);
        PrintWriter out = response.getWriter();
        out.println("<script> alert('" + text + "'); history.go(-1); </script>");
        out.flush();
    }
    public static void alertLogout(HttpServletResponse response,String text) throws IOException {
        init(response);
        PrintWriter out = response.getWriter();
        out.println("<script> alert('" + text + "'); location.href='/tw/auth/logout'; </script>");
        out.flush();
    }



}
