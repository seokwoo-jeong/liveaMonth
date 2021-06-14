<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="col-lg-2">
  <div class="blog-sidebar">
    <div class="feature-post">
      <div class="section-title sidebar-title-b">
        <h6>고객센터</h6>
      </div>
      <div class="recent-post">
        <c:forEach var="customerMenu" items="${customerCenterMenus}">
          <div class="rp-item">
            <div class="rp-text">
              <a href="selectedCustomerCenterMenu?menu=${customerMenu.text}">${customerMenu.menuName}</a>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>
</div>