package green.with.dodo;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.ChallengeService;
import service.MemberService;
import service.PiledataService;
import service.ReplyService;
import vo.ChallengeVO;
import vo.PiledataVO;
import vo.ReplyVO;

@Controller
public class ChallengeController {
 
	@Autowired
	ChallengeService service;
	@Autowired
	ReplyService rservice;
	@Autowired
	PiledataService pservice;
	@Autowired
	MemberService mservice;

	@RequestMapping(value = "/cinsertf")
	public ModelAndView loginf(ModelAndView mv) {
		mv.setViewName("challenge/cinsertForm");
		return mv;
	}

	@RequestMapping(value = "/cinsert")
	public ModelAndView cinsert(HttpServletRequest request, ModelAndView mv, ChallengeVO vo, RedirectAttributes rttr)
			throws IOException {
		String uri = "redirect:clist";

		String realPath = request.getRealPath("/"); // deprecated Method
		System.out.println("** realPath => " + realPath);

		if (realPath.contains(".eclipse."))
			realPath = "C:/MTest/HJWork/DoDo_test/src/main/webapp/resources/image/";
		// realPath = "D:/MTest/HJWork/DoDo/src/main/webapp/resources/image/";
		// realPath =
		// "D:/MTest/HJWork/DoDo/src/main/webapp/resources/uploadImage/"+vo.getId()+"/";
		else
			realPath += "resources\\image\\";
		File f1 = new File(realPath);
		if (!f1.exists())
			f1.mkdir();
		String file1, file2 = "resources/image/basic.jpg";
		MultipartFile uploadfilef = vo.getThumbnailf();
		if (uploadfilef != null && !uploadfilef.isEmpty()) {
			file1 = realPath + uploadfilef.getOriginalFilename();
			uploadfilef.transferTo(new File(file1));
			file2 = "resources/image/" + uploadfilef.getOriginalFilename();
		}
		vo.setThumbnail(file2);

		if (service.insert(vo) > 0) {
			mservice.pointMinus1(vo.getId());
			pservice.participate(vo);
			rttr.addFlashAttribute("message", "??? ?????? ?????? ?????? ???");
		} else {
			mv.addObject("message", "??? ?????? ?????? ?????? ???");
			uri = "challenge/cinsertForm";
		}
		mv.setViewName(uri);
		return mv;
	} // cinsert

	@RequestMapping(value = "/clist")
	public ModelAndView clist(ModelAndView mv) {
		List<ChallengeVO> list = new ArrayList<ChallengeVO>();
		list = service.selectList();
		service.updateDoing();
		service.updateDone();
		if (list != null && list.size() > 0)
			mv.addObject("banana", list);
		else
			mv.addObject("message", "??? ?????? ????????? ???????????? ???");

		mv.setViewName("challenge/cList");
		return mv;
	} // clist
	
	@RequestMapping(value = "/recruitlist")
	public ModelAndView recruitlist(ModelAndView mv) {
		List<ChallengeVO> list = new ArrayList<ChallengeVO>();
		list = service.selectRecruit();
		if (list != null && list.size() > 0)
			mv.addObject("banana", list);
		else
			mv.addObject("message", "??? ?????? ????????? ???????????? ???");

		mv.setViewName("challenge/pList");
		return mv;
	} // recruitlist
	
	@RequestMapping(value = "/doinglist")
	public ModelAndView doinglist(ModelAndView mv) {
		List<ChallengeVO> list = new ArrayList<ChallengeVO>();
		list = service.selectDoing();
		if (list != null && list.size() > 0)
			mv.addObject("banana", list);
		else
			mv.addObject("message", "??? ?????? ????????? ???????????? ???");

		mv.setViewName("challenge/pList");
		return mv;
	} // doinglist
	
	@RequestMapping(value = "/donelist")
	public ModelAndView donelist(ModelAndView mv) {
		List<ChallengeVO> list = new ArrayList<ChallengeVO>();
		list = service.selectDone();
		if (list != null && list.size() > 0)
			mv.addObject("banana", list);
		else
			mv.addObject("message", "??? ?????? ????????? ???????????? ???");

		mv.setViewName("challenge/pList");
		return mv;
	} // donelist
	
	@RequestMapping(value = "/plist")
	public ModelAndView plist(ModelAndView mv, HttpSession session, ChallengeVO vo) {
		List<ChallengeVO> list = new ArrayList<ChallengeVO>();
		list = service.selectParticipate((String)session.getAttribute("loginID"));
		if (list != null && list.size() > 0) {
			mv.addObject("banana", list);
		} else
			mv.addObject("message", "??? ?????? ????????? ???????????? ???");

		mv.setViewName("challenge/pList");
		return mv;
	} // plist
	
	@RequestMapping(value = "/mplist")
	public ModelAndView mplist(ModelAndView mv, HttpSession session, ChallengeVO vo) {
		List<ChallengeVO> list = new ArrayList<ChallengeVO>();
		list = service.selectParticipate((String)session.getAttribute("loginID"));
		if (list != null && list.size() > 0) {
			mv.addObject("banana", list);
		} else
			mv.addObject("message", "??? ?????? ????????? ???????????? ???");

		mv.setViewName("challenge/mypage_pList");
		return mv;
	} // plist
	

	@RequestMapping(value = "/resultlist")
	public ModelAndView resultlist(ModelAndView mv, HttpSession session, ChallengeVO vo) {
		List<PiledataVO> result = new ArrayList<PiledataVO>();
		result = pservice.participateResult((String)session.getAttribute("loginID"));
		if (result != null && result.size() > 0) {
			mv.addObject("result", result);
		} else
			mv.addObject("message", "??? ?????? ????????? ???????????? ???");

		mv.setViewName("challenge/progressList");
		return mv;
	}

	
	@RequestMapping(value = "/cdetail")
	public ModelAndView cdetail(HttpServletRequest request, ModelAndView mv, ChallengeVO vo, HttpSession session) {
		String uri = "challenge/cDetail";
		vo = service.selectOne(vo);
		vo.setLoginID((String) session.getAttribute("loginID"));
		List<ReplyVO> rlist = new ArrayList<ReplyVO>();
		List<PiledataVO> plist = new ArrayList<PiledataVO>();
		rlist = rservice.rList(vo.getSeq());
		plist = pservice.selectResult(vo);
		if (vo != null) {
			// ??????
			if ("U".equals(request.getParameter("jcode")))
				uri = "challenge/cupdateForm";
			mv.addObject("apple", vo);
			// ?????? ?????????
			if (rlist != null && rlist.size() > 0) {
				mv.addObject("cherry", rlist);
				mv.setViewName("redirect:cdetail?seq=" + vo.getSeq());
			}else {
				mv.addObject("rmessage", "??? ????????? ?????? ???????????? ???");
				mv.setViewName("redirect:cdetail?seq=" + vo.getSeq());
			}
			// ????????? ?????????
			if (plist != null && plist.size() > 0) {
				mv.addObject("result", plist);
				mv.setViewName("redirect:cdetail?seq=" + vo.getSeq());
			}else {
				mv.addObject("rmessage", "??? ?????? ????????? ???????????? ???");
				mv.setViewName("redirect:cdetail?seq=" + vo.getSeq());
			}
		} else {
			mv.addObject("message", "??? ???????????? ???????????? ????????? ???????????? ???");
		}
		mv.setViewName(uri);
		return mv;
	} // cdetail

	@RequestMapping(value = "/checkTitle")
	public ModelAndView checkTitle(ModelAndView mv, ChallengeVO vo) {
		List<ChallengeVO> list = null;
		if (vo.getCheck() != null)
			list = service.checkTitle(vo);
		else
			list = service.selectList();

		if (list != null && list.size() > 0)
			mv.addObject("banana", list);
		else
			mv.addObject("message", "??? ????????? ????????? 1?????? ???????????? ???");

		mv.setViewName("challenge/cList");
		return mv;
	} // checkTitle

	@RequestMapping(value = "/checkCategory")
	public ModelAndView checkCategory(ModelAndView mv, ChallengeVO vo) {
		List<ChallengeVO> list = null;
		if (vo.getCheck() != null)
			list = service.checkCategory(vo);
		else
			list = service.selectList();
		if (list != null && list.size() > 0)
			mv.addObject("banana", list);
		else
			mv.addObject("message", "??? ????????? ????????? 1?????? ???????????? ???");

		mv.setViewName("challenge/cList");
		return mv;
	} // checkCategory

	@RequestMapping(value = "/checkState")
	public ModelAndView checkState(ModelAndView mv, ChallengeVO vo) {
		List<ChallengeVO> list = null;
		if (vo.getCheck() != null)
			list = service.checkState(vo);
		else
			list = service.selectList();
		if (list != null && list.size() > 0)
			mv.addObject("banana", list);
		else
			mv.addObject("message", "??? ????????? ????????? 1?????? ???????????? ???");

		mv.setViewName("challenge/cList");
		return mv;
	} // checkCategory

	@RequestMapping(value = "/cupdate")
	public ModelAndView cupdate(HttpServletRequest request, ModelAndView mv, ChallengeVO vo, RedirectAttributes rttr)
			throws IOException {
		String uri = "";
		if (service.update(vo) > 0) {
			rttr.addFlashAttribute("message", "??? ????????? ?????? ???");
			uri = "redirect:clist";
		} else {
			rttr.addFlashAttribute("message", "??? ????????? ?????? ???");
			uri = "redirect:cdetail?jcode=U&seq=" + vo.getSeq();
		}
		mv.setViewName(uri);
		return mv;
	} // cupdate

	@RequestMapping(value = "/cdelete")
	public ModelAndView cdelete(HttpServletRequest request, ModelAndView mv, ChallengeVO vo, RedirectAttributes rttr) {
		String uri = "redirect:clist";
		if (service.delete(vo) > 0) {
			service.deleteParticipate(vo);
			service.deleteReply(vo);
			rttr.addFlashAttribute("message", "??? ???,?????????, ?????? ?????? ?????? ???");
		} else {
			rttr.addFlashAttribute("message", "??? ????????? ?????? ???");
			uri = "redirect:cdetail?seq=" + vo.getSeq();
		}
		mv.setViewName(uri);
		return mv;
	} // cdelete

	@RequestMapping(value = "/participate")
	public ModelAndView patricipate(ModelAndView mv, ChallengeVO vo, RedirectAttributes rttr, HttpSession session) {
		String uri = "redirect:cdetail?seq=" + vo.getSeq();
		vo.setLoginID((String) session.getAttribute("loginID"));
		if (pservice.checkParticipate(vo) != null) {
			rttr.addFlashAttribute("message", "??? ?????? ???????????? ?????? ????????????????????? ???");
		} else {
			if (pservice.participate(vo) > 0) {
				mservice.pointMinus2(vo.getLoginID());
				rttr.addFlashAttribute("message", "??? ????????? ?????? ?????? ???");
			} else {
				mv.addObject("message", "??? ????????? ?????? ?????? ???");
				uri = "challenge/cList";
			}
		}
		mv.setViewName(uri);
		return mv;
	} // participate
	
	@RequestMapping(value = "/attend")
	public ModelAndView attend(HttpServletRequest request, ModelAndView mv, ChallengeVO vo, RedirectAttributes rttr, HttpSession session) {
		String uri = "redirect:cdetail?seq=" + vo.getSeq();
		vo.setLoginID((String) session.getAttribute("loginID"));
		vo.setSeq(Integer.parseInt(request.getParameter("seq")));
		List<PiledataVO> list = null;
		list = pservice.checkAttend(vo);
		if( list != null && list.size() > 0) {
			rttr.addFlashAttribute("message", "??? ????????? ?????? ????????????????????? ???");
		} else {
			if (pservice.checkParticipate(vo) != null) {
				if (pservice.attend(vo) > 0) {
					rttr.addFlashAttribute("amessage", "??? ?????? ?????? ???");
				} else {
					mv.addObject("amessage", "??? ?????? ?????? ???");
					uri = "challenge/cList";
				}
			} else {
				rttr.addFlashAttribute("amessage", "??? ???????????? ?????? ????????? ????????? ???");
			}
		}
		mv.setViewName(uri);
		return mv;
	} // attend
	
	@RequestMapping(value = "/donePoint")
	public ModelAndView donePoint(HttpServletRequest request, ModelAndView mv, ChallengeVO vo, RedirectAttributes rttr, HttpSession session) {
		String uri = "redirect:cdetail?seq=" + vo.getSeq();
		vo.setLoginID(request.getParameter("loginID"));
		vo.setSeq(Integer.parseInt(request.getParameter("seq")));
		if( mservice.pointPlus1(vo.getLoginID()) > 0 ) {
			if(	mservice.pointPlus2(vo.getSeq()) > 0 )
				rttr.addFlashAttribute("message", "??? ????????? ?????? ????????????????????? ???");
			else
				rttr.addFlashAttribute("message", "??? ????????? ????????? ????????? ????????????????????? ???");
		} else {
			rttr.addFlashAttribute("message", "??? ????????? ????????? ????????? ????????????????????? ???");
		}
		mv.setViewName(uri);
		return mv;
	} // donePoint

	@RequestMapping(value = "/rinsert")
	public ModelAndView rinsert(ModelAndView mv, ReplyVO vo, RedirectAttributes rttr) {
		String uri = "redirect:cdetail?seq=" + vo.getSeq();
		vo.setStep(vo.getStep() + 1);

		if (rservice.rinsert(vo) > 0) {
			rttr.addFlashAttribute("rmessage", "??? ?????? ?????? ?????? ???");
		} else {
			vo.setStep(vo.getStep() - 1);
			mv.addObject("rmessage", "??? ?????? ?????? ?????? ???");
		}
		mv.setViewName(uri);
		return mv;
	} // rinsert
	
	@RequestMapping(value = "/rreport")
	public ModelAndView rreport(ModelAndView mv, ReplyVO vo, RedirectAttributes rttr) {
		String uri = "redirect:cdetail?seq=" + vo.getSeq();
		if (rservice.rreport(vo) > 0) {
			rttr.addFlashAttribute("rmessage", "??? ?????? ?????? ?????? ???");
		} else {
			rttr.addFlashAttribute("rmessage", "??? ?????? ?????? ?????? ???");
			mv.addObject("rmessage", "??? ?????? ?????? ?????? ???");
		}
		mv.setViewName(uri);
		return mv;
	} // rreport

}
