package control;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

/**
 * Servlet implementation class Controller
 */
//  @WebServlet("/Controller") xml로 setting
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Map<String, Object> commandMap = new HashMap<String, Object>(); //Controller class내에서 멤버변수
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// web.xml에서 propertyConfig에 해당하는 init-param 의 값을 읽어옴
		String props = config.getInitParameter("config");
		//     props-> /WEB-INF/command.properties
		System.out.println("1. init String props=> " + props); // /ch16/com
		
		Properties      pr = new Properties();
		FileInputStream f  = null;
		
		try {
			String configFilePath = config.getServletContext().getRealPath(props);
			System.out.println("2. init Stirng configFilePath->" + configFilePath); 
			f = new FileInputStream(configFilePath); // 실제경로상 파일을 f에 파일로 만든다
			
			pr.load(f); //f 파일을 메모리에 올린다
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (f != null)
				try {
					f.close();
				} catch (IOException ex) {
				}
		}
		Iterator ketIter = pr.keySet().iterator(); //집합형 변수 , buffer에 순서대로 /list.do , /content.do
		
		while(ketIter.hasNext()) {
			String command = (String) ketIter.next();
			String className = pr.getProperty(command);
			System.out.println("3. init command->" + command);
			System.out.println("4. init className->" + className);
			
			try {
				// ListAction la = new ListAction();
				// Class commandClass = Class.forName(className); // className을 class로 만들어준다.
				// Object commandInstance = commandClass.newInstance(); // instance 객체 생성
				Class<?> commandClass = Class.forName(className);
				CommandProcess commandInstance = (CommandProcess) commandClass.getDeclaredConstructor().newInstance();
				//             list.do, service.ListAction(instance)
				commandMap.put(command, commandInstance);
			} catch (Exception e) {
				e.getStackTrace();
			}
			
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		requestServletPro(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		requestServletPro(request, response);
	}
	protected void requestServletPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String         view = null;
		CommandProcess com  = null;
		String command = request.getRequestURI(); //context /och16
		System.out.println("1.requestServletPro command => " + command); // /och16.list.do
		command = command.substring(request.getContextPath().length()); //contextpath /och16 length -> 6
		System.out.println("2.requestServletPro command substring => " + command);
		
		try {
			com = (CommandProcess) commandMap.get(command); //com <= service.ListAction instance
			System.out.println("3.requestServletPro command => " + command); // /ch16/com
			System.out.println("4.requestServletPro com => " + com); // /ch16/com
			//     com --> service.ListAction@12611de0
			view = com.requestPro(request, response);
			System.out.println("5.requestServletPro view => " + view); // /ch16/com			
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
		// Ajax String를 포함하고 있으면
		if (command.contains("ajaxGet")) {
			System.out.println("ajaxGet String->"+command);
			String writer = (String) request.getAttribute("writer");
			PrintWriter pw = response.getWriter();
			pw.write(writer); // writer -> ajax의 data 로 보내짐
			pw.flush();
			
		} else {
			// 일반적인 경우 화면 이동
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			System.out.println("dispatcher view -> " + view);
			dispatcher.forward(request, response);
		}
	}

}
