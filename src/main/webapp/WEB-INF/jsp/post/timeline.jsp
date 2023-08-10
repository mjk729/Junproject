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
            			<button type="button" class="btn btn-info btn-sm" id="createBtn">업로드</button>
            		</div>
            	</div>
            	<!-- /입력박스 -->
            	<c:forEach var="post" items="${postList }">
            	<!-- 카드 리스트 -->
            	<div class="card-List mt-3">
            		<!-- 카드 -->
            		<div class="card my-3">
            			<div class="d-flex justify-content-between p-2">
            				<div>${post.userId }</div>
            				<i class="bi bi-three-dots"></i>
            			</div>
            			<div>${post.title }</div>
            			<div>
            				<img class="w-100"src="${post.imagePath }">
            			</div>
            			<div class="d-flex justify-content-between p-2">
            				<b>${post.tag }</b>
            				<i class="bi bi-suit-heart-fill"></i> 좋아요 12개
            			</div>
            			<div>
            				<b>${post.userId }</b>${post.content }
            			</div>
            			
            			<!-- 댓글 박스 -->
            			<div class="comment-box small">
            				<div class="p-2">댓글</div>
            				<div>
            					<b>아이디3</b> 댓글 2
            				</div>
            				<div>
            					<b>아이디4</b> 댓글 3
            				</div>
            				
            				<div class="d-flex">
            					<input type="text" class="form-control">
            					<button type="button" class="btn btn-info">게시</button>
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
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <script>
    	$(document).ready(function(){
    		$("#imageIcon").on("click", function(){
    			// file input을 클릭한것과 똑같은 
    			$("#fileInput").click();
    			
    			$("#createBtn").on("click", function(){
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
    							location.reload("/post/timeline-view");
    						} else{
    							alert("게시물 작성 실패");
    						}
    						
    					}
    					,error:function(){
    						alert("게시물 작성 에러")
    					}
    				})
    				
    			});
    			
    		});
    	});
    </script>
    
</body>
</html>
