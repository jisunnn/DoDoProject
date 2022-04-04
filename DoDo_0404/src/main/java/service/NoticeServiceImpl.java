package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.NoticeMapper;
import vo.NoticeVO;
import vo.PageVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	 
	@Autowired
	NoticeMapper dao;
	
	// ** PageList1.
	@Override
	public PageVO<NoticeVO> pageList(PageVO<NoticeVO> pvo) {
		pvo.setTotalRowCount(dao.totalRowCount());
		pvo.setList(dao.pageList(pvo));
		return pvo;
	} //pageList
	
	@Override
	public List<NoticeVO> selectList() {
		return dao.selectList();
	} //selectList
	
	@Override
	public NoticeVO selectOne(NoticeVO vo) {
		return dao.selectOne(vo);
	} //selectOne

	@Override
	public int insert(NoticeVO vo) {
		return dao.insert(vo) ;
	} //insert
	
	@Override
	public int update(NoticeVO vo) {
		return dao.update(vo) ;
	} //update
	
	@Override
	public int delete(NoticeVO vo) {
		return dao.delete(vo) ;
	} //delete
	
	// ** 조회수증가
	@Override
	public int countUp(NoticeVO vo) {
		return dao.countUp(vo) ;
	} //countUp
	
} //class