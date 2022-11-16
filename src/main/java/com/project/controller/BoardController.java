package com.project.controller;

import com.project.service.BoardService;
import com.project.service.MemberService;
import com.project.vo.*;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@AllArgsConstructor
@RequiredArgsConstructor
public class BoardController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	BoardService boardService;

	@Autowired
	MemberService memberService;

	/*	*//** board CRUD - 커뮤니티 **///*
	// 게시판 리스트 및 메인페이지 + kakao user/session
	@RequestMapping(value="/community/community")
	public String boardList(@RequestParam("stateCode") int stateCode,@RequestParam("category")
	Integer category,@RequestParam("sort") String sort,Criteria cri, Model model, MemberVO memberVO) throws Exception {

		// 페이징 객체
		Paging paging = new Paging();

		if(category==10){
			// 전체 글 개수 - 모든 페이지 포함
			int boardListCnt = boardService.boardListCnt();
			cri.setSort(sort); // 정렬을 위한 추가코드
			paging.setCri(cri);
			paging.setTotalCount(boardListCnt);
			List<Map<String, Object>> list = boardService.boardList(cri);
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("cri",cri); // 정렬을 위한 추가코드
		}
		else{
			//전체 글 개수 - 카테고리가 있는 경우
			int boardListCntDetail = boardService.boardListCntDetail(category);
			cri.setSort(sort); // 정렬을 위한 추가코드
			paging.setCri(cri);
			paging.setTotalCount(boardListCntDetail);
			List<Map<String, Object>> list = boardService.boardListDetail(cri,category);
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("cri",cri); // 정렬을 위한 추가코드
		}
		model.addAttribute("stateCode", stateCode);
		model.addAttribute("category",category);
		//model.addAttribute("num",num);

		return "/community/community";
	}

	//커뮤니티 리스트 - 로그인 안했을 때
	@RequestMapping(value="/com")
	public String comList(@RequestParam("category") Integer category,@RequestParam("sort") String sort,Criteria cri, Model model, MemberVO memberVO) throws Exception{
		// 페이징 객체
		Paging paging = new Paging();
		if(category==10){
			// 전체 글 개수 - 모든 페이지 포함
			int boardListCnt = boardService.boardListCnt();
			cri.setSort(sort);
			paging.setCri(cri);
			paging.setTotalCount(boardListCnt);
			List<Map<String, Object>> list = boardService.boardList(cri);
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("cri",cri); // 정렬을 위한 추가코드
		}
		else{
			//전체 글 개수 - 카테고리가 있는 경우
			int boardListCntDetail = boardService.boardListCntDetail(category);
			cri.setSort(sort);
			paging.setCri(cri);
			paging.setTotalCount(boardListCntDetail);
			List<Map<String, Object>> list = boardService.boardListDetail(cri,category);
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("cri",cri); // 정렬을 위한 추가코드
		}
		model.addAttribute("category",category);
		return "/community/community";
	}

	// 게시판 글쓰기 폼(커뮤니티)
	@RequestMapping(value="/community/community_write")
	public String boardWriteForm(HttpServletRequest req, Model model) throws Exception {

		HttpSession session = req.getSession();

		if(session.getAttribute("member") != null) {
			MemberVO member = (MemberVO) session.getAttribute("member"); // 로그인시 있던 세션
			MemberVO modifyMember = boardService.membermodifyGET(member.getMb_id());
			model.addAttribute("modifyId", modifyMember.getMb_id());
			model.addAttribute("modifyNick",modifyMember.getMb_nick());
			model.addAttribute("stateCode", 1);
			model.addAttribute("category",10);

		} else if(session.getAttribute("userId") != null) {
			model.addAttribute("modifyId", session.getAttribute("userId"));
			model.addAttribute("stateCode", 2);
		}
		return "/community/community_write";
	}

	// 게시판 글쓰기(커뮤니티)
	@RequestMapping(value="/communityWrite")
	public String boardWrite(@RequestParam("stateCode") int stateCode, BoardVO boardVO,HttpServletRequest req, MultipartFile file) throws Exception {

		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member"); // 로그인시 있던 세션
		MemberVO modifyMember = boardService.membermodifyGET(member.getMb_id());

		int seq = modifyMember.getMb_seq();
		int doctor = modifyMember.getMb_doctor();
		boardVO.setMb_seq(seq);
		boardVO.setMb_doctor(doctor);

		if(!file.isEmpty()){
			boardService.updateImg(boardVO,file);
		}
		boardService.boardWrite(boardVO);
		int category = boardVO.getCom_category();
		return "redirect:/community/community?stateCode="+stateCode+"&category="+category;
	}

	// 게시글 내용 읽기(커뮤니티)
	@RequestMapping(value="/community/community_view")
	public String boardRead(@RequestParam("com_num") int com_num,
							@RequestParam("stateCode") int stateCode,
							@RequestParam("category") Integer category,
							Model model,
							HttpServletRequest req) throws Exception {

		HttpSession session = req.getSession();
		boardService.increaseComhit(com_num,session);
		boardService.updatecomlike(com_num); //여기서 수정이 될까...
		BoardVO data = boardService.boardRead(com_num);
		model.addAttribute("data", data);
		model.addAttribute("stateCode", stateCode);
		model.addAttribute("category",category);

		if(session.getAttribute("member") != null) {
			MemberVO vo = (MemberVO) session.getAttribute("member");
			MemberVO membervo = boardService.membermodifyGET(vo.getMb_id());
			model.addAttribute("membervo",membervo);

			LikeVO like = new LikeVO();
			like.setCom_num(com_num);
			like.setMb_nick(membervo.getMb_nick());

			int like_check = 0;

			int check=boardService.likecount(like);
			if(check ==0){
				boardService.likeinsert(like);
			} else if (check==1) {
				like_check=boardService.likegetinfo(like);
			}
			model.addAttribute("like_check",like_check);
			//boardService.updatecomlike(com_num);
		}

		return "/community/community_view";
	}

	// 게시글 내용 읽기(커뮤니티) - 로그인 안했을 때
	@RequestMapping(value="/com/com_view")
	public String boardRead(@RequestParam("com_num") int com_num,
							@RequestParam("category") Integer category,
							Model model,
							HttpServletRequest req) throws Exception {

		HttpSession session = req.getSession();
		boardService.increaseComhit(com_num,session);
		boardService.updatecomlike(com_num); //여기서 수정이 될까...
		BoardVO data = boardService.boardRead(com_num);
		model.addAttribute("data", data);
		model.addAttribute("category",category);

		if(session.getAttribute("member") != null) {
			MemberVO vo = (MemberVO) session.getAttribute("member");
			MemberVO membervo = boardService.membermodifyGET(vo.getMb_id());
			model.addAttribute("membervo",membervo);

			LikeVO like = new LikeVO();
			like.setCom_num(com_num);
			like.setMb_nick(membervo.getMb_nick());

			int like_check = 0;

			int check=boardService.likecount(like);
			if(check ==0){
				boardService.likeinsert(like);
			} else if (check==1) {
				like_check=boardService.likegetinfo(like);
			}
			model.addAttribute("like_check",like_check);
			//boardService.updatecomlike(com_num);
		}

		return "/community/community_view";
	}

	//좋아요 기능을 위한 코드 - 커뮤니티
	@ResponseBody
	@RequestMapping (value = "/like/likeupdate",method = RequestMethod.POST)
	public Map<String,String> likeupdate(@RequestBody LikeVO like){
		logger.info("likeupdate");

		Map<String,String> map = new HashMap<String,String>();

		try {
			int com_num = like.getCom_num();
			boardService.likeupdate(like);
			boardService.updatecomlike(com_num); //좋아요 변화에 따라서 바로 커뮤니티 테이블에서 com_like 값 변경
			map.put("result", "success");

		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}

		return map;
	}


	// 게시글 수정폼(커뮤니티)
	@RequestMapping(value="/community/community_modify")
	public String boardModifyForm(@RequestParam("com_num") int num,
								  @RequestParam("stateCode") int stateCode,
								  @RequestParam("writer") String writer,
								  @RequestParam("category") Integer category,
								  Model model) throws Exception {

		BoardVO data = boardService.boardRead(num);
		model.addAttribute("data", data);
		model.addAttribute("stateCode", stateCode);
		model.addAttribute("category",category);
		return "/community/community_modify";
	}


	// 게시글 수정(커뮤니티)
	@RequestMapping(value="/communityModify", method= RequestMethod.POST)
	public String boardModify(@RequestParam("stateCode") int stateCode, @RequestParam("category") Integer category,BoardVO boardVO, HttpServletRequest req,MultipartFile file) throws Exception {

		HttpSession session = req.getSession();

		if(session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			boardVO.setMb_nick(userId);
		} else if(session.getAttribute("member") != null) {
			MemberVO vo = (MemberVO) session.getAttribute("member");
			//boardVO.setMb_nick(vo.getMb_nick());
		}

		if(!file.isEmpty()){
			boardService.updateImg(boardVO,file);
		}

		boardService.boardModify(boardVO);

		return "redirect:/community/community?stateCode="+stateCode+"&category="+category;
	}


	// 게시글 삭제(커뮤니티)
	@RequestMapping(value="/boardDelete")
	public ModelAndView boardDelete(@RequestParam("stateCode") int stateCode, @RequestParam("com_num") int com_num,
									@RequestParam("writer") String writer,@RequestParam("category") Integer category, HttpServletRequest req) throws Exception {

		HttpSession session = req.getSession();
		ModelAndView mav = new ModelAndView();

		if(session.getAttribute("member") != null) {
			logger.info("***session이 유지되는 경우");
			MemberVO member = (MemberVO)session.getAttribute("member");
			MemberVO membervo = boardService.membermodifyGET(member.getMb_id());
			String memeberNick = membervo.getMb_nick();

			if(writer.equals(memeberNick)) {
				boardService.boardDelete(com_num);
				mav.addObject("msg", "success");
			} else {
				mav.addObject("msg", "fail");
			}
			mav.setViewName("forward:/community/community?stateCode="+stateCode);
		} else {
			logger.info("***session이 끝난 경우");
			mav.addObject("msg", "sessionFin");
			mav.setViewName("index");
		}
		return mav;
	}

	//댓글 리스트 - 커뮤니티
	@RequestMapping(value = "/comment/list",method= RequestMethod.GET)//댓글리스트
	@ResponseBody
	private Map<String,Object> mCommentServiceList(int com_num) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		List<CommentVO> list= boardService.commentList(com_num);
		map.put("list",list);
		return map;
	}

	//댓글 작성 - 커뮤니티
	@RequestMapping(value = "/comment/insert",method= RequestMethod.GET)//댓글작성
	@ResponseBody
	private int mCommentServiceInsert(@RequestParam("bno") int com_num,@RequestParam("content") String comment_content,
									  @RequestParam("writer") String mb_nick,@RequestParam("doctor") int mb_doctor,
									  @RequestParam("seq") int mb_seq) throws Exception {
		CommentVO comment=new CommentVO();
		comment.setCom_num(com_num);
		comment.setComment_content(comment_content);
		comment.setMb_nick(mb_nick);
		comment.setMb_doctor(mb_doctor);
		comment.setMb_seq(mb_seq);
		comment.setComment_depth(0); //그냥 댓글인 경우에는 0으로 지정
		boardService.commentInsert(comment); //기본적으로 추가함.
		int comment_seq=boardService.last(); //제일 마지막 comment_seq가져와서
		boardService.updateGroup(comment_seq); //comment_group값에 넣기 ( 모댓글인 경우)
		return boardService.updateReplyCount(com_num);
	}

	//댓글 수정 - 커뮤니티
	@RequestMapping(value = "/comment/update",method= RequestMethod.GET)//댓글수정
	@ResponseBody
	private int mCommentServiceUpdateProc(@RequestParam("comment_seq") int comment_seq, @RequestParam("comment_content") String comment_content)throws Exception{
		CommentVO comment=new CommentVO();
		comment.setComment_seq(comment_seq);
		comment.setComment_content(comment_content);
		return boardService.commentUpdate(comment);
	}

	//댓글 삭제 - 커뮤니티
	@RequestMapping(value = "/comment/delete/{comment_seq}",method= RequestMethod.GET)//댓글삭제
	@ResponseBody
	private int mCommentServiceDelete(@PathVariable int comment_seq,@RequestParam("com_num") int com_num) throws Exception{
		boardService.commentDelete(comment_seq);
		return boardService.updateReplyCount(com_num);
	}

	//대댓글 작성 - 커뮤니티
	@RequestMapping(value = "/recomment/insert",method= RequestMethod.GET)//댓글작성
	@ResponseBody
	private int reCommentServiceInsert(@RequestParam("bno") int com_num,@RequestParam("comment_content") String comment_content,
									   @RequestParam("writer") String mb_nick,@RequestParam("doctor") int mb_doctor,
									   @RequestParam("seq") int mb_seq,@RequestParam("comment_seq") int comment_seq) throws Exception {
		CommentVO comment=new CommentVO();
		comment.setCom_num(com_num);
		comment.setComment_content(comment_content);
		comment.setMb_nick(mb_nick);
		comment.setMb_doctor(mb_doctor);
		comment.setMb_seq(mb_seq);
		comment.setComment_group(comment_seq); //대댓글의 경우 어떤 댓글에 다는지를 확인하기 위해서 모댓글의 comment_seq를 저장한다...
		comment.setComment_depth(1); //대댓글 경우 comment_depth를 1로 지정
		boardService.commentInsert(comment);
		return boardService.updateReplyCount(com_num);
	}


	/** 상담 게시판(talk) **/

	// 상담 게시판 리스트
	@RequestMapping(value="/advice/advice")
	public String talkList(@RequestParam("stateCode") int stateCode,@RequestParam("category") Integer category,Criteria cri, Model model, MemberVO memberVO) throws Exception {

		// 페이징 객체
		Paging paging = new Paging();

		int talkListCnt = boardService.talkListCnt(category);
		paging.setCri(cri);
		paging.setTotalCount(talkListCnt);
		List<Map<String, Object>> list = boardService.talkList(cri, category);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("stateCode", stateCode);
		model.addAttribute("category", category);
		//model.addAttribute("num",num);

		return "/advice/advice";
	}

	// 상담 게시판 글쓰기
	@RequestMapping(value="/advice/advice_write")
	public String talkWriteForm(HttpServletRequest req, Model model) throws Exception {

		HttpSession session = req.getSession();

		if(session.getAttribute("member") != null) {
			MemberVO member = (MemberVO) session.getAttribute("member"); // 로그인시 있던 세션
			MemberVO modifyMember = boardService.membermodifyGET(member.getMb_id());
			model.addAttribute("modifyId", modifyMember.getMb_id());
			model.addAttribute("modifyNick",modifyMember.getMb_nick());
			model.addAttribute("stateCode", 1);
			model.addAttribute("category",0);
			//model.addAttribute("category",10);

		} else if(session.getAttribute("userId") != null) {
			model.addAttribute("modifyId", session.getAttribute("userId"));
			model.addAttribute("stateCode", 2);
		}
		return "/advice/advice_write";
	}

	// 상담 글쓰기
	@RequestMapping(value="/talkWrite")
	public String talkWrite(@RequestParam("stateCode") int stateCode, TalkVO talkVO,HttpServletRequest req, MultipartFile file) throws Exception {

		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member"); // 로그인시 있던 세션
		MemberVO modifyMember = boardService.membermodifyGET(member.getMb_id());

		int seq = modifyMember.getMb_seq();
		int doctor = modifyMember.getMb_doctor();
		talkVO.setMb_seq(seq);
		talkVO.setMb_doctor(doctor);

		if(!file.isEmpty()){
			boardService.updateTalkImg(talkVO,file);
		}
		boardService.talkWrite(talkVO);
		int category = talkVO.getTalk_category();
		return "redirect:/advice/advice?stateCode="+stateCode+"&category="+category;
	}

	// 상담 글 읽기
	@RequestMapping(value="/advice/advice_view")
	public String talkRead(@RequestParam("talk_num") int talk_num,
						   @RequestParam("stateCode") int stateCode,
						   @RequestParam("category") Integer category,
						   Model model,
						   HttpServletRequest req) throws Exception {

		HttpSession session = req.getSession();
		//boardService.increaseComhit(com_num,session);
		//boardService.updatecomlike(com_num); //여기서 수정이 될까...
		TalkVO data = boardService.talkRead(talk_num);
		model.addAttribute("data", data);
		model.addAttribute("stateCode", stateCode);
		model.addAttribute("category",category);

		if(session.getAttribute("member") != null) {
			MemberVO vo = (MemberVO) session.getAttribute("member");
			MemberVO membervo = boardService.membermodifyGET(vo.getMb_id());
			model.addAttribute("membervo",membervo);

			//LikeVO like = new LikeVO();
			//like.setCom_num(com_num);
			//like.setMb_nick(membervo.getMb_nick());

			//int like_check = 0;

			//int check=boardService.likecount(like);
			//if(check ==0){
			//boardService.likeinsert(like);
			//} else if (check==1) {
			//like_check=boardService.likegetinfo(like);
			//}
			//model.addAttribute("like_check",like_check);
			//boardService.updatecomlike(com_num);
		}
		return "/advice/advice_view";
	}

	//댓글 리스트 - 상담
	@RequestMapping(value = "/talkcomment/list",method= RequestMethod.GET)//댓글리스트
	@ResponseBody
	private Map<String,Object> tCommentServiceList(int talk_num) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		List<CommentVO> list= boardService.talkcommentList(talk_num);
		map.put("list",list);
		return map;
	}

	//댓글 작성 - 상담
	@RequestMapping(value = "/talkcomment/insert",method= RequestMethod.GET)//댓글작성
	@ResponseBody
	private int tCommentServiceInsert(@RequestParam("bno") int talk_num,@RequestParam("content") String comment_content,
									  @RequestParam("writer") String mb_nick,@RequestParam("doctor") int mb_doctor,
									  @RequestParam("seq") int mb_seq) throws Exception {
		CommentVO comment=new CommentVO();
		comment.setTalk_num(talk_num);
		comment.setComment_content(comment_content);
		comment.setMb_nick(mb_nick);
		comment.setMb_doctor(mb_doctor);
		comment.setMb_seq(mb_seq);
		comment.setComment_depth(0); //그냥 댓글인 경우에는 0으로 지정
		boardService.talkcommentInsert(comment); //기본적으로 추가함.
		int comment_seq=boardService.last2(); //제일 마지막 comment_seq가져와서
		boardService.talkupdateGroup(comment_seq); //comment_group값에 넣기 ( 모댓글인 경우)
		return boardService.talkupdateReplyCount(talk_num);
	}

	//댓글 수정 - 상담
	@RequestMapping(value = "/talkcomment/update",method= RequestMethod.GET)//댓글수정
	@ResponseBody
	private int tCommentServiceUpdateProc(@RequestParam("comment_seq") int comment_seq, @RequestParam("comment_content") String comment_content)throws Exception{
		CommentVO comment=new CommentVO();
		comment.setComment_seq(comment_seq);
		comment.setComment_content(comment_content);
		return boardService.talkcommentUpdate(comment);
	}

	//댓글 삭제 - 상담
	@RequestMapping(value = "/talkcomment/delete/{comment_seq}",method= RequestMethod.GET)//댓글삭제
	@ResponseBody
	private int tCommentServiceDelete(@PathVariable int comment_seq,@RequestParam("talk_num") int talk_num) throws Exception{
		boardService.talkcommentDelete(comment_seq);
		return boardService.talkupdateReplyCount(talk_num);
	}

	//대댓글 작성 - 상담
	@RequestMapping(value = "/talkrecomment/insert",method= RequestMethod.GET)//댓글작성
	@ResponseBody
	private int retCommentServiceInsert(@RequestParam("bno") int talk_num,@RequestParam("comment_content") String comment_content,
									   @RequestParam("writer") String mb_nick,@RequestParam("doctor") int mb_doctor,
									   @RequestParam("seq") int mb_seq,@RequestParam("comment_seq") int comment_seq) throws Exception {
		CommentVO comment=new CommentVO();
		comment.setTalk_num(talk_num);
		comment.setComment_content(comment_content);
		comment.setMb_nick(mb_nick);
		comment.setMb_doctor(mb_doctor);
		comment.setMb_seq(mb_seq);
		comment.setComment_group(comment_seq); //대댓글의 경우 어떤 댓글에 다는지를 확인하기 위해서 모댓글의 comment_seq를 저장한다...
		comment.setComment_depth(1); //대댓글 경우 comment_depth를 1로 지정
		boardService.talkcommentInsert(comment);
		return boardService.talkupdateReplyCount(talk_num);
	}

	//상담 게시글 수정 폼
	@RequestMapping(value = "/advice/advice_modify")
	public String talkModifyForm(@RequestParam("talk_num") int num,
								 @RequestParam("stateCode") int stateCode,
								 @RequestParam("writer") String writer,
								 @RequestParam("category") Integer category,
								 Model model) throws Exception{
		TalkVO data = boardService.talkRead(num);
		model.addAttribute("data",data);
		model.addAttribute("stateCode",stateCode);
		model.addAttribute("category",category);
		return "/advice/advice_modify";
	}

	// 상담 글 수정
	@RequestMapping(value="/talkModify", method= RequestMethod.POST)
	public String talkModify(@RequestParam("stateCode") int stateCode, @RequestParam("category") Integer category,TalkVO talkVO, HttpServletRequest req,MultipartFile file) throws Exception {

		HttpSession session = req.getSession();

		if(session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			talkVO.setMb_nick(userId);
		} else if(session.getAttribute("member") != null) {
			MemberVO vo = (MemberVO) session.getAttribute("member");
			//boardVO.setMb_nick(vo.getMb_nick());
		}

		if(!file.isEmpty()){
			boardService.updateTalkImg(talkVO,file);
		}

		boardService.talkModify(talkVO);

		return "redirect:/advice/advice?stateCode="+stateCode+"&category="+category;
	}

	// 게시글 삭제(상담)
	@RequestMapping(value="/talkDelete")
	public ModelAndView talkDelete(@RequestParam("stateCode") int stateCode, @RequestParam("talk_num") int talk_num,
								   @RequestParam("writer") String writer,@RequestParam("category") Integer category, HttpServletRequest req) throws Exception {

		HttpSession session = req.getSession();
		ModelAndView mav = new ModelAndView();

		if (session.getAttribute("member") != null) {
			logger.info("***session이 유지되는 경우");
			MemberVO member = (MemberVO) session.getAttribute("member");
			MemberVO membervo = boardService.membermodifyGET(member.getMb_id());
			String memeberNick = membervo.getMb_nick();

			if (writer.equals(memeberNick)) {
				boardService.talkDelete(talk_num);
				mav.addObject("msg", "success");
			} else {
				mav.addObject("msg", "fail");
			}
			mav.setViewName("forward:/advice/advice?stateCode="+stateCode);
		} else {
			logger.info("***session이 끝난 경우");
			mav.addObject("msg", "sessionFin");
			mav.setViewName("index");
		}
		return mav;
	}

	/** 신고 게시판(report) **/

	//신고 게시판 리스트
	@RequestMapping(value = "/report/report")
	public String reList(@RequestParam("stateCode") int stateCode, @RequestParam("category") Integer category, Criteria cri,Model model, ReportVO reportVO) throws Exception{
		Paging paging = new Paging();
		int reportListCnt = boardService.reportListCnt(category);
		paging.setCri(cri);
		paging.setTotalCount(reportListCnt);
		List<Map<String, Object>> list = boardService.reportList(cri, category);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("stateCode", stateCode);
		model.addAttribute("category", category);
		return "/report/report";
	}

	//신고 게시판 글쓰기 폼
	@RequestMapping(value = "/report/report_write")
	public String reportWriteForm(HttpServletRequest req, Model model) throws Exception{
		HttpSession session = req.getSession();

		if(session.getAttribute("member") != null) {
			MemberVO member = (MemberVO) session.getAttribute("member"); // 로그인시 있던 세션
			MemberVO modifyMember = boardService.membermodifyGET(member.getMb_id());
			model.addAttribute("modifyId", modifyMember.getMb_id());
			model.addAttribute("modifySeq",modifyMember.getMb_seq());
			model.addAttribute("modifyNick",modifyMember.getMb_nick());
			model.addAttribute("stateCode", 1);
			model.addAttribute("category",0);
			//model.addAttribute("category",10);

		} else if(session.getAttribute("userId") != null) {
			model.addAttribute("modifyId", session.getAttribute("userId"));
			model.addAttribute("stateCode", 2);
		}
		return "/report/report_write";
	}

	// 신고 글쓰기
	@RequestMapping(value = "/reportWrite")
	public String reportWrite(@RequestParam("stateCode") int stateCode, ReportVO reportVO,HttpServletRequest req, MultipartFile file) throws Exception{
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member"); // 로그인시 있던 세션
		MemberVO modifyMember = boardService.membermodifyGET(member.getMb_id());

		int seq = modifyMember.getMb_seq();
		//int doctor = modifyMember.getMb_doctor();
		reportVO.setMb_seq(seq);
		//talkVO.setMb_doctor(doctor);

		//if(!file.isEmpty()){
			//boardService.updateTalkImg(talkVO,file);
		//}
		boardService.reportWrite(reportVO);
		int category = reportVO.getReport_category();
		return "redirect:/report/report?stateCode="+stateCode+"&category="+category;
	}

	// 신고 글 읽기
	@RequestMapping(value="/report/report_view")
	public String reportRead(@RequestParam("re_num") int re_num,
						   @RequestParam("stateCode") int stateCode,
						   @RequestParam("category") Integer category,
						   Model model,
						   HttpServletRequest req) throws Exception {

		HttpSession session = req.getSession();
		//boardService.increaseComhit(com_num,session);
		//boardService.updatecomlike(com_num); //여기서 수정이 될까...
		ReportVO data = boardService.reportRead(re_num);
		model.addAttribute("data", data);
		model.addAttribute("stateCode", stateCode);
		model.addAttribute("category",category);

		if(session.getAttribute("member") != null) {
			MemberVO vo = (MemberVO) session.getAttribute("member");
			MemberVO membervo = boardService.membermodifyGET(vo.getMb_id());
			model.addAttribute("membervo",membervo);

			//LikeVO like = new LikeVO();
			//like.setCom_num(com_num);
			//like.setMb_nick(membervo.getMb_nick());

			//int like_check = 0;

			//int check=boardService.likecount(like);
			//if(check ==0){
			//boardService.likeinsert(like);
			//} else if (check==1) {
			//like_check=boardService.likegetinfo(like);
			//}
			//model.addAttribute("like_check",like_check);
			//boardService.updatecomlike(com_num);

			//신고페이지에는 조회수, 좋아요, 사진 필요 없을 듯?(추후 회의 후 삭제)
		}
		return "/report/report_view";
	}

	// 신고 글 수정 폼
	@RequestMapping(value = "/report/report_modify")
	public String reportModifyForm(@RequestParam("re_num") int num,
								 @RequestParam("stateCode") int stateCode,
								 @RequestParam("writer") String writer,
								 @RequestParam("category") Integer category,
								 Model model) throws Exception{
		ReportVO data = boardService.reportRead(num);
		model.addAttribute("data",data);
		model.addAttribute("stateCode",stateCode);
		model.addAttribute("category",category);
		return "/report/report_modify";
	}

	//신고 글 수정
	// 상담 글 수정
	@RequestMapping(value="/reportModify", method= RequestMethod.POST)
	public String reportModify(@RequestParam("stateCode") int stateCode, @RequestParam("category") Integer category,ReportVO reportVO, HttpServletRequest req,MultipartFile file) throws Exception {

		HttpSession session = req.getSession();

		if(session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			//talkVO.setMb_nick(userId);
		} else if(session.getAttribute("member") != null) {
			MemberVO vo = (MemberVO) session.getAttribute("member");
			//boardVO.setMb_nick(vo.getMb_nick());
		}

		//if(!file.isEmpty()){
			//boardService.updateTalkImg(talkVO,file);
		//}

		boardService.reportModify(reportVO);

		return "redirect:/report/report?stateCode="+stateCode+"&category="+category;
	}
	// 신고 글 삭제


	/** 메인 페이지 커뮤니티 리스트 **/
	//커뮤니티 전체 리스트 끌어오기 실패(컨트롤러,매퍼,서비스 없어서 그런 듯 , 리스트 생성시 상위 지도 없어지는 문제 발생)


	/** 에디터 페이지 CRUD () **/

	//에디터 리스트
	@RequestMapping(value = "/editor/editor")
	public String editorList(@RequestParam("stateCode") int stateCode, Criteria cri, @RequestParam("category") Integer category, Model model, EditorVO editorVO) throws Exception{
		Paging paging = new Paging();
		int editorListCnt = boardService.editorListCnt(category);
		paging.setCri(cri);
		paging.setTotalCount(editorListCnt);
		List<Map<String, Object>> list = boardService.editorList(cri, category);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("stateCode", stateCode);
		model.addAttribute("category", category);
		return "/editor/editor";
	}

	// 에디터 게시판 글쓰기 폼
	@RequestMapping(value = "/editor/editor_write")
	public String editorWriteForm(HttpServletRequest req, Model model) throws Exception{
		HttpSession session = req.getSession();

		if(session.getAttribute("member") != null) {
			MemberVO member = (MemberVO) session.getAttribute("member"); // 로그인 시 있던 세션
			MemberVO modifyMember = boardService.membermodifyGET(member.getMb_id());
			model.addAttribute("modifyId", modifyMember.getMb_id());
			model.addAttribute("modifySeq",modifyMember.getMb_seq());
			model.addAttribute("modifyNick",modifyMember.getMb_nick());
			model.addAttribute("stateCode", 1);
			model.addAttribute("category",0);
			//model.addAttribute("category",10);

		} else if(session.getAttribute("userId") != null) {
			model.addAttribute("modifyId", session.getAttribute("userId"));
			model.addAttribute("stateCode", 2);
		}
		return "/editor/editor_write";
	}

	// 에디터 글쓰기
	@RequestMapping(value = "/editorWrite")
	public String editorWrite(@RequestParam("stateCode") int stateCode, EditorVO editorVO, HttpServletRequest req, MultipartFile file) throws Exception{
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member"); // 로그인시 있던 세션
		MemberVO modifyMember = boardService.membermodifyGET(member.getMb_id());

		int seq = modifyMember.getMb_seq();
		//int doctor = modifyMember.getMb_doctor();
		editorVO.setMb_seq(seq);
		//talkVO.setMb_doctor(doctor);

		//if(!file.isEmpty()){
		//boardService.updateTalkImg(talkVO,file);
		//}
		boardService.editorWrite(editorVO);
		int category = editorVO.getEdit_category();
		return "redirect:/editor/editor?stateCode="+stateCode+"&category="+category;
	}

	// 에디터 글 읽기
	@RequestMapping(value="/editor/editor_view")
	public String editorRead(@RequestParam("edit_num") int edit_num, @RequestParam("stateCode") int stateCode, @RequestParam("category") Integer category
								, Model model, HttpServletRequest req) throws Exception {

		HttpSession session = req.getSession();
		boardService.editorupdatelike(edit_num);
		EditorVO data = boardService.editorRead(edit_num);
		model.addAttribute("data", data);
		model.addAttribute("stateCode", stateCode);
		model.addAttribute("category",category);

		if(session.getAttribute("member") != null) {
			MemberVO vo = (MemberVO) session.getAttribute("member");
			MemberVO membervo = boardService.membermodifyGET(vo.getMb_id());
			model.addAttribute("membervo",membervo);
			LikeVO like = new LikeVO();
			like.setEdit_num(edit_num);
			like.setMb_nick(membervo.getMb_nick());

			int like_check = 0;

			int check=boardService.editorlikecount(like);
			if(check ==0){
				boardService.editorlikeinsert(like);
			} else if (check==1) {
				like_check=boardService.editorlikegetinfo(like);
			}
			model.addAttribute("like_check",like_check);
		}
		return "/editor/editor_view";
	}

	//댓글 리스트 - 에디터
	@RequestMapping(value = "/editorcomment/list", method= RequestMethod.GET)//댓글리스트
	@ResponseBody
	private Map<String,Object> eCommentServiceList(int edit_num) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		List<CommentVO> list= boardService.editorcommentList(edit_num);
		map.put("list",list);
		return map;
	}

	//댓글 작성 - 에디터
	@RequestMapping(value = "/editorcomment/insert", method= RequestMethod.GET)//댓글작성
	@ResponseBody
	private int eCommentServiceInsert(@RequestParam("bno") int edit_num,@RequestParam("content") String comment_content,
									  @RequestParam("writer") String mb_nick,@RequestParam("doctor") int mb_doctor,
									  @RequestParam("seq") int mb_seq) throws Exception {
		CommentVO comment = new CommentVO();
		comment.setEdit_num(edit_num);
		comment.setComment_content(comment_content);
		comment.setMb_nick(mb_nick);
		comment.setMb_doctor(mb_doctor);
		comment.setMb_seq(mb_seq);
		comment.setComment_depth(0); //그냥 댓글인 경우에는 0으로 지정
		boardService.editorcommentInsert(comment); //기본적으로 추가함.
		int comment_seq=boardService.last3(); //제일 마지막 comment_seq가져와서
		boardService.editorupdateGroup(comment_seq); //comment_group값에 넣기 ( 모댓글인 경우)
		return boardService.editorupdateReplyCount(edit_num);
	}

	//댓글 수정 - 에디터
	@RequestMapping(value = "/editorcomment/update", method= RequestMethod.GET)//댓글수정
	@ResponseBody
	private int eCommentServiceUpdateProc(@RequestParam("comment_seq") int comment_seq, @RequestParam("comment_content") String comment_content)throws Exception{
		CommentVO comment = new CommentVO();
		comment.setComment_seq(comment_seq);
		comment.setComment_content(comment_content);
		return boardService.editorcommentUpdate(comment);
	}

	//댓글 삭제 - 에디터
	@RequestMapping(value = "/editorcomment/delete/{comment_seq}",method= RequestMethod.GET)//댓글삭제
	@ResponseBody
	private int eCommentServiceDelete(@PathVariable int comment_seq,@RequestParam("edit_num") int edit_num) throws Exception{
		boardService.editorcommentDelete(comment_seq);
		return boardService.editorupdateReplyCount(edit_num);
	}

	//대댓글 작성 - 에디터
	@RequestMapping(value = "/editorrecomment/insert",method= RequestMethod.GET)//댓글작성
	@ResponseBody
	private int reeCommentServiceInsert(@RequestParam("bno") int edit_num,@RequestParam("comment_content") String comment_content,
										@RequestParam("writer") String mb_nick,@RequestParam("doctor") int mb_doctor,
										@RequestParam("seq") int mb_seq,@RequestParam("comment_seq") int comment_seq) throws Exception {
		CommentVO comment=new CommentVO();
		comment.setEdit_num(edit_num);
		comment.setComment_content(comment_content);
		comment.setMb_nick(mb_nick);
		comment.setMb_doctor(mb_doctor);
		comment.setMb_seq(mb_seq);
		comment.setComment_group(comment_seq); //대댓글의 경우 어떤 댓글에 다는지를 확인하기 위해서 모댓글의 comment_seq를 저장한다...
		comment.setComment_depth(1); //대댓글 경우 comment_depth를 1로 지정
		boardService.editorcommentInsert(comment);
		return boardService.editorupdateReplyCount(edit_num);
	}

	//좋아요 기능을 위한 코드 - 에디터
	@ResponseBody
	@RequestMapping (value = "/like/editorlikeupdate", method = RequestMethod.POST)
	public Map<String,String> editorlikeupdate(@RequestBody LikeVO like){
		logger.info("editorlikeupdate");

		Map<String,String> map = new HashMap<String,String>();

		try {
			int edit_num = like.getEdit_num();
			boardService.editorlikeupdate(like);
			boardService.editorupdatelike(edit_num); //좋아요 변화에 따라서 바로 커뮤니티 테이블에서 com_like 값 변경
			map.put("result", "success");

		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}

		return map;
	}



	/** 공지사항 페이지 CRUD () **/
	//글 작성이랑 리스트만 해도 될까 고민 중, DB 설계도 없음

	//공지사항 리스트
	@RequestMapping(value = "/notice/notice")
	public String noticeList(@RequestParam("stateCode") int stateCode, Criteria cri, @RequestParam("category") Integer category, Model model, NoticeVO noticeVO) throws Exception{
		Paging paging = new Paging();
		int noticeListCnt = boardService.noticeListCnt(category);
		paging.setCri(cri);
		paging.setTotalCount(noticeListCnt);
		List<Map<String, Object>> list = boardService.noticeList(cri, category);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("stateCode", stateCode);
		model.addAttribute("category", category);
		return "/notice/notice";
	}

	// 공지사항 게시판 글쓰기 폼
	@RequestMapping(value = "/notice/notice_write")
	public String noticeWriteForm(HttpServletRequest req, Model model) throws Exception{
		HttpSession session = req.getSession();

		if(session.getAttribute("member") != null) {
			MemberVO member = (MemberVO) session.getAttribute("member"); // 로그인 시 있던 세션
			MemberVO modifyMember = boardService.membermodifyGET(member.getMb_id());
			model.addAttribute("modifyId", modifyMember.getMb_id());
			model.addAttribute("modifySeq",modifyMember.getMb_seq());
			model.addAttribute("modifyNick",modifyMember.getMb_nick());
			model.addAttribute("stateCode", 1);
			model.addAttribute("category",0);
			//model.addAttribute("category",10);

		} else if(session.getAttribute("userId") != null) {
			model.addAttribute("modifyId", session.getAttribute("userId"));
			model.addAttribute("stateCode", 2);
		}
		return "/notice/notice_write";
	}

	// 공지사항 글쓰기
	@RequestMapping(value = "/noticeWrite")
	public String noticeWrite(@RequestParam("stateCode") int stateCode, NoticeVO noticeVO, HttpServletRequest req, MultipartFile file) throws Exception{
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member"); // 로그인시 있던 세션
		MemberVO modifyMember = boardService.membermodifyGET(member.getMb_id());

		int seq = modifyMember.getMb_seq();
		noticeVO.setMb_seq(seq);
		boardService.noticeWrite(noticeVO);
		int category = noticeVO.getNotice_category();
		return "redirect:/notice/notice?stateCode="+stateCode+"&category="+category;
	}

	// 공지사항 글 읽기
	@RequestMapping(value="/notice/notice_view")
	public String noticeRead(@RequestParam("notice_num") int notice_num, @RequestParam("stateCode") int stateCode, @RequestParam("category") Integer category
			, Model model, HttpServletRequest req) throws Exception {

		HttpSession session = req.getSession();
		//boardService.noticeupdatelike(notice_num);
		NoticeVO data = boardService.noticeRead(notice_num);
		model.addAttribute("data", data);
		model.addAttribute("stateCode", stateCode);
		model.addAttribute("category",category);

		return "/notice/notice_view";
	}



	/** ENT 참여 시 포인트 지급 **/
	//문제 발생 : 폼을 통째로 전달하기 때문에 각각의 페이지로 넘어가는 것이 불가능함. 이벤트 각각의 페이지마다 포인트 지금 페이지를 만들고 누르면 포인트 지급해야 될 듯함...

	// 버튼 클릭시 사용자 DB에 포인트 +100P 추가
	@RequestMapping(value="/pointModify", method = {RequestMethod.GET, RequestMethod.POST})
	public String pointModify(MemberVO memberVO, HttpServletRequest req, Model model) throws Exception {

		HttpSession session = req.getSession();

		MemberVO member = (MemberVO) session.getAttribute("member"); // 로그인시 있던 세션
		MemberVO modifyMember = boardService.membermodifyGET(member.getMb_id());

		int seq = modifyMember.getMb_seq();
		memberVO.setMb_seq(seq);
		boardService.pointModify(memberVO);

		return "redirect:/Entertainment/Entertainment";
		//return "redirect:/Entertainment/Enter_tetris.jsp";
	}

	@RequestMapping(value = "/Entertainment/Enter_point")
	public String EntertainmentForm(HttpServletRequest req, Model model) throws Exception{
		HttpSession session = req.getSession();

		if(session.getAttribute("member") != null) {
			MemberVO member = (MemberVO) session.getAttribute("member"); // 로그인 시 있던 세션
			MemberVO modifyMember = boardService.membermodifyGET(member.getMb_id());
			model.addAttribute("modifyId", modifyMember.getMb_id());
			model.addAttribute("modifySeq",modifyMember.getMb_seq());
			model.addAttribute("modifyNick",modifyMember.getMb_nick());
			boardService.pointModify(modifyMember);
		}
		return "/Entertainment/Enter_point";
		//return "redirect:/Entertainment/Enter_tetris.jsp";
	}

}
