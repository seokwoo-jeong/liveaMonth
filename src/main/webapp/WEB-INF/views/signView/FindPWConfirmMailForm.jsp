<%--
  Created by IntelliJ IDEA.
  User: rbdus
  Date: 2021-06-07
  Time: 오후 6:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<img src="resources/img/logo.png" alt="">
안녕하세요. 고객님<br><br>
<h4>요청하신 임시 비밀번호는 다음과 같습니다.<br>
임시비밀번호 : " + userVO.getUserPassword()+"<br>
<a href="#">로그인 하러가기</a></h4><br>
<p>발급된 비밀번호는 임시로 발급된 것이므로 로그인 후 '마이페이지 -> 회원정보 수정'을 통해 비밀번호를 변경해주시기 바랍니다.</p><br>
<p>다른 문의사항이 있으시면 한달살기(TP.liveamonth@gamil.com)으로 문의해 주시기 바랍니다.</p><br>
<strong>감사합니다.</strong>
</body>
</html>
