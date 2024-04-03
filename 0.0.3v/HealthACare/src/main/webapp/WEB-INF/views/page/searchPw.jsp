<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
<form action="${cp}/page/searchPw" method="post">
<label for="securityQuestion" class="text3">비밀번호찾기 질문</label>
	<select class="passwordQuestion" id="I_pwFinding" name="I_pwFinding">
		<option value="1">질문을 넣어주세요</option>
		<option value="2">질문을 넣어주세요2</option>
		<option value="3">질문을 넣어주세요3</option>
	</select>
<label for="QuestionAnswer" class="text3">비밀번호찾기답</label>
<input id="I_hint" name="I_hint" type="text">
<input id="signUPBt" type="submit" value="회원가입">
</form>
</body>
</html>