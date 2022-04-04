package service;

import java.util.List;

import vo.ReplyVO;

public interface ReplyService {
	 
	int rinsert(ReplyVO vo);
	List<ReplyVO> rList(int seq);
	int rreport(ReplyVO vo);
	
	List<ReplyVO> reportedList(String nick);
	
}