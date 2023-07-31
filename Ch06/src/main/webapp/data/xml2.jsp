<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="vo.User1VO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
// page에 trimDirectiveWhitespaces="true" 설정 해줘야 됨
// 설정안하면 어딘가에 공백이 있기 때문에 xml이 실행안되는 오류가 발생
	List<User1VO> users = new ArrayList<>();
	
	try{
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
		Connection conn = ds.getConnection();
		
		Statement stmt = conn.createStatement();
		String sql = "SELECT * FROM user1";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			User1VO user = new User1VO();
			user.setUid(rs.getString(1));
			user.setName(rs.getString(2));
			user.setHp(rs.getString(3));
			user.setAge(rs.getInt(4));
			
			users.add(user);
		}
		rs.close();
		stmt.close();
		conn.close();
	}catch(Exception e){
		System.out.println(e.getMessage());
	}
		
	// xml 출력
	// -> maven에서 jdom 다운 
	Document doc = new Document();
	// Element : 마크업 언어의 태그를 생성
	Element elUsers = new Element("users");
	
	for(User1VO vo : users){
		Element elUser = new Element("user");
		Element elUid = new Element("uid");
		Element elName = new Element("name");
		Element elHp = new Element("hp");
		Element elAge = new Element("age");
		
		elUid.setText(vo.getUid());
		elName.setText(vo.getName());
		elHp.setText(vo.getHp());
		// age는 int타입인데 이친구는 string으로밖에 못받음
		// setInt()이런게 없음
		// -> ""+를 통해서 문자열로 만들던가
		// String.valueOf()를 쓰면 됨
		elAge.setText(""+vo.getAge());
		// elAge.setText(String.valueOf(vo.getAge()));
		
		// elUser에 select로 검색한 데이터를 넣어줌
		elUser.addContent(elUid);
		elUser.addContent(elName);
		elUser.addContent(elHp);
		elUser.addContent(elAge);
		
		// users가 user를 넣어줌
		// users > user > select 결과 값 이렇게 됨
		elUsers.addContent(elUser);
	}
	// users를 문서 최상단(root)로 지정해준다는 의미
	doc.setRootElement(elUsers);
	
	// xml 출력서식 설정
	XMLOutputter outputter 
		= new XMLOutputter(Format.getPrettyFormat());
	String xml = outputter.outputString(doc);
	
	// xml 출력
	out.println(xml);
%>