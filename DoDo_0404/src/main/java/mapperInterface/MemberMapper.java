package mapperInterface;

import java.util.List;

import vo.MemberVO;
import vo.PageVO;

public interface MemberMapper {
	 
	MemberVO selectOne(MemberVO vo); //selectOne
	MemberVO selectOnebyMail(MemberVO vo);
	int insert(MemberVO vo); //insert
	int update(MemberVO vo); //update
	int delete(MemberVO vo); //delete	
	
	MemberVO findID(MemberVO vo);
	MemberVO findPW(MemberVO vo);
	
	int setPassword(MemberVO vo);
	int pwUpdate(MemberVO vo);
	int tmpDelete(MemberVO vo);
	
	List<MemberVO> pageList(PageVO<MemberVO> pvo);
	List<MemberVO> selectList();
	int totalRowCount();
	
	int pointMinus1(String id);
	int pointMinus2(String id);
	int pointPlus1(String loginID);
	int pointPlus2(int seq);
	int pointplusRid(MemberVO vo);
	
} //interface
