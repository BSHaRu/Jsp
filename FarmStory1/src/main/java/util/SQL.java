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
	// 게시판 글 쓰기
	public static final String INSERT_ARTICLE 
		= "INSERT INTO Article SET "
				+ " cate = ?, "
				+ " title = ?, "
				+ " content = ?, "
				+ " writer = ?, "
				+ " regIp = ?, "
				+ " regDate = NOW()";

	// PageMaker
	public static final String SELECT_PM 
		= "SELECT a.*, u.nick "
				+ " FROM Article AS a "
				+ " JOIN User AS u ON a.writer = u.uid "
				+ " WHERE parent = 0 "
				+ " AND cate = ? "
				+ " ORDER BY no DESC "
				+ " LIMIT ?, ?";

	// 전체 게시글 조회
	public static final String SELECT_COUNT_TOTAL 
		= "SELECT COUNT(no) FROM `Article` "
				+ " WHERE parent = 0 "
				+ " AND cate = ?";
	// 게시판을 하나로 처리하다보니 cate로 구분해주기 위해서
	// cate를 쿼리 값으로 받는거임
	
	
	
	
}
