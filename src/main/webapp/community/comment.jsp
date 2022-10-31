<%@ page import="com.project.vo.MemberVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<html>
<head>
    <script>
        var bno='${data.com_num}';//게시글 번호
        var writer='${membervo.mb_nick}'; //작성자 닉네임 -- 수정 필요
        var doctor='${membervo.mb_doctor}'; //작성자 의사확인
        var seq='${membervo.mb_seq}'; //사용자코드


        $('[name=commentInsertBtn]').click(function(){//댓글등록버튼 클릭시
            var insertData=$('#comment_content').val();//commentInsertForm의 내용을 가져옴
        commentInsert(insertData);//Insert 함수호출(아래)
         });
        //댓글목록
        function commentList(){
            $.ajax({
                url: '/comment/list',
                type: 'get',
                data: {'com_num': bno},
                success: function (data) {
                    var a = '';
                    var list=data.list;

                    for(var i=0; i<list.length; i++) {
                        if (list[i].comment_depth == 0) {
                            a += '<div class="commentArea" align="left" style="border-bottom:1px solid darkgray; margin-bottom:15px;" >';
                            a += '<div class="commentInfo' + list[i].comment_seq + '">' + '댓글번호 : ' + list[i].comment_seq + ' / 작성자 : ' + list[i].mb_nick;
                            if(${sessionScope.stateCode ne null}){
                                a += '<br><a onclick="recommentInsertForm(' + list[i].comment_seq + ',\'' + list[i].comment_content + '\');">답글달기</a>';
                            }
                            if (list[i].mb_nick == writer) {
                                a += '<a onclick="commentUpdate(' + list[i].comment_seq + ',\'' + list[i].comment_content + '\');"> 수정 </a>';
                                a += '<a onclick="commentDelete(' + list[i].comment_seq + ');"> 삭제 </a>';
                            }
                            a += '</div>';
                            a += '<div class="commentContent' + list[i].comment_seq + '"> <p> 내용 : ' + list[i].comment_content + '</p>';
                            a += '<div class="recommentContent' + list[i].comment_seq + '"></div>';
                            a += '</div>';
                            a += '</div>';
                        }
                        if(list[i].comment_depth ==1){
                            a+='<div class="commentArea" align="left" style="border-bottom:1px solid darkgray; margin-bottom:15px; margin-left: 20px;">';
                            a+='<div class="commentInfo'+list[i].comment_seq+'">'+'댓글번호 : '+list[i].comment_seq+' / 모댓글 번호 : '+list[i].comment_group+' / 작성자 : '+list[i].mb_nick;
                            if(list[i].mb_nick == writer){

                                a+='<a onclick="commentUpdate('+list[i].comment_seq+',\''+list[i].comment_content+'\');"> 수정 </a>';
                                a+='<a onclick="commentDelete('+list[i].comment_seq+');"> 삭제 </a>';
                            }
                            a+='<div class="commentContent'+list[i].comment_seq+'"> <p> 내용 : '+list[i].comment_content+'</p>';
                            a+='</div>';
                            a+='</div>';
                            a+='</div>';
                        }
                    }
                    $(".commentList").html(a);
                }
            });
            };

        //댓글등록
        function commentInsert(insertData){
            $.ajax({
                url:'/comment/insert',
                type:'GET',
                data:{'content':insertData , 'bno':bno, 'writer':writer, 'doctor':doctor, 'seq':seq},
                success:function(data){
                    if(data==1){
                        commentList();
                        $('[name=comment_content]').val('');
                    }
                }
            });
        }
        //대댓글 폼 작성
        function recommentInsertForm(comment_seq){
            var a='';
            a+='<div class="col-12 input_box">';
            a+='<input type="text" class="box_eft_01" name="recontent_'+comment_seq+'"placeholder="내용 입력하세요."/>';
            a+='<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="reCommentInsert('+comment_seq+');">답글달기</button></span>';
            a+='<br>';
            a+='</div>';
            $('.recommentContent'+comment_seq).html(a);

        }

        //대댓글등록
        function reCommentInsert(comment_seq){
            var reCommentContent=$('[name=recontent_'+comment_seq+']').val();
            $.ajax({
                url:'/recomment/insert',
                type:'GET',
                data:{'comment_content':reCommentContent ,'comment_seq':comment_seq, 'bno':bno, 'writer':writer, 'doctor':doctor, 'seq':seq},
                success:function(data){
                    if(data==1){
                        commentList(bno);//대댓글 작성 후 목록 출력
                    }
                }
            });
        }

        //댓글수정-댓글내용 출력을 input 폼으로 변경
        function commentUpdate(comment_seq,comment_content){
            var a='';
            a+='<div class="col-12 input_box">';
            a+='<input type="text" class="box_eft_01" name="content_'+comment_seq+'"value="'+comment_content+'"/>';
            a+='<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+comment_seq+');">수정</button></span>';
            a+='</div>';
            $('.commentContent'+comment_seq).html(a);
        }
        //댓글수정
        function commentUpdateProc(comment_seq){
            var updateContent=$('[name=content_'+comment_seq+']').val();
            $.ajax({
                url:'/comment/update',
                type:'get',
                data:{'comment_content':updateContent,'comment_seq':comment_seq},
                success:function(data){
                    if(data==1)commentList(bno);//댓글 수정후 목록출력
                }
            });
        }
        //댓글삭제
        function commentDelete(comment_seq){
            $.ajax({
                url:'/comment/delete/'+comment_seq,
                type:'get',
                data:{'com_num':bno},
                success:function(data){
                    if(data==1)commentList(bno);
                }//댓글 삭제후 목록출력
            });
        }
        $(document).ready(function(){
            commentList();//페이지 로딩시 댓글목록 출력
         });
    </script>
</head>