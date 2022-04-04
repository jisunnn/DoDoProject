package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.MemberMapper;
import vo.MemberVO;
import vo.PageVO;
 
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper dao;

	@Override
	public MemberVO selectOne(MemberVO vo) {
		return dao.selectOne(vo);
	}
	@Override
	public MemberVO selectOnebyMail(MemberVO vo) {
		return dao.selectOnebyMail(vo);
	}
	@Override
	public int insert(MemberVO vo) {
		return dao.insert(vo);
	}
	@Override
	public int update(MemberVO vo) {
		return dao.update(vo);
	}
	@Override
	public int delete(MemberVO vo) {
		return dao.delete(vo);
	}
	@Override 
	public MemberVO findID(MemberVO vo) {
		return dao.findID(vo); 
	}
	@Override
	public MemberVO findPW(MemberVO vo) {
		return dao.findPW(vo);
	}
	@Override
	public int setPassword(MemberVO vo) {
		return dao.setPassword(vo);
	}
	@Override
	public int pwUpdate(MemberVO vo) {
		return dao.pwUpdate(vo);
	}
	@Override
	public int tmpDelete(MemberVO vo) {
		return dao.tmpDelete(vo);
	}
	@Override
	public List<MemberVO> selectList() {
		return dao.selectList();
	}
	@Override
	public int totalRowCount() {
		return dao.totalRowCount();
	}
	@Override
	public PageVO<MemberVO> pageList(PageVO<MemberVO> pvo){
		pvo.setTotalRowCount(dao.totalRowCount());
		pvo.setList(dao.pageList(pvo));
		return pvo;
	}
	@Override
	public int pointMinus1(String id) {
		return dao.pointMinus1(id);
	}
	@Override
	public int pointMinus2(String id) {
		return dao.pointMinus2(id);
	}
	@Override
	public int pointPlus1(String loginID) {
		return dao.pointPlus1(loginID);
	}
	@Override
	public int pointPlus2(int seq) {
		return dao.pointPlus2(seq);
	}
	@Override
	public int pointplusRid(MemberVO vo) {
		return dao.pointplusRid(vo);
	}
	
} //class
