package service;

import java.util.List;

import vo.ChallengeVO;
import vo.PiledataVO;

public interface PiledataService {
	 
	int participate(ChallengeVO vo);
	PiledataVO checkParticipate(ChallengeVO vo);
	int attend(ChallengeVO vo);
	List<PiledataVO> checkAttend(ChallengeVO vo);
	List<PiledataVO> selectResult(ChallengeVO vo);
	List<PiledataVO> participateResult(String loginID);
	
}