package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.RankingMapper;
import vo.RankingVO;

@Service
public class RankingServiceImpl implements RankingService {
	 
	@Autowired
	RankingMapper dao;
	
	@Override
	public List<RankingVO> selectList() {
		return dao.selectList();
	} //selectList
	
} //class