package green.with.dodo;

import java.io.IOException;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.MemberService;
import vo.MemberVO;

@Controller
public class MemberController {
	 
	@Autowired
	MemberService service ;
	 
	@RequestMapping(value = "/loginform")
	public ModelAndView loginf(ModelAndView mv) {
		mv.setViewName("member/loginForm");
		return mv;
	}
		
	@RequestMapping(value = "/mLogin")
	public ModelAndView login(HttpServletRequest request, ModelAndView mv, MemberVO vo)
			throws ServletException, IOException {
		
		String id = vo.getId();
		String password = vo.getPassword();
		String uri = "member/loginForm";
		
		vo.setId(id);
		vo = service.selectOne(vo);
		if ( vo != null ) { // id확인
			if ( password.equals(vo.getPassword()) ) { //password확인
				// Login 성공
				request.getSession().setAttribute("loginID", id);
				request.getSession().setAttribute("nickName", vo.getNick());
				request.getSession().setAttribute("loginName", vo.getName());
				request.getSession().setAttribute("loginPW", password);
				request.getSession().setAttribute("loginPoint", vo.getPoint());
				uri="redirect:/";
			} else if( password.equals(vo.getTmpPassword()) ) {
				request.getSession().setAttribute("loginID", id);
				request.getSession().setAttribute("nickName", vo.getNick());
				request.getSession().setAttribute("loginName", vo.getName());
				request.getSession().setAttribute("loginPW", password);
				uri="redirect:pwUpdatef" ;
			} else {
				// Password 오류
				mv.addObject("message", "비밀번호가 일치하지 않습니다.");
			}
		}else {	// ID 오류
			mv.addObject("message", "존재하지 않는 ID입니다.");
		}
		mv.setViewName(uri);
		return mv;
	} //login
	
	@RequestMapping(value = "/mlogout")
	public ModelAndView logout(HttpServletRequest request, ModelAndView mv, RedirectAttributes rttr) 
			throws ServletException, IOException{
		
		HttpSession session = request.getSession(false); // session이 없으면 null 리턴
		
		if (session != null) {
			session.invalidate();
		}
		rttr.addFlashAttribute("message", "로그아웃 완료");
		mv.setViewName("redirect:/");		
		
		return mv;
	} // logout
	
	@RequestMapping(value = "/joinf")
	public ModelAndView joinf(ModelAndView mv) {
		mv.setViewName("member/joinForm");
		return mv;
	}
	
    @RequestMapping(value = "/join")
    public ModelAndView join(HttpServletRequest request, ModelAndView mv, MemberVO vo) 
    				 	throws IOException {
    	String uri = "member/loginForm";  // 성공시 로그인폼으로
    	if ( service.insert(vo) > 0 ) {
    		service.pointplusRid(vo);
    		mv.addObject("message", "가입 완료되었습니다. 로그인 후 이용하세요.");
    	 }else { 
    		 mv.addObject("message", "가입에 실패하였습니다. 관리자에게 문의하세요.");
    		 uri="member/joinForm";
    	 }
    	mv.setViewName(uri);
    	return mv;
    } //join
        
    @RequestMapping(value = "/mdelete")
    public ModelAndView mdelete(HttpServletRequest request, 
    		ModelAndView mv, MemberVO vo, RedirectAttributes rttr) {
    	String uri = "home";
    	String id = null;
    	
    	HttpSession session = request.getSession(false);
    	if (session != null && session.getAttribute("loginID")!=null ) {
    		id = (String)session.getAttribute("loginID");
    		if (!id.equals("admin")) {
    			vo.setId(id); //관리자 아닐 경우 setId
    		}
    		if (service.delete(vo)>0) {
    			if (!id.equals("admin")) { 
    				session.invalidate();
    				mv.addObject("message", "탈퇴 성공");
    				uri="home";
    			}else {
    				// 관리자일 경우 home 안 가고 페이지 그대로?
    				// uri = "redirect:mlist";
    				rttr.addFlashAttribute("message", "회원 삭제 성공");
    			}
    		}else { //삭제오류
    			//uri = "redirect:mdetial";
    			rttr.addFlashAttribute("탈퇴 오류");
    		}
    	}else {
    		uri="member/loginForm";
    		mv.addObject("message", "로그인 정보 없음 : 로그인 후 탈퇴 가능");
    	}
    	mv.setViewName(uri);
    	return mv;
    } //mdelete
    
    @RequestMapping(value="/mUpdatef")
    public ModelAndView mUpdatef(HttpServletRequest request, ModelAndView mv, MemberVO vo) 
    		throws ServletException, IOException{
    	HttpSession session = request.getSession(false);
    	
    	if(vo.getId() == null || vo.getId().length() < 1 ) {
    		if (session != null && session.getAttribute("loginID") != null) {
    			vo.setId((String)session.getAttribute("loginID"));
    		}
    	}
    	String uri = "myPage/mUpdateForm";
    	vo = service.selectOne(vo);
    	if (vo != null) {
    	    mv.addObject("loginUser", vo);
    	} else {
    		mv.addObject("message", request.getParameter("id") + "님의 자료는 존재하지 않습니다.");
    	}
    	mv.setViewName(uri);
    	return mv;
    }
    
    @RequestMapping(value="/mUpdate")
    public ModelAndView mupdate(HttpServletRequest request, ModelAndView mv, MemberVO vo, RedirectAttributes rttr) 
    		throws IOException {
    	if ( service.update(vo) > 0 ) {
    		rttr.addFlashAttribute("message", "회원정보 수정 완료");
    		request.getSession().setAttribute("loginName",  vo.getName());
    	} else { // 실패시
    		rttr.addFlashAttribute("message", "회원정보 수정 실패");
    	}
    	mv.setViewName("redirect:/");
    	return mv;    	
    }
    
    @RequestMapping(value="/idcheck")
    public ModelAndView idcheck(ModelAndView mv, MemberVO vo) {
    	mv.addObject("newID", vo.getId());
    	if (service.selectOne(vo) != null) {
    		mv.addObject("canUseId", "F"); //사용불가
    		System.out.println("아이디중복됨 - 사용불가");
    	} else {
    		mv.addObject("canUseId", "T"); //사용가능
    		System.out.println("아이디중복아님 - 사용가능");
    	}
    	mv.setViewName("member/idDupCheck");
    	return mv;
    }
	
    @RequestMapping(value="/mailcheck")
    public ModelAndView mailcheck(ModelAndView mv, MemberVO vo) {
    	mv.addObject("newMail", vo.getMail());
    	if(service.selectOnebyMail(vo) != null) {
    		mv.addObject("canUseMail", "F"); //사용불가
    		System.out.println("메일중복됨 사용불가");
    	} else {
    		mv.addObject("canUseMail", "T");
    		System.out.println("메일 사용가능");
    	}
    	mv.setViewName("member/mailDupCheck");
    	return mv;
    }
    
// =====================================================================================
	
	@RequestMapping(value = "/pwUpdatef")
	public ModelAndView pwUpdatef(ModelAndView mv) {
		mv.setViewName("member/pwUpdateForm");
		return mv;
	}
	
	@RequestMapping(value = "/pwUpdate")
	public ModelAndView pwUpdate(HttpSession session, HttpServletRequest request, ModelAndView mv, MemberVO vo, RedirectAttributes rttr)
			throws IOException {
		String uri = "redirect:loginform";
		
		if ( service.pwUpdate(vo) > 0 ) { 
			service.tmpDelete(vo);
			session.invalidate();
			rttr.addFlashAttribute("message", "※ 비밀번호 수정 완료, 다시 로그인해주세요 ※");
			mv.addObject("message", "※ 비밀번호 수정 완료, 다시 로그인해주세요 ※");
		} else {
			mv.addObject("message", "※ 비밀번호 수정 실패, 다시 시도해주세요 ※");
			uri = "member/pwUpdateForm";
		}
		mv.setViewName(uri);
		return mv;
	}
	
	@RequestMapping(value = "/findf")
	public ModelAndView findf(ModelAndView mv) {
		mv.setViewName("member/findForm");
		return mv;
	}
	
	@RequestMapping(value = "/findID")
	public ModelAndView findID(ModelAndView mv, MemberVO vo, HttpSession session, HttpServletRequest request, RedirectAttributes rttr) 
					 	throws IOException {
		String uri = "member/findForm";
		vo = service.findID(vo);
		if ( vo != null ) { 
			System.out.println("check : 0, id => "+vo.getId());
			session.setAttribute("findID", vo.getId()); 
		}else { 
			System.out.println("※ 해당 정보와 일치하는 회원 정보 없음 ※");
			session.setAttribute("findID", "※ 해당 정보와 일치하는 회원 정보 없음 ※");
		}
		mv.setViewName(uri); 
		return mv;
	}
	
	@RequestMapping(value = "/findPW")
	public ModelAndView findPW(ModelAndView mv, MemberVO vo, HttpSession session) 
					 	throws IOException {
		String uri = "redirect:loginform";
		vo = service.findPW(vo);
		if ( vo != null ) { 
			System.out.println("check : 0, password => "+vo.getPassword());
			session.setAttribute("findPW", vo.getPassword());
			session.setAttribute("mail", vo.getMail());
		}else {
			System.out.println("※ 해당 정보와 일치하는 회원 정보 없음 ※");
			mv.addObject("message", "※ 해당 정보와 일치하는 회원 정보 없음 ※");
			uri = "member/findForm";
		} 
		mv.setViewName(uri);
		return mv;
	}
	
	@Autowired
	private JavaMailSender mailSender;
	@RequestMapping(value = "/sendMail")
	public String mailSend(HttpServletRequest request, MemberVO vo, HttpSession session) {
		
		Random random = new Random();
		String tmpPassword = String.valueOf(random. nextInt(888888)+111111);
		vo.setTmpPassword(tmpPassword);
		
		if( service.setPassword(vo) > 0) {
			try {
				MimeMessage mimeMessage = mailSender.createMimeMessage();
			    MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
	 
			    messageHelper.setFrom("togetherdodo@gmail.com"); // 보내는사람 
			    messageHelper.setTo(vo.getMail());   // 받는사람
			    messageHelper.setSubject("너Do, 나Do 임시 비밀번호 발송");   // 메일제목
			    messageHelper.setText("아이디 '"+vo.getId()+"'님의 임시 비밀 번호는 "+vo.getTmpPassword()+" 입니다."); // 메일 내용
	 
			    mailSender.send(mimeMessage);
			} catch (Exception e) {
				System.out.println("메일 발송 실패 => "+e.toString());
			}
		}
		session.invalidate();
		return "member/loginForm";
	}
	
	
} //MemberController
