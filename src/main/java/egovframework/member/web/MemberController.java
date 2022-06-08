package egovframework.member.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.member.bean.MemberBean;
import egovframework.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/main.do")
	public String main() {
		
		return "main/main";
	}
	@RequestMapping(value = "/member/login.do")
	public String loginview() {
		
		return "member/login";
	}
	
	@RequestMapping(value = "/member/info.do")
	public String infoview(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "redirect:/member/login.do";
		}
		
		MemberBean resultBean = memberService.selectMemberOne(id);
		model.addAttribute("resultBean", resultBean);
		return "member/info";
	}
	
	@RequestMapping(value = "/member/joinIdCheck.do")
	public String joinIdCheck(@RequestParam(required = false)String id, Model model) {
		
		int result = memberService.joinIdCheck(id);
		
		model.addAttribute("id",id);
		model.addAttribute("result",result);
		
		return "member/joinIdCheck";
	}
	
	@RequestMapping(value = "/member/loginPro.do")
	public String loginProview(@ModelAttribute("MemberBean")MemberBean memberBean,HttpSession session,Model model,RedirectAttributes rda) {
		
		String resultReturn = "";
		int result = memberService.selectLogin(memberBean);
		if(result > 0 ) {
			session.setAttribute("id", memberBean.getId());
			resultReturn = "redirect:/main.do";
		}else {
			rda.addFlashAttribute("msg",false);
			resultReturn = "redirect:/member/login.do";
		}
		
		return resultReturn;
	}
	
	@RequestMapping(value = "/member/logout.do")
	public String logout(@ModelAttribute("MemberBean")MemberBean memberBean,HttpSession session,Model model) {
		
		session.invalidate();
		
		return "redirect:/member/login.do";
	}
	@RequestMapping(value = "/member/join.do")
	public String joinview() {
		
		return "member/join";
	}
	
	@RequestMapping(value = "/member/joinPro.do")
	public String joinPro(@ModelAttribute("MemberBean")MemberBean bean) {
		String site = "";
		
		int isSuc = memberService.insertMember(bean);
		
		if(isSuc > 0) {
			site = "redirect:/member/login.do";
		}else {
			site = "redirect:/member/join.do";
		}
		
		return site;
	}
	
	@RequestMapping(value = "/member/updatePro.do")
	public String updatePro(@ModelAttribute("MemberBean")MemberBean bean) {
		
		memberService.updateMember(bean);
		
		return "redirect:/member/info.do";
	}
}
