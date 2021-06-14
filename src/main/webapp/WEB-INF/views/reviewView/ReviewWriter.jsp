<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>SummerNoteExample</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        var $j351 = jQuery.noConflict();
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script src="resources/summernote-0.8.18-dist/summernote-bs4.js"></script>
    <script src="resources/summernote-0.8.18-dist/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="resources/summernote-0.8.18-dist/summernote-bs4.css">

    <script type="text/javascript" src="resources/js/review.js"></script>

</head>
<body>
<section class="property-submit-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="property-submit-form">
                    <form id="reviewForm" action="addReview">
                        <div class="pf-feature-price">
                            <h4>Category</h4>
                            <div class="search-form-content">
                                <div class="filter-form">
                                    <div id = "reviewCategoryDiv">
                                        <select class="sm-width2"  id ="reviewCategory" name = "reviewCategory">
                                            <c:forEach var="reviewCategory" items="${reviewCategoryList}">
                                                <option value="${reviewCategory}">${reviewCategory.nameKR}</option>
                                            </c:forEach>
                                        </select>
                                        <c:if test="${reviewVO != null}">
                                            <script>$("#reviewCategory").val("${reviewVO.reviewCategory}").prop("selected", true);</script>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <br>
                        <div class="pf-title">
                            <h4>Title</h4>
                            <input type="text" id = "reviewSubject" name = "reviewSubject" placeholder="제목을 입력해주세요"
                            <c:if test="${reviewVO != null}"> value="${reviewVO.reviewSubject}" </c:if> >
                        </div>
                        <div class="pf-summernote">
                            <h4>Content</h4>
                            <textarea class="summernote" id = "reviewDesc" name = "reviewDesc">
                                <c:if test="${reviewVO != null}">
                                    ${reviewVO.reviewDesc}
                                </c:if>
                            </textarea>
                        </div>
                        <script type="text/javascript">
                            $j351('.summernote').summernote({
                                toolbar: [
                                    ['fontname', ['fontname']],
                                    ['fontsize', ['fontsize']],
                                    ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
                                    ['color', ['forecolor', 'color']],
                                    ['table', ['table']],
                                    ['para', ['ul', 'ol', 'paragraph']],
                                    ['height', ['height']],
                                    ['insert', ['picture', 'link', 'video']],
                                    ['view', ['fullscreen', 'codeview', 'help']]
                                ],
                                fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
                                fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],
                                placeholder: '내용을 입력해주세요',
                                height: 300,
                                lang: "ko-KR",
                                callbacks: {	//여기 부분이 이미지를 첨부하는 부분
                                    onImageUpload : function(files) {
                                        uploadSummernoteImageFile(files[0],this);
                                    },
                                    onPaste: function (e) {
                                        var clipboardData = e.originalEvent.clipboardData;
                                        if (clipboardData && clipboardData.items && clipboardData.items.length) {
                                            var item = clipboardData.items[0];
                                            if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
                                                e.preventDefault();
                                            }
                                        }
                                    }
                                }
                            });

                            function uploadSummernoteImageFile(file, editor) {
                                data = new FormData();
                                data.append("file", file);
                                $j351.ajax({
                                    data : data,
                                    type : "POST",
                                    url : "/uploadSummernoteImageFile",
                                    contentType : false,
                                    processData : false,
                                    success : function(data) {
                                        $j351(editor).summernote('insertImage', data.url);
                                    }
                                });
                            }
                            $j351('.dropdown-toggle').dropdown();

                        </script>
                        <c:choose>
                            <c:when test="${reviewVO != null}">
                                <input type="button" class="search-btn sm-width" style="float: right; margin-bottom: 20px;" value="수정" onclick="modifyReviewButton(${reviewVO.reviewNO});">
                                <input type="button" onClick="history.go(-1)" value="취소">
                            </c:when>
                            <c:otherwise>
                                <input type="button" class="search-btn sm-width" style="float: right; margin-bottom: 20px;" value="등록" onclick="addReviewButton();">
                                <input type="button" onClick="history.go(-1)" value="취소">
                            </c:otherwise>
                        </c:choose>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
</body>

</html>