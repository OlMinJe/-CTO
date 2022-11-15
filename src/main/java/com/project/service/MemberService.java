package com.project.service;

import com.project.domain.Role;
import com.project.mapper.MainMapper;
import com.project.vo.MemberVO;
import com.project.domain.Role;
import com.project.mapper.MainMapper;
import com.project.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class MemberService implements UserDetailsService {

    @Autowired
    MainMapper mapper;

    /** 회원가입 **/
    // 유저체크
    public MemberVO userCheck(MemberVO memberVO) throws Exception {
        return mapper.userCheck(memberVO);
    }

    // 아이디체크
    public int idCheck(String mb_id) throws Exception {
        return mapper.idCheck(mb_id);
    }

    //닉네임 중복 확인
    public int nickCheck(String mb_nick) throws Exception {
        return mapper.nickCheck(mb_nick);
    }

    // 회원가입
    public void memberRegister(MemberVO memberVO, MultipartFile file) throws Exception {
        //저장 경로 삭제 -> DB Table에만 저장됨
        //String imgPath=System.getProperty("user.dir")+"\\src\\main\\resources\\static\\profile";
        UUID uuid = UUID.randomUUID();
        String mb_img = uuid + "_" + file.getOriginalFilename();
        File saveimgFile = new File(mb_img);
        file.transferTo(saveimgFile);
        memberVO.setMb_img(mb_img);
        mapper.memberRegister(memberVO);
    }

    //관리자 페이지 진입(implements UserDetailsService 사용 시 필수 메소드)
    //@Override
    public UserDetails loadUserByUsername(String mb_id) throws UsernameNotFoundException {
        //로그인을 하기 위해 가입된 user 정보를 조회하는 매서드
        Optional<MemberVO> memberWrapper = null;
        try {
            memberWrapper = mapper.findByUsername(mb_id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        MemberVO member = memberWrapper.get();

        List<GrantedAuthority> authorities = new ArrayList<>();

        if(("master").equals(mb_id)) {
            authorities.add(new SimpleGrantedAuthority(Role.ADMIN.getValue()));
        } else {
            authorities.add(new SimpleGrantedAuthority(Role.MEMBER.getValue()));
        }
        return new User(member.getMb_id(), member.getMb_pw(),authorities);
    }


    /** 로그인 **/
    // 로그인
    public MemberVO memberLogin(MemberVO memberVO) throws Exception {
        return mapper.memberLogin(memberVO);
    }

    // 아이디 찾기
    public String find_id(HttpServletResponse response, String mb_email) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String id = mapper.find_id(mb_email);

        if (id == null) {
            out.println("<script>");
            out.println("alert('가입된 아이디가 없습니다.');");
            out.println("history.go(-1);");
            out.println("</script>");
            out.close();
            return null;
        } else {
            return id;
        }
    }

    //비밀번호 찾기 - 임시 비밀번호 전송폼
    @Autowired
    private JavaMailSender mailSender;

    public void send_mail(MemberVO memberVO, String div) throws Exception {

        String mail = memberVO.getMb_email();

        String setForm="";
        String toMail="";
        String title="";
        String content="";

        if(div.equals("find_pw")) {

            setForm += "juliepark4253@gmail.com";
            toMail += mail;
            title += "너나들이에서 제공하는 임시 비밀번호 입니다.";
            content +=
                    "<div align='center' style='border:1px solid black; font-family:verdana'>" +
                            "<h3 style='color: blue;'>" +
                            memberVO.getMb_id() + "님의 임시 비밀번호 입니다.<br>" +
                            "임시 비밀번호로 로그인 후에는 반드시 비밀번호를 변경하십시오.</h3>" +
                            "<p>임시 비밀번호 : " +
                            memberVO.getMb_pw() + "</p></div>";

        }

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setForm);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println("메일발송 실패 : " + e);
        }
    }

    //비밀번호 찾기 - 화면
    public void find_pw(HttpServletResponse response, MemberVO memberVO) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        // 가입된 아이디가 없으면
        if(mapper.idCheck(memberVO.getMb_id()) == 0) {
            out.print("가입된 아이디가 없습니다.");
            out.close();
        }
        // 가입된 이메일이 아니면
        else if(!memberVO.getMb_email().equals(mapper.memberModifyGET(memberVO.getMb_id()).getMb_email())) {
            out.print("가입된 이메일이 없습니다.");
            out.close();
        }else {
            // 임시 비밀번호 생성
            String pw = "";
            for (int i = 0; i < 12; i++) {
                pw += (char) ((Math.random() * 26) + 97);
            }
            memberVO.setMb_pw(pw);
            // 비밀번호 변경
            mapper.update_pw(memberVO);
            // 비밀번호 변경 메일 발송
            send_mail(memberVO, "find_pw");

            out.print("작성한 이메일로 임시 비밀번호를 발송했습니다.");

            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            String encodePass = encoder.encode(memberVO.getMb_pw());
            memberVO.setMb_pw(encodePass);
            mapper.update_pw(memberVO);
            out.close();
        }
    }

    //관리자페이지
    public List<MemberVO> dispAdmin() throws Exception {
        return mapper.dispAdmin();
    }

    public void memberOut(MemberVO memberVO) throws Exception{
        mapper.memberOut(memberVO);
    }

    //관리자 페이지 - 회원정보 리스트
    public List<MemberVO> Memberlist() throws Exception {
        return mapper.Memberlist();
    }

    //관리자 페이지 - 회원 강제 추방
    public void dropUser(String id) throws Exception {
        mapper.dropUser(id);
    }

    // 회원정보 수정 - 세션 가져오기
    public MemberVO membermodifyGET(String mb_id) throws Exception {
        return mapper.memberModifyGET(mb_id);
    }

    // 회원정보 수정
    public void memberModifyPOST(MemberVO memberVO) throws Exception {
        mapper.memberModifyPOST(memberVO);
    }

    // 회원 탈퇴
    public void memberDelete(MemberVO memberVO) throws Exception {
        mapper.memberDelete(memberVO);
    }

    public MemberVO memberDeleteGET(String mb_id) throws Exception {
        return mapper.memberDeleteGET(mb_id);
    }

    // 닉네임 변경
    public MemberVO nickModifyGET(String mb_id) throws Exception {
        return mapper.nickModifyGET(mb_id);
    }

    public void nickModifyPOST(MemberVO memberVO) throws Exception {
        mapper.nickModifyPOST(memberVO);
    }

    //프로필 사진 변경
    public MemberVO profileModifyGET(String mb_id) throws Exception {
        return mapper.profileModifyGET(mb_id);
    }

    //게임&테스트 종료 시 포인트 지급
   public void profileModifyPOST(MemberVO memberVO) throws Exception {
        mapper.profileModifyPOST(memberVO);
    }



}
