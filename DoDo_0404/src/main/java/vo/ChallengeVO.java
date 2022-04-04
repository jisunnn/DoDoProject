package vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
 
@Data
public class ChallengeVO {
	private int seq;
	private String title;
	private Date regdate;
	private String id;
	private String sdate;
	private int term;
	private String content;
	private int cnt;
	private String state;
	private String category;
	
	private String thumbnail;
	private MultipartFile thumbnailf;
	// form 의 Upload_Image 정보를 전달받기위한 필드
	// MultipartFile (Interface) -> CommonsMultipartFile
	
	private String check;
	
	private String loginID;
}
