/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.85
 * Generated at: 2023-03-23 05:35:29 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp._0322;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class jobarr_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");

	//요청시 전송데이터 받기

	//데이터로 처리 수행(대부분 DB와 연결해서 CRUD처리함)
	
	//처리결과로 응답데이타를 생성 - json Object 배열 객체

      out.write("\r\n");
      out.write("[\r\n");
      out.write("	{\r\n");
      out.write("		\"id\" : \"stw77\",\r\n");
      out.write("		\"name\" : \"서태웅\",\r\n");
      out.write("		\"tel\" : \"010-1234-1234\",\r\n");
      out.write("		\"mail\" : \"stw@naver.com\"\r\n");
      out.write("	},\r\n");
      out.write("	\r\n");
      out.write("	{\r\n");
      out.write("		\"id\" : \"jdm999\",\r\n");
      out.write("		\"name\" : \"정대만\",\r\n");
      out.write("		\"tel\" : \"010-9999-9999\",\r\n");
      out.write("		\"mail\" : \"jdm@naver.com\"\r\n");
      out.write("	},\r\n");
      out.write("	\r\n");
      out.write("	{\r\n");
      out.write("		\"id\" : \"ccs8\",\r\n");
      out.write("		\"name\" : \"채치수\",\r\n");
      out.write("		\"tel\" : \"010-4567-4576\",\r\n");
      out.write("		\"mail\" : \"ccs@naver.com\"\r\n");
      out.write("	},\r\n");
      out.write("	\r\n");
      out.write("	{\r\n");
      out.write("		\"id\" : \"sts0300\",\r\n");
      out.write("		\"name\" : \"송태섭\",\r\n");
      out.write("		\"tel\" : \"010-6789-8766\",\r\n");
      out.write("		\"mail\" : \"sts@naver.com\"\r\n");
      out.write("	},\r\n");
      out.write("	\r\n");
      out.write("	{\r\n");
      out.write("		\"id\" : \"kbh10\",\r\n");
      out.write("		\"name\" : \"강백호\",\r\n");
      out.write("		\"tel\" : \"010-7777-1010\",\r\n");
      out.write("		\"mail\" : \"kbh@naver.com\"\r\n");
      out.write("	}\r\n");
      out.write("]");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}