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
			+ " WHERE uid = ? AND pass = SHA2(?, 256)";

	public static final String CHECK_UID
		= "SELECT COUNT(*) FROM User WHERE uid = ?";

	public static final String CHECK_NICK
		= "SELECT COUNT(*) FROM User WHERE nick = ?";
	
	public static final String CHECK_HP
		= "SELECT COUNT(*) FROM User WHERE hp = ?";
	
	public static final String CHECK_EMAIL
		= "SELECT COUNT(*) FROM User WHERE email = ?";
	
	public static final String CHECK_NAME_EMAIL
		= "SELECT COUNT(*) FROM User WHERE name= ? AND email = ?";

	public static final String FIND_ID_FOR_EMAIL 
		= "SELECT COUNT(*) FROM User "
				+ " WHERE name = ? AND email = ?";
	
	public static final String FIND_ID_FOR_EMAIL_IN_RESULT 
		= "SELECT * FROM User "
			+ " WHERE name = ? AND email = ?";
	
	public static final String SELECT_TERMS 
		= "SELECT * FROM Terms";
	
	
	// Article
	// 이걸 하는 이유가 게시판 글 쓰자마자 바로 업로드 되는 게시글 조회하려고
	// -> 파일 업로드 할 때 글 쓰자마자 해당 게시글 번호를 가져 올 수 있음
	public static final String SELECT_MAX_NO
		= "SELECT MAX(`no`) FROM `Article`";
	
	public static final String INSERT_ARTICLE
		= "INSERT INTO Article SET "
			+ " title = ? ,"
			+ " content = ? ,"
			+ " file = ? ,"
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

	
	public static final String SELECT_ARTICEL 
		= "SELECT * FROM `Article` WHERE no = ?";

	public static final String SELECT_CONTENTS 
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
				+ " WHERE no = ?";
	
	// 댓글 수정
	public static final String UPDATE_COMMENT 
		= "UPDATE Article SET "
				+ "	content = ? "
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

	// 회원 탈퇴 - id값과 leaveDate값을 남기고 null로 수정
	public static final String UPDATE_USER_FOR_WITHDRAW 
		= "UPDATE User SET "
				+ " pass = null, "
				+ " name = null, "
				+ " nick = null, "
				+ " email = null, "
				+ " hp = null, "
				+ " role = null, "
				+ " zip = null, "
				+ " addr1 = null, "
				+ " addr2 = null, "
				+ " leaveDate = NOW() "
				+ " WHERE uid = ?";

	public static final String UPDATE_USER_PASS 
		= "UPDATE User SET "
				+ " pass = SHA2(?, 256) "
				+ " WHERE uid = ? ";

	
	
	public static final String INSERT_FILE 
		= "INSERT INTO `File` SET "
				+ " `ano` = ?, "
				+ " `oriName` = ?, "
				+ " `newName` = ?, "
				+ " `regDate` = NOW()";

	// 파일 다운로드
	public static final String SEECT_FILES 
		= "SELECT * FROM `File`";




}
