<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<body>
<link rel="stylesheet" href="resources/css/review.css" type="text/css">
<tiles:insertAttribute name="header"/>
<tiles:insertAttribute name="cityInfoSlide"/>
<section class="blog-section spad">
    <div class="container">
        <div class="row">
            <tiles:insertAttribute name="mainPopularContents"/>
            <tiles:insertAttribute name="mainSideBar"/>
            <tiles:insertAttribute name="cityInfoGrid"/>
        </div>
    </div>
</section>
<tiles:insertAttribute name="footer"/>
</body>
</html>
