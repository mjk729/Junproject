<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타임라인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
    <div id="wrap">
        <c:import url="/WEB-INF/jsp/include/header.jsp" />
        <section class="contents d-flex justify-content-center">
        	<!-- 타임라인 -->
            <div class="timeline">
            	<!-- 입력박스 -->
            	<div class="input-box border rounded mt-3">
            		<input type="text" class="form-control" id="titleInput" placeholder="제목을 입력하세요.">
            		<textarea rows="4" class="form-control border-0" id="contentInput" placeholder="내용을 입력하세요."></textarea>
            		<input type="text" class="form-control" id="tagInput" placeholder="태그를 입력하세요.">
            		<div class="d-flex justify-content-between p-2">
            			<i class="bi bi-file-earmark-image-fill image-icon-size" id="imageIcon"></i>
            			<input type="file" id="fileInput" class="d-none">
            			<button type="button" class="btn btn-info btn-sm" id="uploadBtn">업로드</button>
            		</div>
            	</div>
            	<!-- /입력박스 -->
            	<c:forEach var="post" items="${postList }">
            	<!-- 카드 리스트 -->
            	<div class="card-List mt-3">
            		<!-- 카드 -->
            		<div class="card my-3">
            			<div class="d-flex justify-content-between p-2">
            				<div>${post.loginId }</div>
            				<c:if test="${post.userId == userId }">
            				<i data-post-id="${post.id }" class="bi bi-three-dots more-btn" data-toggle="modal" data-target="#moreModal"></i>
            				</c:if>
            			</div>
            			<div class="ml-2"> ${post.title }</div>
            			<div>
            				<img class="w-100"src="${post.imagePath }">
            			</div>
            			<div class="d-flex justify-content-between p-2">
            				<b>${post.tag }</b>
            				<div>
            				<c:choose>
								<c:when test="${post.like }">
									<%-- 채워진 하트 아이콘 --%>
									<i data-post-id="${post.id }" class="bi bi-heart-fill text-danger unlike-btn"></i>
								</c:when>
								<c:otherwise>
									<%-- 비워진 하트 아이콘 --%>
									<i data-post-id="${post.id }" class="bi bi-heart like-btn"></i>
								</c:otherwise>
							</c:choose>
            				 좋아요 ${post.likeCount }개
            				</div>
            			</div>
            			<div class="ml-2">
            				${post.content }
            			</div>
            		
            			<!-- 댓글 박스 -->
            			<div class="comment-box small">
            				<div class="p-2">댓글</div>
            				<c:forEach var="comment" items="${post.commentList }">
            				<div class="ml-2 pb-1">
            					<b>${comment.loginId} </b> ${comment.comment }
            				</div>
            				</c:forEach>
            				
            				<div class="d-flex">
            					<input type="text" class="form-control" id="commentInput${post.id }">
            					<button type="button" class="btn btn-info comment-btn" data-post-id="${post.id }">게시</button>
            				</div>
            			</div>
            			<!-- /댓글 박스 -->
            			
            		</div>
            		<!-- /카드 -->
            	</div>
            	</c:forEach>
            	<!-- /카드 리스트 -->	
            </div>
        	
           <!-- /타임라인 -->
        </section>
        <c:import url="/WEB-INF/jsp/include/footer.jsp" />
    </div>
    
<!-- Modal -->
<div class="modal fade" id="moreModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      
      <div class="modal-body text-center">
        <a href="#" id="deleteBtn">삭제하기</a>
      </div>
     
    </div>
  </div>
</div>
    
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <script>
    	$(document).ready(function(){
    		
    		$("#deleteBtn").on("click", function(){
    			
    			let postId = $(this).data("post-id");
    			
    			$.ajax({
    				type:"delete"
    				,url:"/post/delete"
    				,data:{"postId":postId}
    				,success:function(data){
    					if(data.result == "success"){
    						location.reload();
    					} else{
    						alert("삭제 실패");
    					}
    				}
    				,error:function(){
    					alert("삭제 에러");
    				}
    			});
    			
    			
    		});
    		
    		
    		$(".more-btn").on("click", function(){
    			let postId = $(this).data("post-id");
    			
    			$("#deleteBtn").data("post-id", postId);
    			
    		});
    		
    		$(".unlike-btn").on("click", function(){
    			let postId = $(this).data("post-id");
    			
    			$.ajax({
    				type:"delete"
    				,url:"/post/unlike"
    				,data:{"postId":postId}
    			,success:function(data){
    				if(data.result == "success"){
    					location.reload();
    				}else{
    					alert("좋아요 취소 실패")
    				}
    			}
    			,error:function(){
    				alert("좋아요 취소 에러")
    			}
    			});
    		});
    		
    		$(".like-btn").on("click", function(){
    			
    			// 좋아요한 대상 게시글 id
    			let postId = $(this).data("post-id");
    			
    			$.ajax({
    				type:"post"
    				,url:"/post/like"
    				,data:{"postId":postId}
    				,success:function(data){
    					if(data.result == "success"){
    						location.reload();
    					}else{
    						alert("좋아요 실패")
    					}
    				}
    				,error:function(){
    					alert("좋아요 에러")
    				}
    			});
    			
    		});
    		
    		$("#imageIcon").on("click", function(){
    			// file input을 클릭한것과 똑같은 
    			$("#fileInput").click();
    			
    		});
    		
    		$(".comment-btn").on("click", function(){
    			let postId = $(this).data("post-id");
    			//let comment = $("#commentInput" + postId).val();
    			let comment = $(this).prev().val();
    			
    			if(comment == ""){
    				alert("작성할 댓글을 입력하세요");
    				return;
    			}
    			
    			$.ajax({
					type:"post"
					,url:"/post/comment/create"
					,data:{"comment" : comment, "postId" : postId}
					,success:function(data){
						if(data.result == "success"){
							location.reload();
						} else{
							alert("댓글 작성 실패");
						}
						
					}
					,error:function(){
						alert("댓글 작성 에러")
					}
				});
    			
    		});
    		
    		
    		
    			$("#uploadBtn").on("click", function(){
    				let title = $("#titleInput").val();
    				let content = $("#contentInput").val();
    				
    				let file = $("#fileInput")[0];
    				let tag = $("#tagInput").val();
    				
    				if(title == ""){
    					alert("제목을 입력하세요");
    					return;
    				}
    				
    				if(content == ""){
    					alert("내용을 입력하세요");
    					return;
    				}
    					/* 파일이 선택되지 않은 경우 유효성 검사
    				if(file.files.length == 0){
    					alert("파일을 선택하세요");
    					return;
    				} */
    				
    				// 파일 형식이 있음으로 폼 형식으로
    				var formData = new FormData();
    				formData.append("title", title);
    				formData.append("content", content);
    				formData.append("file", file.files[0]);
    				formData.append("tag", tag);
    				
    				$.ajax({
    					type:"post"
    					,url:"/post/create"
    					,data:formData
    					,enctype:"multipart/form-data"
    					,processData:false
    					,contentType:false
    					,success:function(data){
    						if(data.result == "success"){
    							location.reload();
    						} else{
    							alert("게시물 작성 실패");
    						}
    						
    					}
    					,error:function(){
    						alert("게시물 작성 에러")
    					}
    				});
    				
    			});
    			
    		
    	});
    </script>
    
</body>
</html>
