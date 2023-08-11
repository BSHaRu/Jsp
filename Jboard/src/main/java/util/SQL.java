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
	
	public static final String INSERT_CONTENT 
		= "INSERT INTO Article SET "
			+ " parent = ? ,"
			+ " content = ? ,"
			+ " writer = ? ,"
			+ " regIP = ? ,"
			+ " regDate = NOW()";

	// select
	// PageMaker - 게시글 페이지 조회
	public static final String SELECT_ARTICLES 
		= "SELECT "
			+ "	a.*,"
			+ "	u.nick "
			+ " FROM `Article` AS a "
			+ " JOIN `User` AS u ON a.writer = u.uid "
			+ " WHERE parent = 0 "
			+ " ORDER BY no DESC"
			+ " LIMIT ?, ?";

	public static final String SELECT_COUNT_ARTICLE 
		= "SELECT COUNT(no) FROM `Article` "
				+ " WHERE parent = 0";
		// parent 0을 안달면 댓글도 갯수로 쳐서 no가 꼬임

	// 
	public static final String SELECT_ARTICEL 
		= "SELECT * FROM `Article` WHERE no = ?";

	public static final String SELECT_COMMENTS 
		= "SELECT "
			+ "	a.*,"
			+ "	u.nick "
			+ " FROM `Article` AS a "
			+ " JOIN `User` AS u ON a.writer = u.uid "
			+ " WHERE parent = ?";
	
	// Updaete
	public static final String UPDATE_COMMENT_COUNT_PLUS
		= "UPDATE `Article` SET "
				+ " `comment` = `comment` + 1 "
				+ " WHERE `no` = ?";
	
	public static final String UPDATE_COMMENT_COUNT_MIN 
	= "UPDATE `Article` SET "
			+ " `comment` = `comment` - 1 "
			+ " WHERE `no` = ?";

	// 게시글 수정 업데이트
	public static final String UPDATE_ARTICLE 
		= "UPDATE Article SET "
				+ " title = ?, "
				+ " content = ? "
				//+ " file = ? "
				+ " WHERE no = ?";

	// delete
	// 댓글 삭제
	public static final String DELETE_CONTENT 
		= "DELETE FROM Article "
				+ " WHERE no = ? ";

	// 게시판 삭제
	public static final String DELETE_ARTICLE 
		= "DELETE FROM Article "
			+ " WHERE no = ? "
			+ " OR parent = ?";
	// parent를 받는 이유가 게시글 삭제시
	// 해당 게시글에 있는 댓글도 삭제해주기 위해서임


}
