package vo;

import java.util.Date;

import lombok.Data;
 
@Data
public class ReplyVO {
	private int seq;
	private int step;
	private String id;
	private String content;
	private Date regdate;
	private int report;
	private String detail;
	
}
