package service;

import java.util.List;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.ChallengeMapper;
import vo.ChallengeVO;

@Service
public class ChallengeServiceImpl implements ChallengeService {
	
	@Autowired
	ChallengeMapper dao;
	
	@Override
	public List<ChallengeVO> selectList() {
		return dao.selectList();
	}
	@Override
	public ChallengeVO selectOne(ChallengeVO vo) {
		return dao.selectOne(vo);
	}
	@Override
	public List<ChallengeVO> selectParticipate(String loginID) {
		return dao.selectParticipate(loginID);
	}
	@Override
	public List<ChallengeVO> selectRecruit() {
		return dao.selectRecruit();
	}
	@Override
	public List<ChallengeVO> selectDoing() {
		return dao.selectDoing();
	}
	@Override
	public List<ChallengeVO> selectDone() {
		return dao.selectDone();
	}
	@Override
	public int insert(ChallengeVO vo) {
		return dao.insert(vo);
	}
	@Override
	public int update(ChallengeVO vo) {
		return dao.update(vo);
	}
	@Override
	public int delete(ChallengeVO vo) {
		return dao.delete(vo);
	}
	@Override
	public int deleteParticipate(ChallengeVO vo) {
		return dao.deleteParticipate(vo);
	}
	@Override
	public int deleteReply(ChallengeVO vo) {
		return dao.deleteReply(vo);
	}
	@Override
	public int countUp(ChallengeVO vo) {
		return dao.countUp(vo);
	}
	@Override
	public List<ChallengeVO> checkCategory(ChallengeVO vo) {
		return dao.checkCategory(vo);
	}
	@Override
	public List<ChallengeVO> checkTitle(ChallengeVO vo) {
		return dao.checkTitle(vo);
	}
	@Override
	public List<ChallengeVO> checkState(ChallengeVO vo) {
		return dao.checkState(vo);
	}
	@Override
	public int updateDoing() {
		return dao.updateDoing();
	}
	@Override
	public int updateDone() {
		return dao.updateDone();
	}
	
} //class
