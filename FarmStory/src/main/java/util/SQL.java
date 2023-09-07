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

	// id로 쿠키 조회
	public static final String SELECT_COOKIE 
		= "SELECT * FROM User "
				+ "	WHERE uid = ?";
	
	
	// artitcle
	// 게시판 글 쓰기
	public static final String INSERT_ARTICLE 
		= "INSERT INTO Article SET "
				+ " cate = ?, "
				+ " title = ?, "
				+ " content = ?, "
				+ " file = ?, "
				+ " writer = ?, "
				+ " regIp = ?, "
				+ " regDate = NOW()";
	
	// 이걸 하는 이유가 게시판 글 쓰자마자 바로 업로드 되는 게시글 조회하려고
	// -> 파일 업로드 할 때 글 쓰자마자 해당 게시글 번호를 가져 올 수 있음
	public static final String SELECT_MAX_NO 
		= "SELECT MAX(`no`) FROM `Article`";

	
	// PageMaker - 현재 페이지 게시물 조회
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


	// 현재 게시글 보기
	public static final String SELECT_ARTICLE 
		= "SELECT * FROM `Article` AS a "
			+ " LEFT JOIN `File` AS f "
			+ " ON no = ano"
			+ " WHERE no = ?";

	// 댓글 쓰기
	public static final String INSERT_CONTENT 
		= "INSERT INTO Article SET "
				+ " parent = ?, "
				+ " content = ?, "
				+ " writer = ?, "
				+ " regIp = ?, "
				+ " regDate = NOW()";
	
	// 댓글 쓰고 바로 보기(그 파일업로드랑 비슷한 구조)
	public static final String SELECT_CONTENT_LATEST 
		= "SELECT "
			+ " a.*, "
			+ " b.`nick` "
			+ " FROM `Article` AS a "
			+ " JOIN `User` AS b ON a.writer = b.uid "
			+ " WHERE `parent`!=0 "
			+ " ORDER BY `no` DESC LIMIT 1";
	
	// 댓글 보기
	public static final String SELECT_CONTENTS 
		= "SELECT a.*, u.nick "
				+ "	FROM Article AS a "
				+ "	JOIN User AS u ON a.writer = u.uid "
				+ "	WHERE parent = ?";

	// 댓글 표시 ++ 
	public static final String UPDATE_COMMENT_COUNT 
		= "";


	// 댓글 수정
	public static final String UPDATE_CONTENT 
		= "UPDATE Article SET "
				+ " content = ? "
				+ " WHERE no = ?";

	// 게시글 수정
	public static final String UPDATE_Article 
		= "UPDATE Article SET "
			+ " title = ?, "
			+ " content = ? "
			+ " WHERE no = ?";


	// product
	// 상품 등록
	public static final String INSERT_PRODUCT 
		= "INSERT INTO Product SET "
				+ " type = ?, "
				+ " pName = ?, "
				+ " price = ?, "
				+ " delivery = ?, "
				+ " stock = ?, "
				+ " sold = ?, "
				+ " thumb1 = ?, "
				+ " thumb2 = ?, "
				+ " thumb3 = ?, "
				+ " seller = ?, "
				+ " etc = ?, "
				+ " regDate = NOW()";


	// 상품 목록 보기
	public static final String SELECT_PRODUCTS_ALL
		= "SELECT * FROM Product "
				+ " WHERE stock > 0 "
				+ " ORDER BY pNo DESC"
				+ " LIMIT ?, ? ";

	// 상품 카테고리 별로 묶기
	public static final String SELECT_PRODUCTS_TYPE
		= "SELECT * FROM Product "
				+ "	WHERE stock > 0 AND type = ? "
				+ " ORDER BY pNo DESC"
				+ " LIMIT ?, ? ";

	// 상품 전체 개수
	public static final String SELECT_COUNT_PROD_ALL 
		= "SELECT COUNT(*) FROM Product "
				+ " WHERE stock > 0";
	public static final String SELECT_COUNT_PROD_TYPE 
		= "SELECT COUNT(*) FROM Product "
			+ " WHERE stock > 0 AND type = ? ";

	// 상품 상세 보기
	public static final String SELECT_PRODUCT 
		= "SELECT * FROM Product "
				+ " WHERE pNo = ? ";


	// Order
	// 주문
	public static final String INSERT_ORDER 
		= "INSERT INTO `Order` SET "
				+ " orderProduct = ?, "
				+ " orderCount = ?, "
				+ " orderDelivery = ?, "
				+ " orderPrice = ?, "
				+ " orderTotal = ?, "
				+ " receiver = ?, "
				+ " hp = ?, "
				+ " zip = ?, "
				+ " addr1 = ?, "
				+ " addr2 = ?, "
				+ " orderEtc = ?, "
				+ " orderUser = ?, "
				+ " orderDate = NOW()";
	
	// 주문 상품 목록 보기
	public static final String ORDER_LIST
		= "SELECT o.*, p.pName "
				+ " FROM `Order` AS o "
				+ " JOIN `Product` AS p "
				+ " ON o.orderProduct = p.pNo"
				+ " ORDER by orderNo DESC "
				+ " LIMIT ?, ? ";
	
	// 주문 목록 전체 조회
	public static final String SELECT_ORDER_COUNT 
		= "SELECT COUNT(*) FROM `Order` ";
	
	// 주문 목록 삭제
	public static final String DELETE_ORDER 
		= "DELETE FROM `Order` WHERE orderNo = ?";


	
	// file
	// 파일 업로드
	public static final String INSERT_FILE 
		= "INSERT INTO `File` SET "
			+ " `ano` = ?, "
			+ " `oriName` = ?, "
			+ " `newName` = ?, "
			+ " `regDate` = NOW()";


	// 파일 조회
	public static final String SELECT_FILE 
		= "SELECT * FROM `File` "
				+ " WHERE fno = ? ";

	// 파일 다운로드
	public static final String FILE_DOWNLOAD 
		= "SELECT * FROM `File` ";


	
	
	
	
}
