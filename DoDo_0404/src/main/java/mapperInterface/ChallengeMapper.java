package mapperInterface;

import java.util.List;

import vo.ChallengeVO;
import vo.PageVO;

public interface ChallengeMapper {
	 
	List<ChallengeVO> selectList(); //selectList
	ChallengeVO selectOne(ChallengeVO vo); //selectOne
	List<ChallengeVO> selectParticipate(String loginID);
	List<ChallengeVO> selectRecruit();
	List<ChallengeVO> selectDoing();
	List<ChallengeVO> selectDone();
	
	
	int insert(ChallengeVO vo); //insert
	int update(ChallengeVO vo); //update
	int delete(ChallengeVO vo); //delete
	int deleteParticipate(ChallengeVO vo);
	int deleteReply(ChallengeVO vo);
	
	int countUp(ChallengeVO vo); //countUp
	
	List<ChallengeVO> checkCategory(ChallengeVO vo);
	List<ChallengeVO> checkTitle(ChallengeVO vo);
	List<ChallengeVO> checkState(ChallengeVO vo);
	
	int participate(ChallengeVO vo);
	ChallengeVO checkParticipate(ChallengeVO vo);
	int attend(ChallengeVO vo);
	List<ChallengeVO> checkAttend(ChallengeVO vo);

	int updateDoing();
	int updateDone();
	
} //interface
