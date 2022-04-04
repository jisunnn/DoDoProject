package vo;

import lombok.Data;
 
@Data
public class MemberVO {
	private String id;
	private String password;
	private String name;
	private String mail;
	private String nick;
	private String rid;
	private int point;
	private String prefer;
	
	private String tmpPassword;
}
