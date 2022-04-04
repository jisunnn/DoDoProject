package green.with.dodo;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import service.RankingService;
import vo.RankingVO;

@Controller
public class HomeController {
	 
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@Autowired
	RankingService rservice;
   
	@RequestMapping(value = "/ranklist")
	public ModelAndView ranklist(ModelAndView mv) {
		
		List<RankingVO> list = new ArrayList<RankingVO>();
    	list = rservice.selectList();
    	
    	if ( list!=null && list.size()>0 ) mv.addObject("rankbanana", list);
    	else mv.addObject("message", "출력 자료가 없습니다 ");
		
    	mv.setViewName("board/ranking");
		return mv;
	}
	
	@RequestMapping(value = "/myPage")
	public ModelAndView myPage(ModelAndView mv) {
		mv.setViewName("myPage/myPage");
		return mv;
	}
	
	@RequestMapping(value = "/mList")
	public ModelAndView mList(ModelAndView mv) {
		mv.setViewName("member/mList");
		return mv;
	}
	
	@RequestMapping(value = "/info")
	public ModelAndView info(ModelAndView mv) {
		mv.setViewName("myPage/info");
		return mv;
	}
	
}
