package util;

public class SQL {

	// trems 
	public static final String SELECT_TERMS 
		= "SELECT * FROM Terms";

	
	// user

	// 회원 가입
	public static final String INSERT_USER 
		= "INSERT INTO User SET "
				+ " uid = ?, "
				+ " pass = SHA2(?, 256), "
				+ "	name = ?,"
				+ "	nick = ?,"
				+ "	email = ?,"
				+ "	hp = ?,"
				+ "	zip = ?,"
				+ "	addr1 = ?,"
				+ "	addr2 = ?,"
				+ "	regIp = ?,"
				+ "	regDate = NOW()";
	
	// 로그인
	public static final String SELECT_USER 
		= "SELECT * FROM User "
				+ " WHERE uid =? "
				+ " AND pass = SHA2(?,256)";
	
	
	
	
	// artitcle
}
