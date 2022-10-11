<%@ page import="com.helloproject.vo.MemberVO" %>
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
                url:'/comment/list',
                type:'get',
                data:{'com_num':bno},
                success:function(data){
                    var a='';
                    $.each(data,function(key,value){
                        a+='<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom:15px;">';
                        a+='<div class="commentInfo'+value.comment_seq+'">'+'댓글번호 : '+value.comment_seq+' / 작성자 : '+value.mb_nick;
                        if(value.mb_nick == writer){
                            a+='<a onclick="commentUpdate('+value.comment_seq+',\''+value.comment_content+'\');"> 수정 </a>';
                            a+='<a onclick="commentDelete('+value.comment_seq+');"> 삭제 </a>';
                        }
                        a+='</div>';
                        a+='<div class="commentContent'+value.comment_seq+'"> <p> 내용 : '+value.comment_content+'</p>';
                        a+='</div></div>';
                    });
                    $(".commentList").html(a);
                }
            });
        }
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
        //댓글수정-댓글내용 출력을 input 폼으로 변경
        function commentUpdate(comment_seq,comment_content){
            var a='';
            a+='<div class="input-group">';
            a+='<input type="text" class="form-control" name="content_'+comment_seq+'"value="'+comment_content+'"/>';
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