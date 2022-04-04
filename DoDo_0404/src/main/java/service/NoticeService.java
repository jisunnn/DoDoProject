package service;

import java.util.List;

import vo.NoticeVO;
import vo.PageVO;
 
public interface NoticeService {

	// ** PageList1.
	PageVO<NoticeVO> pageList(PageVO<NoticeVO> pvo); // pageList 1 
	
	// **  CRUD
	List<NoticeVO> selectList(); //selectList
	
	NoticeVO selectOne(NoticeVO vo); //selectOne
	
	int insert(NoticeVO vo); //insert
	
	int update(NoticeVO vo); //update
	
	int delete(NoticeVO vo); //delete
	
	// ** 조회수증가
	int countUp(NoticeVO vo); //countUp
	

}