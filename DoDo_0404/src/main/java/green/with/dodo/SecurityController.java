package green.with.dodo;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.ChallengeService;
import service.MemberService;
import service.ReplyService;
import vo.MemberVO;
import vo.PageVO;
import vo.ReplyVO;

@Controller
public class SecurityController {
	 
	@Autowired
	MemberService service;
	@Autowired
	ReplyService rService;
	@Autowired
	ChallengeService cService;
	
	@GetMapping("/adminLogin")
	public String adminLogin(HttpServletRequest request, String message, Model model) {
		/*
		// 기존 member용 아이디 
		logout HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		 */
        request.getSession().setAttribute("secAdmin", "admin");
        System.out.println("setAttribute: secAdmin, admin 설정");
		
		if(message != null) {
			model.addAttribute("error", "관리자 로그인 에러 : 계정확인");
		}
		if(message != null) {
			model.addAttribute("logout", "로그아웃되지 않은 상태입니다");
		}
		
		return "admin/adminLogin";
	}
	
	@RequestMapping(value="/adminLogout")
	public String aLogout(ModelAndView mv) {
		System.out.println("관리자 로그아웃");
		return "redirect:/";
	}
	
	@Secured({"ROLE_ADMIN"})
	@GetMapping("/adminList")
	public ModelAndView adminMList(ModelAndView mv, PageVO<MemberVO> pvo) {
		
		int currPage = 1;
		if(pvo.getCurrPage() > 1) {
			currPage = pvo.getCurrPage();
		} else {
			pvo.setCurrPage(currPage);
		}
		int sno = (currPage - 1) * pvo.getRowsPerPage();
		int eno = sno + pvo.getRowsPerPage() - 1;
		pvo.setSno(sno);
		pvo.setEno(eno);
		pvo = service.pageList(pvo);
		int totalPageNo = pvo.getTotalRowCount()/pvo.getRowsPerPage();
		if (pvo.getTotalRowCount()%pvo.getRowsPerPage() != 0) {
			totalPageNo += 1;
		}
		int sPageNo = ((currPage - 1) / pvo.getPageNoCount()) * pvo.getPageNoCount() + 1;
		int ePageNo = sPageNo + pvo.getPageNoCount() - 1;
		if(ePageNo > totalPageNo) {
			ePageNo = totalPageNo;
		}
		mv.addObject("sPageNo", sPageNo);
		mv.addObject("ePageNo", ePageNo);
		mv.addObject("pageNoCount", pvo.getPageNoCount());
		
		mv.addObject("currPage", currPage);
		mv.addObject("totalPageNo", totalPageNo);
		mv.addObject("memList", pvo.getList());
				
		mv.setViewName("admin/memberList");
		return mv;
	}
	
	@Secured({"ROLE_ADMIN"})
	@GetMapping("/mdetail")
	public ModelAndView memberDetail(HttpServletRequest request, ModelAndView mv, MemberVO vo) throws ServletException, IOException{
	
		String id = vo.getId();
		vo.setId(id);
		vo = service.selectOne(vo);
		mv.addObject("selectedMember", vo);
		mv.setViewName("admin/memberDetail");

		List<ReplyVO> rvo = rService.reportedList(vo.getNick());

		mv.addObject("reportedReplies", rvo);

		return mv;
	}
}
