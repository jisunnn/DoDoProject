package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.ReplyMapper;
import vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	 
	@Autowired
	ReplyMapper dao;

	@Override
	public int rinsert(ReplyVO vo) {
		return dao.rinsert(vo);
	}
	@Override
	public List<ReplyVO> rList(int seq) {
		return dao.rList(seq);
	}
	@Override
	public int rreport(ReplyVO vo) {
		return dao.rreport(vo);
	}
	@Override
	public List<ReplyVO> reportedList(String nick) {
		return dao.reportedList(nick);
	}
	
} //class
