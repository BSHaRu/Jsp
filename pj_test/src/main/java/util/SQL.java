package util;

public class SQL {

	public static final String INSERT_USER 
		= "INSERT INTO pj_user SET "
				+ " uId = ?, "
				+ " pw = SHA2(?, 256), "
				+ " uNick = ?, "
				+ " uPhone = ?, "
				+ " uEmail = ?, "
				+ " uDate = ?, "
				+ " gender = ?, "
				+ " uAddr1 = ?, "
				+ " uAddr2 = ?, "
				+ " uAddr3 = ?, "
				+ " uRegDate = NOW() ";
				
	
	
}
