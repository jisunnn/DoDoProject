package mapperInterface;

import java.util.List;

import vo.NoticeVO;
import vo.PageVO;

public interface NoticeMapper {
	 
	// ** PageList1.
	int totalRowCount();
	List<NoticeVO> pageList(PageVO<NoticeVO> pvo);  
	 
	// **  CRUD
	List<NoticeVO> selectList(); //selectList
	
	NoticeVO selectOne(NoticeVO vo); //selectOne
	
	int insert(NoticeVO vo); //insert
	
	int update(NoticeVO vo); //update
	
	int delete(NoticeVO vo); //delete
	
	// ** 조회수증가
	int countUp(NoticeVO vo); //countUp
	
} //interface