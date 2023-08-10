<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
    <div id="wrap">
        <c:import url="/WEB-INF/jsp/include/header.jsp" />
        <section class="contents">
            <div class="row justify-content-center align-items-center">
                    <div class="create-box d-flex justify-content-center align-items-center">
                    	<div class="join-box d-flex-column ">
                    	<div>
                        <input type="text" placeholder="제목을 입력하세요." id="titleInput" class="my-3">
                    	</div>
                        <div>
                        <textarea rows="10" class="form-control" placeholder="내용을 입력하세요." id="contentInput"></textarea>                        
                        </div>
                        <div>
                        <input type="file" id="fileInput">                        
                        </div>
                        <div>
                        <input type="text" placeholder="#태그를 입력하세요." id="tagInput" class="form-control mb-5">                        
                        </div>
                        <div class="d-flex justify-content-center align-items-between">
                        <div>
                        <button type="button" id="cancelBtn" class="btn btn-sm btn-danger mt-2 mb-2 mr-5">취소</button>
                        </div>
                        <div>
                        <button type="button" id="saveBtn" class="btn btn-success btn-sm mt-2 mb-2 ml-5">저장</button>
                        </div>
                        </div>                       
                    
                    	</div>
                </div>
            </div>
        </section>
        <c:import url="/WEB-INF/jsp/include/footer.jsp" />
    </div>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <script>
    $(document).ready(function(){
    	$("#calcelBtn").on("click", function(){
    		location.href="/post/timeline-view";
    	});
    	
    	$("#saveBtn").on("click", function(){
    		
    		let title = $("#titleInput").val();
    		let content = $("#contentInput").val();
    		let tag = $("#tagInput").val();
    		let file = $("#fileInput")[0];
    		
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
    		formData.append("tag", tag);
    		formData.append("file", file.files[0]);
    		
    		$.ajax({
    			type:"post"
    			,url:"/post/create"
    			,data:formData
    			,enctype:"multipart/form-data"
    			,processData:false
    			,contentType:false
    			,success:function(data){
    				if(data.result == "success"){
    					location.href="/post/timeline-view";
    				} else{
    					alert("게시물 작성 실패");
    				}
    			}
    			,error:function(){
    				alert("게시물 작성 에러");
    			}
    		});
    		
    	});
    	
    });
    </script>
    
</body>
</html>
