package com.project.mapper;

import com.project.vo.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Repository
public interface MainMapper {

	public String now() throws Exception;

	/** 회원가입 **/
	// 유저체크
	public MemberVO userCheck(MemberVO memberVO) throws Exception;

	// 아이디체크
	public int idCheck(String mb_id) throws Exception;

	// 닉네임 체크
	public int nickCheck(String mb_nick) throws Exception;

	// 회원가입
	public void memberRegister(MemberVO memberVO) throws Exception;


	/** 로그인 **/
	// 아이디 찾기
	public String find_id(String email) throws Exception;

	//header.html
	public String session_id(String email) throws Exception;

	//비밀번호 찾기(추가)
	// 비밀번호 변경
	public int update_pw(MemberVO memberVO) throws Exception;

	// 로그인
	public MemberVO memberLogin(MemberVO memberVO) throws Exception;


	/** 관리자 페이지 **/
	//관리자 페이지 - 회원 리스트
	public List<MemberVO> Memberlist() throws Exception;

	//회원 강제추방(관리자페이지)
	public void dropUser(String id) throws Exception;

	//관리자 페이지(추가)
	Optional<MemberVO> findByUsername(String mb_id) throws Exception;

	//관리자 페이지 - 회원리스트
	public List<MemberVO> dispAdmin() throws Exception;

	public void memberOut(MemberVO memberVO) throws Exception;


	/** 회원 정보 관리 **/
	// 회원정보 수정 - 세션 가져오기
	public MemberVO memberModifyGET(String mb_id) throws Exception;

	// 회원정보 수정
	public void memberModifyPOST(MemberVO memberVO) throws Exception;

	// 회원 탈퇴
	public void memberDelete(MemberVO memberVO) throws Exception;
	public MemberVO memberDeleteGET(String mb_id) throws Exception;

	// 닉네임 변경
	public void nickModifyPOST(MemberVO memberVO) throws Exception;
	public MemberVO nickModifyGET(String mb_id) throws Exception;

	//프로필 사진 변경
	public MemberVO profileModifyGET(String mb_id) throws Exception;
	public void profileModifyPOST(MemberVO memberVO) throws Exception;



	/** 게시판 **/
	// 게시판
	public void boardWrite(BoardVO boardVO) throws Exception;
	public List<Map<String, Object>> boardList(Criteria cri) throws Exception;
	public List<Map<String, Object>> boardListDetail( Criteria cri, Integer category) throws Exception;
	public List<BoardVO> boardList2() throws Exception;
	public int boardListCnt(Criteria cri) throws Exception;
	public int boardListCntDetail(Integer category,Criteria cri) throws Exception;
	public void increaseComhit(int com_num) throws Exception;

	public BoardVO boardRead(int num) throws Exception;

	public void boardModify(BoardVO boardVO) throws Exception;

	public void boardModifyForm(int num) throws Exception;

	public void boardDelete(int num) throws Exception;


	/** 댓글 **/
	//댓글 카운트
	public int updateReplyCount(int com_num) throws Exception;

	//댓글목록
	public List<CommentVO> commentList(int com_num) throws Exception;
	//댓글작성
	public int commentInsert(CommentVO comment) throws Exception;
	//제일 마지막에 추가된 댓글의 comment_seq값 가져오기
	public int last() throws Exception;
	//seq값을 comment_group 칼럼 값으로 넣기(모댓글인 경우)
	public int updateGroup(int comment_seq) throws Exception;
	//댓글수정
	public int commentUpdate(CommentVO comment) throws Exception;
	//댓글삭제
	public int commentDelete(int cno) throws Exception;
	//대댓글 출력 관련 코드
	public List<CommentVO> recommentList(int comment_group) throws Exception;


	/** 좋아요 기능 - 커뮤니티 **/
	//좋아요 기능
	public int likecount(LikeVO like) throws Exception;

	public int likegetinfo(LikeVO like) throws Exception;

	public void likeinsert(LikeVO like) throws Exception;

	public void likeupdate(LikeVO like) throws Exception;

	//게시글 별 좋아요 카운트 후 수정
	public int updatecomlike(int com_num) throws Exception;


	/** 상담 **/
	// 상담
	public void talkWrite(TalkVO talkVO) throws Exception;

	//상담 리스트
	public List<Map<String, Object>> talkList(Criteria cri, Integer category) throws Exception;

	//상담 카테고리별 글 카운트
	public int talkListCnt(Integer category) throws Exception;
	public TalkVO talkRead(int talk_num) throws Exception;

	public void talkModify(TalkVO talkVO) throws Exception;

	public void talkDelete(int num) throws Exception;

	//댓글 카운트 - 상담
	public int talkupdateReplyCount(int talk_num) throws Exception;

	//댓글목록 - 상담
	public List<CommentVO> talkcommentList(int talk_num) throws Exception;
	//댓글작성 - 상담
	public int talkcommentInsert(CommentVO comment) throws Exception;
	//제일 마지막에 추가된 댓글의 comment_seq값 가져오기 - 상담
	public int last2() throws Exception;
	//seq값을 comment_group 칼럼 값으로 넣기(모댓글인 경우) - 상담
	public int talkupdateGroup(int comment_seq) throws Exception;
	//댓글수정 - 상담
	public int talkcommentUpdate(CommentVO comment) throws Exception;
	//댓글삭제 - 상담
	public int talkcommentDelete(int cno) throws Exception;
	//대댓글 출력 관련 코드 - 상담
	public List<CommentVO> talkrecommentList(int comment_group) throws Exception;

	public void increaseTalkhit(int talk_num) throws Exception;

	/** 신고 페이지 **/
	public List<Map<String, Object>> reportList(Criteria cri, Integer category) throws Exception;
	//상담 카테고리별 글 카운트
	public int reportListCnt(Integer category) throws Exception;

	// 신고
	public void reportWrite(ReportVO reportVO) throws Exception;

	public ReportVO reportRead(int re_num) throws Exception;

	public void reportModify(ReportVO reportVO) throws Exception;

	/** 메인 페이지 커뮤니티 리스트 **/
	//커뮤니티 전체 리스트 끌어오기 실패(컨트롤러,매퍼,서비스 없어서 그런 듯 , 리스트 생성시 상위 지도 없어지는 문제 발생)


	/** 에디터 페이지 **/
	public List<Map<String, Object>> editorList(Criteria cri, Integer category) throws Exception;
	//에디터 글 카운트
	public int editorListCnt(Integer category) throws Exception;

	//에디터 글 작성
	public void editorWrite(EditorVO editorVO) throws Exception;

	//에디터 글 읽기
	public EditorVO editorRead(int edit_num) throws Exception;

	//댓글 카운트 - 에디터
	public int editorupdateReplyCount(int edit_num) throws Exception;

	//댓글목록 - 에디터
	public List<CommentVO> editorcommentList(int edit_num) throws Exception;

	//댓글작성 - 에디터
	public int editorcommentInsert(CommentVO comment) throws Exception;

	//제일 마지막에 추가된 댓글의 comment_seq값 가져오기 - 에디터
	public int last3() throws Exception;

	//seq값을 comment_group 칼럼 값으로 넣기(모댓글인 경우) - 에디터
	public int editorupdateGroup(int comment_seq) throws Exception;

	//댓글수정 - 에디터
	public int editorcommentUpdate(CommentVO comment) throws Exception;

	//댓글삭제 - 에디터
	public int editorcommentDelete(int cno) throws Exception;

	//대댓글 출력 관련 코드 - 에디터
	public List<CommentVO> editorrecommentList(int comment_group) throws Exception;

	/** 좋아요 기능 - 에디터 **/
	//좋아요 기능
	public int editorlikecount(LikeVO like) throws Exception;

	public int editorlikegetinfo(LikeVO like) throws Exception;

	public void editorlikeinsert(LikeVO like) throws Exception;

	public void editorlikeupdate(LikeVO like) throws Exception;

	//게시글 별 좋아요 카운트 후 수정
	public int editorupdatelike(int edit_num) throws Exception;

	/** 공지사항 페이지 **/
	public List<Map<String, Object>> noticeList(Criteria cri, Integer category) throws Exception;
	//에디터 글 카운트
	public int noticeListCnt(Integer category) throws Exception;

	//에디터 글 작성
	public void noticeWrite(NoticeVO noticeVO) throws Exception;

	//에디터 글 읽기
	public NoticeVO noticeRead(int notice_num) throws Exception;

	/** 포인트 관리 **/
	public void pointModify(MemberVO memberVO) throws Exception;

	public void EpointModify(MemberVO memberVO) throws Exception;

	//addCalendar
	public void insertCalendar(MemberVO memberVO) throws Exception;

	/** 마이페이지 - 위치기반 페이지 **/

	public List<Map<String, Object>> locationList(Criteria cri, Integer category) throws Exception;
	//상담 카테고리별 글 카운트
	public int locationListCnt(Integer category) throws Exception;

}
