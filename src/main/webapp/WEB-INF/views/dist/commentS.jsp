<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<script>
	var bno = '${postDetailRespDto.no}'; //게시글 번호
	$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
	    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
	    commentInsert(insertData); //Insert 함수호출(아래)
	});
	
	//댓글 목록 
	function commentList(){
	    $.ajax({
	        url : '${root}/comment/list/'+bno,
	        type : 'get',
	        data : {'bno':bno},
	        success : function(data){
	            var a =''; 
	            $.each(data, function(key, value){ 
	                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
	                a += '<div class="commentInfo'+value.cno+'">'+'댓글번호 : '+value.cno;
	                a += '<a onclick="commentUpdate('+value.cno+',\''+value.content+'\');"> 수정 </a>';
	                a += '<a onclick="commentDelete('+value.cno+');"> 삭제 </a> </div>';
	                a += '<div class="commentContent'+value.cno+'"> <p> 내용 : '+value.content +'</p>';
	                a += '</div></div>';
	            });
	            $(".commentList").html(a);
	        },
			error : function(xhr, status, msg) {
				console.log("상태값 : " + xhr.status + " Http에러메시지 : "
						+ xhr.responseText);
			}
	    });
	}
	//댓글 등록
	function commentInsert(insertData){
	    $.ajax({
	        url : '${root}/comment/insert',
	        type : 'post',
	        data : insertData,
	        success : function(data){
	            if(data == 1) {
	                commentList(); //댓글 작성 후 댓글 목록 reload
	                $('[name=content]').val('');
	            }
	        }
	    });
	}
	//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
	function commentUpdate(cno, content){
	    var a ='';
	    
	    a += '<div class="input-group">';
	    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
	    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
	    a += '</div>';
	    
	    $('.commentContent'+cno).html(a);
	    
	}

	//댓글 수정
	function commentUpdateProc(cno){
	    var updateContent = $('[name=content_'+cno+']').val();
	    
	    $.ajax({
	        url : '${root}/comment/update',
	        type : 'post',
	        data : {'content' : updateContent, 'cno' : cno},
	        success : function(data){
	            if(data == 1) commentList(bno); //댓글 수정후 목록 출력 
	        }
	    });
	}
	 
	//댓글 삭제 
	function commentDelete(cno){
	    $.ajax({
	        url : '${root}/comment/delete/'+cno,
	        type : 'post',
	        success : function(data){
	            if(data == 1) commentList(bno); //댓글 삭제후 목록 출력 
	        }
	    });
	}
	 
	 
	$(document).ready(function(){
	    commentList(); //페이지 로딩시 댓글 목록 출력 
	});
	 
 
 
</script>


