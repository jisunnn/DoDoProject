package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.PiledataMapper;
import vo.ChallengeVO;
import vo.PiledataVO;

@Service
public class PiledataServiceImpl implements PiledataService {
	 
	@Autowired
	PiledataMapper dao;

	@Override
	public int participate(ChallengeVO vo) {
		return dao.participate(vo);
	}
	@Override
	public PiledataVO checkParticipate(ChallengeVO vo) {
		return dao.checkParticipate(vo);
	}
	@Override
	public int attend(ChallengeVO vo) {
		return dao.attend(vo);
	}
	@Override
	public List<PiledataVO> checkAttend(ChallengeVO vo) {
		return dao.checkAttend(vo);
	}
	@Override
	public List<PiledataVO> selectResult(ChallengeVO vo) {
		return dao.selectResult(vo);
	}
	@Override
	public List<PiledataVO> participateResult(String loginID) {
		return dao.participateResult(loginID);
	}
	
} //class
