package kr.ac.sungkyul.mysite.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.sungkyul.mysite.service.UserService;
import kr.ac.sungkyul.mysite.vo.UsersVo;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired	//rorcp
	UserService userService;
	
	@RequestMapping("/joinform")
	public String joinform(){
		return "user/joinform";
	}
	
//	@ResponseBody
	@RequestMapping("/join")
	public String join(@ModelAttribute UsersVo vo){
		userService.join(vo);
		return "redirect:/user/joinsuccess";
	}
	
	@RequestMapping("/joinSuccess")
	public String joinSuccess(){
		return "user/joinsuccess";
	}
	
	@RequestMapping("/loginform")
	public String loginform(){
		return "user/loginform";
	}
	
	@RequestMapping(value= "/login", method= RequestMethod.POST)
	public String login(
			HttpSession session,
			@RequestParam(value= "email", required=false, defaultValue="") String email,
			@RequestParam(value="password", required=false, defaultValue="") String password){
		UsersVo authUser =  userService.login(email,  password);
		
		if(authUser == null){
			return "redirect:/user/loginform";
		}
		
		//인증성공
		session.setAttribute("authUser",authUser);
		return "redirect:/main";
	}
}