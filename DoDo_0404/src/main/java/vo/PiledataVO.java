package vo;

import java.util.Date;

import lombok.Data;
 
@Data
public class PiledataVO {
	private int cno;
	private String entry;
	private int attend;
	private int term;
	private Date lastattend;
	
	private String nick;
	private int result;
}
