package com.project.controller;

import com.project.service.MemberService;
import com.project.vo.MemberVO;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Random;

@Controller
@AllArgsConstructor
@RequiredArgsConstructor
public class MemberController {

    Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    MemberService memberService;

    @GetMapping(value = "/")
    public String main()throws Exception {
        return "/main/main";
    }

    @GetMapping("/main")
    public String main(@RequestParam("stateCode") int stateCode, Model model){
        model.addAttribute("stateCode", stateCode);
        return "/main/main";
    }


    /** 회원가입 **/
    //닉네임 중복확인
    @ResponseBody
    @RequestMapping(value="/nickCheck", method= RequestMethod.POST)
    public int nickCheck(@RequestBody String mb_nick) throws Exception {

        logger.info("***********nickCheck");

        int count = 0;
        if(mb_nick != null) count = memberService.nickCheck(mb_nick);

        return count;
    }

    //아이디 중복 확인
    @ResponseBody
    @RequestMapping(value="/idCheck", method=RequestMethod.POST)
    public int IdCheck(@RequestBody String mb_id) throws Exception {

        logger.info("***********idCheck");

        int count = 0;
        if(mb_id != null) count = memberService.idCheck(mb_id);

        return count;
    }

    //회원가입 GET
    //@RequestMapping(value="/register", method=RequestMethod.GET)
    @GetMapping(value="/register")
    public void registerGet() throws Exception {
        logger.info("********GET register");
        // void 타입일 경우 접근하는 URL 경로에 해당하는 jsp를 찾아 실행한다.
    }
    
    // 회원가입 시 프로필 이미지 저장
    //@ResponseBody
    @RequestMapping(value={"/register","/memberImg"}, method=RequestMethod.POST)
    public String memberRegister(MemberVO memberVO, MultipartFile file) throws Exception {
        //try 안에 구문이랑 충돌 되니까 이거 꼭 한 번만 쓰기
        //boardService.memberRegister(memberVO,file);

        logger.info("***********register POST");

        int count = memberService.idCheck(memberVO.getMb_id());
        System.out.println(count);

        try {
            if(count == 0) {
                BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
                String encodePass = encoder.encode(memberVO.getMb_pw());
                memberVO.setMb_pw(encodePass);
                memberService.memberRegister(memberVO,file);
            }
        } catch (Exception e) {
            logger.info("*****존재 하는 아이디");
        }
        return "redirect:/";
    }

    //회원가입 시 이메일 인증
    @Autowired
    private JavaMailSender mailSender;

    //이메일 인증 관련
    @ResponseBody
    @RequestMapping(value = "/emailAuth", method={RequestMethod.GET, RequestMethod.POST})
    public String emailAuth(String email) {
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;

        /* 이메일 보내기 */
        String setFrom = "juliepark4253@gmail.com";
        String toMail = email;
        String title = "너나들이 홈페이지 이메일 인증번호 입니다.";
        String content =
                "<div align='center' style='border:1px solid black; font-family:verdana'>" +
                        "<h3 style='color: blue;'>" +
                        "너나들이에 회원가입 해주셔서 감사합니다.<br>" +
                        "해당 인증번호를 복사해서 인증번호 확인란에 기입해주세요.</h3>" +
                        "<p>이메일 인증 번호 : " +
                        checkNum + "</p></div>";

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
        }catch(Exception e) {
            e.printStackTrace();
        }
        return Integer.toString(checkNum);
    }


    /** 로그인 **/

    // 로그인 폼
    @RequestMapping(value="/login")
    public String memberLogin() throws Exception {
        return "/login/login";
    }

    /*@RequestMapping(value="/header", method={RequestMethod.GET, RequestMethod.POST})
    public String header(HttpServletRequest req, Model model, MemberVO memberVO, HttpSession httpSession) throws Exception {
        String id = req.getParameter("id");
        httpSession.setAttribute("id", memberVO.getMb_id()); // 세션에 값을 셋팅하는 방법
        String sessionId = (String) httpSession.getAttribute("id");// 세션에서 값을 가져오는 방법
        return "/fixed/header/header";
    }*/

    // 로그인 기능
    @RequestMapping(value="/userCheck", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView userCheck(@RequestParam(required = false) String code, MemberVO memberVO,
                                  HttpServletRequest req, RedirectAttributes redirect, Model model, HttpSession httpSession) throws Exception {

        ModelAndView mav = new ModelAndView();

        //로그인 처리
        if(code == null) {
            String inputPass = memberVO.getMb_pw(); // 입력한 비밀번호
            MemberVO member = memberService.userCheck(memberVO); // 암호화된 DB비밀번호

            if(member != null) {
                HttpSession session = req.getSession();
                BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

                if(encoder.matches(inputPass, member.getMb_pw())) { // 암호화비교, 성공한 경우
                    session.setAttribute("member", member);

                    //추가
                    if(member.getMb_id().equals("master")) {
                        redirect.addAttribute("stateCode", 0);
                        session.setAttribute("stateCode", 0); //추가
                        mav.setViewName("redirect:/main");
                    } else {
                        redirect.addAttribute("stateCode", 1); // redirect하면서 code를 넣어주는 방법
                        session.setAttribute("stateCode", 1); //추가
                        mav.setViewName("redirect:/main");
                    }

                } else { // 암호를 잘못 입력한 경우
                    mav.addObject("code", "matchesError");
                    mav.setViewName("/login/userCheck");
                }
            } else { // 없는 아이디거나 빈공란
                mav.addObject("code", "nullError");
                mav.addObject("url", "login"); //?
            }

        }
        return mav;
    }

    // 아이디 찾기 폼
    @RequestMapping(value = "/find_id_form.do")
    public String find_id_form() throws Exception{
        return "/login/find_id_form";
    }

    // 아이디 찾기
    @RequestMapping(value = "/find_id.do", method = RequestMethod.GET)
    public String find_id(HttpServletResponse response, @RequestParam("mb_email") String mb_email, Model md) throws Exception {
        md.addAttribute("id", memberService.find_id(response, mb_email));
        return "/login/find_id";
    }


    // 비밀번호 찾기 폼
    @RequestMapping(value = "/find_pw_form.do")
    public String find_pw_form() throws Exception{
        return "/login/find_pw_form";
    }


    // 비밀번호 찾기
    @RequestMapping(value = "/find_pw.do", method = RequestMethod.GET)
    public void find_pw(@ModelAttribute MemberVO memberVO, HttpServletResponse response) throws Exception{
        memberService.find_pw(response, memberVO);
    }

    // 어드민 페이지 - 회원 리스트 보기 및 관리(리스트) - 실패
    @GetMapping(value = "/admin/securityAdmin")
    //@RequestMapping(value = "/admin/admin", method = RequestMethod.GET)
    //@RequestMapping(value = "/admin")
    public String Memberlist(Model model) throws Exception {
        List<MemberVO> memberlist = memberService.Memberlist();
        model.addAttribute("memberlist", memberlist);
        return "/admin/securityAdmin";
    }

    //관리자 페이지 - 회원 강제 탈퇴(DB에서 삭제) - 성공했지만 추후 확인 예정
    @ResponseBody
    @RequestMapping(value = "/dropId", method=RequestMethod.GET)
    public void dropID(String mb_id) throws Exception {
        memberService.dropUser(mb_id);
    }

    // 접근 거부 페이지
    @GetMapping("/admin/securityDenied")
    public String dispDenied() {
        return "/admin/securityDenied";
    }

    /* membeModify */
    // 회원정보 수정 화면 구현 : GET방식(회원정보 수정 페이지 진입시 해당 회원 정보를 새로운 세션과 연결하여 보여주는 역할)
    @RequestMapping(value="/mypage/mypage_05", method=RequestMethod.GET)
    public String memberModifyGET(HttpServletRequest req, Model model, @RequestParam("stateCode") int stateCode) throws Exception {

        HttpSession session = req.getSession();

        MemberVO member = (MemberVO) session.getAttribute("member"); // 로그인시 있던 세션
        MemberVO modifyMember = memberService.membermodifyGET(member.getMb_id());

        model.addAttribute("modifyName", modifyMember.getMb_name());
        model.addAttribute("modifyId", modifyMember.getMb_id());
        //추가
        model.addAttribute("modifyPw", modifyMember.getMb_pw());
        model.addAttribute("stateCode", stateCode);

        return "/mypage/mypage_05";
    }

    // 회원정보 수정 기능 구현 : POST방식 (회원정보 수정시 비동기 처리로 수정해주는 역할)
    @ResponseBody
    @RequestMapping(value="/mypage/mypage_05", method=RequestMethod.POST)
    public void memberModifyPOST(@RequestBody MemberVO memberVO, HttpServletRequest req) throws Exception {

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String encodePass = encoder.encode(memberVO.getMb_pw());
        memberVO.setMb_pw(encodePass);
        memberService.memberModifyPOST(memberVO);
    }

    //비밀번호 변경 시 - 기존 비밀번호와의 일치여부 확인
    @ResponseBody
    @RequestMapping(value="/pw_check", method=RequestMethod.POST)
    public String pw_check(@RequestBody MemberVO memberVO, Model model) throws Exception {

        String pw = memberVO.getMb_pw(); // 입력한 비밀번호
        MemberVO member = memberService.userCheck(memberVO); // 암호화된 DB비밀번호
        String result = "";

        if(memberVO.getMb_id() != null && memberVO.getMb_id() != "") {
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

            if(encoder.matches(pw, member.getMb_pw())) {
                result = "success";
            }
        }
        return result;
    }

    //  닉네임 변경 화면 구현 : GET방식(회원정보 수정 페이지 진입시 해당 회원 정보를 새로운 세션과 연결하여 보여주는 역할)
    @RequestMapping(value="/mypage/mypage_06", method=RequestMethod.GET)
    public String nickModifyGET(HttpServletRequest req, Model model, @RequestParam("stateCode") int stateCode) throws Exception {

        HttpSession session = req.getSession();

        MemberVO member = (MemberVO) session.getAttribute("member"); // 로그인시 있던 세션
        MemberVO modifyMember = memberService.membermodifyGET(member.getMb_id());

        model.addAttribute("modifyId", modifyMember.getMb_id());
        model.addAttribute("modifyNick", modifyMember.getMb_nick());
        model.addAttribute("stateCode", stateCode);

        return "/mypage/mypage_06";
    }

    // 닉네임 수정 기능 구현 : POST방식 (회원정보 수정시 비동기 처리로 수정해주는 역할)
    @ResponseBody
    @RequestMapping(value = "/mypage/mypage_06", method=RequestMethod.POST)
    public void nickModifyPOST(@RequestBody MemberVO memberVO) throws Exception {
        memberService.nickModifyPOST(memberVO);
    }

    // 프로필 변경 화면 구현 : GET방식(회원정보 수정 페이지 진입시 해당 회원 정보를 새로운 세션과 연결하여 보여주는 역할)
    @RequestMapping(value="/mypage/mypage_07", method=RequestMethod.GET)
    public String profileModifyGET(HttpServletRequest req, Model model, @RequestParam("stateCode") int stateCode) throws Exception {

        HttpSession session = req.getSession();

        MemberVO member = (MemberVO) session.getAttribute("member"); // 로그인시 있던 세션
        MemberVO modifyMember = memberService.membermodifyGET(member.getMb_id());

        model.addAttribute("modifyId", modifyMember.getMb_id());
        model.addAttribute("modifyImg", modifyMember.getMb_img());
        model.addAttribute("stateCode", stateCode);

        return "/mypage/mypage_07";
    }

    // 프로필 수정 기능 구현 : POST방식 (회원정보 수정시 비동기 처리로 수정해주는 역할)
    @ResponseBody
    @RequestMapping(value = "/mypage/mypage_07", method=RequestMethod.POST)
    public void profileModifyPOST(@RequestBody MemberVO memberVO) throws Exception {
        memberService.profileModifyPOST(memberVO);
    }

    //  탈퇴 화면 구현 : GET방식(회원정보 수정 페이지 진입시 해당 회원 정보를 새로운 세션과 연결하여 보여주는 역할)
    @RequestMapping(value="/mypage/mypage_08", method=RequestMethod.GET)
    public String memberDeleteGET(HttpServletRequest req, Model model, @RequestParam("stateCode") int stateCode,
                                  HttpSession httpSession, MemberVO memberVO) throws Exception {

        HttpSession session = req.getSession();

        MemberVO member = (MemberVO) session.getAttribute("member"); // 로그인시 있던 세션
        MemberVO modifyMember = memberService.membermodifyGET(member.getMb_id());
        //MemberVO modifyMember = memberService.memberDeleteGET(member.getMb_id());
        //MemberVO modifyMember = boardService.membermodifyGET(member.getMb_id());

        //추가
        model.addAttribute("modifyId", modifyMember.getMb_id());
        model.addAttribute("stateCode", stateCode);

        //로그인 시 사용자 아이디가 보이도록 함.
        String id = req.getParameter("id");
        httpSession.setAttribute("id", memberVO.getMb_id()); // 세션에 값을 셋팅하는 방법
        String sessionId = (String) httpSession.getAttribute("id");// 세션에서 값을 가져오는 방법

        return "/mypage/mypage_08";
    }

    @ResponseBody
    @RequestMapping(value="/mypage/mypage_08", method=RequestMethod.POST)
    public String memberDelete(@RequestBody MemberVO memberVO, Model model, HttpServletRequest req) throws Exception {

        String inputPass = memberVO.getMb_pw(); // 입력한 비밀번호
        MemberVO member = memberService.userCheck(memberVO); // 암호화된 DB 비밀번호
        String result = "";

        if(memberVO.getMb_id() != null && memberVO.getMb_id() != "") {
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

            if(encoder.matches(inputPass, member.getMb_pw())) {
                memberService.memberDelete(memberVO);
                HttpSession session = req.getSession(); //탈퇴 시 세션 삭제(추후 확인 필)
                session.invalidate();
                result = "success";
            }
        }
        return result;
    }

    /** logout **/
    @RequestMapping(value="/logout", method=RequestMethod.GET)
    public String logout(HttpServletRequest req) throws Exception {
        HttpSession session = req.getSession();
        session.invalidate();
        return "/main/main";
    }

}
