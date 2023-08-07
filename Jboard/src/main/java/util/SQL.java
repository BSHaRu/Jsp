package util;

public class SQL {
	
	// user
	public static final String INSERT_USER 
		= "INSERT INTO User SET "
				+ " uid = ?,"
				+ " pass = SHA2(?, 256),"
				+ "	name = ?,"
				+ "	nick = ?,"
				+ "	email = ?,"
				+ "	hp = ?,"
				+ "	zip = ?,"
				+ "	addr1 = ?,"
				+ "	addr2 = ?,"
				+ "	regIp = ?,"
				+ "	regDate = NOW()";
	// SHA2() : hash 알고리즘으로 암호화 시켜서 저장됨
	
	public static final String SELECT_USER 
		= "SELECT * FROM User "
			+ " WHERE uid =? AND pass =SHA2(?, 256)";
	
	public static final String CHECK_UID
		= "SELECT COUNT(*) FROM User WHERE uid = ?";

	public static final String CHECK_NICK
		= "SELECT COUNT(*) FROM User WHERE nick = ?";
	
	public static final String CHECK_HP
		= "SELECT COUNT(*) FROM User WHERE hp = ?";
	
	public static final String CHECK_EMAIL
		= "SELECT COUNT(*) FROM User WHERE email = ?";

	public static final String SELECT_TERMS 
		= "SELECT * FROM Terms";
	
	// Article
	public static final String INSERT_ARTICLE
		= "INSERT INTO Article SET "
			+ " title = ? ,"
			+ " content = ? ,"
			+ " writer = ? ,"
			+ " regIP = ? ,"
			+ " regDate = NOW()";

	public static final String SELECT_ARTICLES 
		= "SELECT * FROM Article ORDER BY no DESC";
}
