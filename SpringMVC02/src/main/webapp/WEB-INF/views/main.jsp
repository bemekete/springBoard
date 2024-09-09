<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Spring MVC02</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	$(document).ready(function() {
		loadList();
	});
  	
  	function loadList() {
		$.ajax({
			url:"boardList.do",
			type: "get",
			dataType: "json",
			success: makeView,
			error: function () {
				alert("error");
			}
		})
	}
  	
  	// 게시글목록 뷰 생성
  	function makeView(data) {
		var listHtml = "<table class='table table-bordered'>";
		listHtml += "<tr>";
		listHtml += "<td>번호</td>";
		listHtml += "<td>제목</td>";
		listHtml += "<td>작성자</td>";
		listHtml += "<td>작성일</td>";
		listHtml += "<td>조회수</td>";
		listHtml += "</tr>";
		
		$.each(data, function(index,obj) {
			listHtml += "<tr>";
			listHtml += "<td>" + obj.idx + "</td>";
			listHtml += "<td><a href='javascript:goContent("+ obj.idx +")'>" + obj.title + "<a/></td>";
			listHtml += "<td>" + obj.writer + "</td>";
			listHtml += "<td>" + obj.indate + "</td>";
			listHtml += "<td>" + obj.count + "</td>";
			listHtml += "</tr>";
			
			listHtml += "<tr id = "+ obj.idx + " style = 'display:none'>";
			listHtml += "<td>내용</td>";
			listHtml += "<td colspan='4'>";
			listHtml += "<textarea readonly rows='7' class='form-control'>" + obj.content + "</textarea>";
			listHtml += "<br/>";
			listHtml += "<button class='btn btn-primary btn-xs'>수정</button>&nbsp";
			listHtml += "<button class='btn btn-danger btn-xs' onclick='goDelete("+obj.idx+")'>삭제</button>";
			listHtml += "</td>";
			listHtml += "</tr>";
		})
		listHtml += "</table>";
		
		listHtml += "<button class='btn btn-primary btn-sm' onclick='goForm()'>글쓰기</button>";
		
		$("#list").html(listHtml);
		
		goList();
	}
  	
  	// 게시글등록폼
  	function goForm() {
		$("#list").css("display","none");
		$("#writeForm").css("display","block");
	}
  	
  	// 게시글목록
  	function goList() {
			$("#writeForm").css("display","none");
  			$("#list").css("display","block");
	}
  	
  	// 게시글등록
  	function goInsert() {
		var formData = $("#form").serialize();
		
		$.ajax({
			url : "boardInsert.do",
			type : "post",
			data : formData,
			success : loadList,
			error : function (error) {
				alert("error : " + error);
			}
		});
		
		$("#formClear").trigger("click");
	}
  	
  	// 게시글 열기/접기
  	function goContent(idx) {
  		if ($("#" + idx).css("display") == "none") {
			$("#" + idx).css("display","table-row");
		}else{
			$("#" + idx).css("display","none");
		}
	}
  	
  	//게시글 삭제
  	function goDelete(idx) {
  		if (confirm("삭제하시겠습니까?")) {
  			$.ajax({
  				url : "boardDelete.do",
  				data : {"idx" : idx},
  				type : 'get',
  				success : loadList,
  				error : function (error) {
  					alert("error : " + error);
  				}
  			})
		}
	}
  </script>
</head>
<body>
 
<div class="container">
  <h2>Spring MVC02</h2>
  <div class="panel panel-default">
    <div class="panel-heading">BOARD</div>
    <div class="panel-body" id="list">Panel Content</div>
    <div class="panel-body" id="writeForm" style="display: none;">
    	<form id="form">
			<table class="table">
				<tr>
					<td>제목</td>
					<td><input type="text" id="title" name="title" class="form-control"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="7" id="content" name="content" class="form-control"></textarea></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" id="writer" name="writer" class="form-control"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="button" onclick="goInsert()" class="btn btn-success btn-sm">등록</button>
						<button type="reset" class="btn btn-warning btn-sm" id="formClear">취소</button>
						<button type="button" onclick="goList()" class="btn btn-info btn-sm">목록</button>
					</td>
				</tr>
			</table>
		</form>
    </div>
    <div class="panel-footer">인프런 스프1탄 황인규</div>
  </div>
</div>

</body>
</html>
