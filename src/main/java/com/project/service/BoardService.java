package com.project.service;


import com.project.mapper.MainMapper;
import com.project.vo.*;
import com.project.mapper.MainMapper;
import com.project.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class BoardService  {

	@Autowired
	MainMapper boardmapper;

	// 회원정보 수정 - 세션 가져오기
	public MemberVO membermodifyGET(String mb_id) throws Exception {
		return boardmapper.memberModifyGET(mb_id);
	}

	// 회원정보 수정
	public void memberModifyPOST(MemberVO memberVO) throws Exception {
		boardmapper.memberModifyPOST(memberVO);
	}

	// 게시판
	public void boardWrite(BoardVO boardVO) throws Exception {
		boardmapper.boardWrite(boardVO);

	}

	//게시글 작성과 수정 시 사진 첨부
	public String updateImg(BoardVO boardVO, MultipartFile file) throws Exception{
		String projectPath=System.getProperty("user.dir")+"\\src\\main\\resources\\static\\files";
		//파일 이름에 붙일 이름 랜덤 생성
		UUID uuid=UUID.randomUUID();
		//저장될 파일이름 생성
		String fileName=uuid+"_"+file.getOriginalFilename();
		File saveFile = new File(projectPath,fileName);
		file.transferTo(saveFile);
		boardVO.setCom_photo("/files/"+fileName);
		String com_photo = boardVO.getCom_photo();
		return com_photo;
	}

	//게시글 조회수 (세션을 이용해서)
	public void increaseComhit(int com_num, HttpSession session) throws Exception{
		long update_time=0;
		if(session.getAttribute("update_time_"+com_num) != null) {
			update_time = (long) session.getAttribute("update_time_" + com_num);
		}
		long current_time = System.currentTimeMillis();
		// 24시간은 24*60*60*1000 (나중에 변경 가능)
		if(current_time - update_time > 5*1000){
			boardmapper.increaseComhit(com_num);
			session.setAttribute("update_time_"+com_num,current_time);
		}
	}

	//로그인 안했을 때 게시글 보는 리스트
	public List<BoardVO> boardList2() throws Exception{
		return boardmapper.boardList2();
	}

	//로그인하면 보이는 커뮤니티 게시글 리스트
	public List<Map<String, Object>> boardList(Criteria cri) throws Exception {
		return boardmapper.boardList(cri);
	}

	//카테고리별 게시글을 볼 수 있도록
	public List<Map<String, Object>> boardListDetail(Criteria cri,Integer category) throws Exception {
		return boardmapper.boardListDetail(cri,category);
	}

	//페이징(?)작업을 위한 게시글 카운트
	public int boardListCnt() throws Exception {
		return boardmapper.boardListCnt();
	}

	//카테고리별 게시글 카운트
	public int boardListCntDetail(Integer category) throws Exception {
		return boardmapper.boardListCntDetail(category);
	}


	public BoardVO boardRead(int num) throws Exception {
		return boardmapper.boardRead(num);
	}

	public void boardModify(BoardVO boardVO) throws Exception {
		boardmapper.boardModify(boardVO);
	}

	public void boardModifyForm(int num) throws Exception {
		boardmapper.boardModifyForm(num);
	}

	public void boardDelete(int num) throws Exception {
		boardmapper.boardDelete(num);
	}

	//댓글 리스트
	public List<CommentVO> commentList(int com_num) throws Exception{
		return boardmapper.commentList(com_num);
	}

	//댓글 추가
	public int commentInsert(CommentVO comment) throws Exception{
		return boardmapper.commentInsert(comment);
	}

	//제일 마지막에 추가된 댓글의 comment_seq값 가져오기
	public int last() throws Exception{
		return boardmapper.last();
	}

	//seq값을 comment_group 칼럼 값으로 넣기(모댓글인 경우)
	public int updateGroup(int comment_seq) throws Exception{
		return boardmapper.updateGroup(comment_seq);
	}

	//댓글 수정
	public int commentUpdate(CommentVO comment)  throws Exception{
		return boardmapper.commentUpdate(comment);
	}

	//댓글삭제
	public int commentDelete(int cno) throws Exception{
		return boardmapper.commentDelete(cno);
	}
	public List<CommentVO> recommentList(int comment_group) throws Exception{
		return boardmapper.recommentList(comment_group);
	}
	//댓글 카운트
	public int updateReplyCount(int com_num) throws Exception {
		return boardmapper.updateReplyCount(com_num);
	}

	//좋아요 기능
	public int likecount(LikeVO like)  throws Exception{
		return boardmapper.likecount(like);
	}

	public int likegetinfo(LikeVO like)  throws Exception{
		return boardmapper.likegetinfo(like);
	}

	public void likeinsert(LikeVO like) throws Exception{
		boardmapper.likeinsert(like);
	}

	public void likeupdate(LikeVO like) throws Exception{
		boardmapper.likeupdate(like);
	}

	public int updatecomlike(int com_num) throws Exception {
		return boardmapper.updatecomlike(com_num);
	}

	/** 상담 서비스**//**/
	//게시글 작성과 수정 시 사진 첨부
	public String updateTalkImg(TalkVO talkVO, MultipartFile file) throws Exception{
		String projectPath=System.getProperty("user.dir")+"\\src\\main\\resources\\static\\files";
		//파일 이름에 붙일 이름 랜덤 생성
		UUID uuid=UUID.randomUUID();
		//저장될 파일이름 생성
		String fileName=uuid+"_"+file.getOriginalFilename();
		File saveFile = new File(projectPath,fileName);
		file.transferTo(saveFile);
		talkVO.setTalk_photo("/files/"+fileName);
		String talk_photo = talkVO.getTalk_photo();
		return talk_photo;
	}

	public void talkWrite(TalkVO talkVO) throws Exception{
		boardmapper.talkWrite(talkVO);
	}

	public List<Map<String, Object>> talkList( Criteria cri, Integer category) throws Exception{
		return boardmapper.talkList(cri,category);
	}
	public int talkListCnt(Integer category) throws Exception{
		return boardmapper.talkListCnt(category);
	}
	public TalkVO talkRead(int talk_num) throws Exception{
		return boardmapper.talkRead(talk_num);
	}

	public void talkModify(TalkVO talkVO) throws Exception{
		boardmapper.talkModify(talkVO);
	}

	public void talkDelete(int num) throws Exception{
		boardmapper.talkDelete(num);
	}/**/
	//댓글 리스트 - 상담
	public List<CommentVO> talkcommentList(int talk_num) throws Exception{
		return boardmapper.talkcommentList(talk_num);
	}

	//댓글 추가 - 상담
	public int talkcommentInsert(CommentVO comment) throws Exception{
		return boardmapper.talkcommentInsert(comment);
	}

	//제일 마지막에 추가된 댓글의 comment_seq값 가져오기 - 상담
	public int last2() throws Exception{
		return boardmapper.last2();
	}

	//seq값을 comment_group 칼럼 값으로 넣기(모댓글인 경우) - 상담
	public int talkupdateGroup(int comment_seq) throws Exception{
		return boardmapper.talkupdateGroup(comment_seq);
	}

	//댓글 수정 - 상담
	public int talkcommentUpdate(CommentVO comment)  throws Exception{
		return boardmapper.talkcommentUpdate(comment);
	}

	//댓글삭제 - 상담
	public int talkcommentDelete(int cno) throws Exception{
		return boardmapper.talkcommentDelete(cno);
	}
	//대댓글 리스트 - 상담
	public List<CommentVO> talkrecommentList(int comment_group) throws Exception{
		return boardmapper.talkrecommentList(comment_group);
	}
	//댓글 카운트 - 상담
	public int talkupdateReplyCount(int talk_num) throws Exception {
		return boardmapper.talkupdateReplyCount(talk_num);
	}

	//신고페이지
	public List<Map<String, Object>> reportList( Criteria cri, Integer category) throws Exception{
		return boardmapper.reportList(cri,category);
	}
	public int reportListCnt(Integer category) throws Exception{
		return boardmapper.reportListCnt(category);
	}

	public void reportWrite(ReportVO reportVO) throws Exception{
		boardmapper.reportWrite(reportVO);
	}

	public ReportVO reportRead(int re_num) throws Exception{
		return boardmapper.reportRead(re_num);
	}

	public void reportModify(ReportVO reportVO) throws Exception{
		boardmapper.reportModify(reportVO);
	}


	//에디터 페이지
	public List<Map<String, Object>> editorList(Criteria cri, Integer category) throws Exception{
		return boardmapper.editorList(cri,category);
	}
	public int editorListCnt(Integer category) throws Exception{
		return boardmapper.reportListCnt(category);
	}

	public void editorWrite(EditorVO editorVO) throws Exception{
		boardmapper.editorWrite(editorVO);
	}

	public ReportVO editorRead(int edit_num) throws Exception{
		return boardmapper.reportRead(edit_num);
	}



}
