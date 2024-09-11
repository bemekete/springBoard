<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Spring MVC01</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 
<div class="container">
  <h2>자유게시판</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시글 상세보기</div>
    <div class="panel-body">
    	<form action="boardUpdate.do" method="post">
			<table class="table">
				<tr>
					<td>게시글번호</td>
					<td><input type="text" name="idx" class="form-control" readonly="readonly" value="${vo.idx }"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" class="form-control" readonly="readonly" value="${vo.title }"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="7" name="content" class="form-control" readonly="readonly">${vo.content }</textarea></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" class="form-control" value="${vo.writer }" readonly="readonly"></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><input type="text" name="indate" class="form-control" value="${fn:split(vo.indate," ")[0] }" readonly="readonly"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<a href="boardUpdateForm.do?idx=${vo.idx}" class="btn btn-primary btn-sm">수정화면</a>
						<a href="boardDelete.do?idx=${vo.idx}" class="btn btn-warning btn-sm">삭제</a>
						<a href="boardList.do" class="btn btn-info btn-sm">목록</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
    <div class="panel-footer">게시판 게시판 게시판 게시판 </div>
  </div>
</div>

</body>
</html>
