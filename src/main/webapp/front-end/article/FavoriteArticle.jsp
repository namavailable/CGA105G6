<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@page import="com.favoriteArticle.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
List<ForumFavoriteArticleVO> list = (List<ForumFavoriteArticleVO>) request.getSession()
		.getAttribute("forumFavoriteArticleSessionVOs");
pageContext.setAttribute("list", list);
%>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- import icon -->
<script src="https://kit.fontawesome.com/b5ef6b60f3.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous">
	
</script>

<%@ include file="/front-end/header.jsp"%>

<style>
.styled-table {
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
	margin: auto;
	font-size: 0.9em;
	font-family: sans-serif;
	min-width: 400px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

.styled-table thead tr {
	background-color: #212529;
	color: #ffffff;
	text-align: left;
}

.styled-table th, .styled-table td {
	padding: 12px 10px;
}

.styled-table tbody tr {
	border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
	background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
	border-bottom: 2px solid #212529;
}

.styled-table tbody tr.active-row {
	font-weight: bold;
	color: #212529;
}

table#table-1 {
	background-color: #212529;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	width: 1000px;
	margin-top: 20px;
	margin-bottom: 5px;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h3 {
	color: black;
	font-weight: 700 !important;
}

h4 {
	color: blue;
	display: inline;
}


table {
	margin-left: auto;
	margin-right: auto;
	width: 80%;
	margin-top: 5px;
	margin-bottom: 5px;
}

th, td {
	padding: 5px;
	text-align: center;
}

.btnIn {
	border-radius: 20px !important;
}

.thTitle {
	background-color: #B5FFFC !important;
	border: none;
}

.btnBlock {
	margin-top: 30px;
	display: flex;
	align-items: center;
	justify-content: center;
}

section {
	height: 100%;
	background-image: linear-gradient(0deg, #FFDEE9 0%, #B5FFFC 100%);
	background-color: #FFDEE9;
	background-repeat: no-repeat;
	background-size: cover;
}

.atitle_but {
	border: none;
	background: none;
}

.atitle_but:hover {
	border-bottom: blue 1px solid;
	color: blue;
}

.goback {
	float : right;
	background:none;	
}

</style>

<center>
	<div class="container">

		<div class="row m-3">
			<div class="col-4"></div>
			<div class="col-4">
				<h1>????????????</h1>
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">?????????????????????:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
			</div>
			<div class="col-4 align-self-end">
				<a class="goback button1"
					href=" <%=request.getContextPath()%>/front-end/article/select_page.jsp">
					???????????????
				</a>
			</div>
		</div>
		<div class="col-md-12">
			<table class="styled-table">
				<thead>
					<tr>
						<th>???????????????&emsp;</th>
						<th>????????????&emsp;</th>
						<th>?????????&emsp;</th>
						<th>????????????</th>
					</tr>
				</thead>
				<tbody>
					<%@ include file="/front-end/page1.file"%>
					<c:forEach var="forumFavoriteArticleVO" items="${list}">

						<tr align='center' valign="middle">
							<td><div
									style="width: 125px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${forumFavoriteArticleVO.forumArticleVO.forumVO.forumName}</div></td>
							<td><div
									style="width: 400px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<a href="<%=request.getContextPath()%>/ForumArticleServlet?action=getOne_For_Display&articleNo=${forumFavoriteArticleVO.articleNo}">${forumFavoriteArticleVO.forumArticleVO.title}</a>
								</div></td>
							<td><div
									style="width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${forumFavoriteArticleVO.forumArticleVO.memVO.memName}</div></td>
							<td><div
									style="width: 400px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
									<FORM METHOD="post"
										ACTION="<%=request.getContextPath()%>/FavoriteArt.do"
										style="margin-bottom: 0px;">
										<input type="submit" value="??????"
											style="width: 37px; height: 37px;" class="deletePost">
										<input type="hidden" name="memNo" value="${forumFavoriteArticleVO.memNo}"> 
										<input type="hidden" name="articleNo" value="${forumFavoriteArticleVO.articleNo}"> 
										<input type="hidden" name="action" value="delete">
									</FORM>
								</div></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<%@ include file="/front-end/page2.file"%>
</center>
<script
	src="https://cdn.bootcdn.net/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script type="text/javascript">
	// ??????
let deletePost = $(".deletePost");
var targetNum = 0;
if(deletePost){
	deletePost.click(function(e){
		targetNum = e.target.id;
		swal({ 
			  title: "??????????????????", 
			  text: "", 
			  type: "warning",
			  showCancelButton: true, 
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "?????????", 
			  cancelButtonText: "?????????",
			  closeOnConfirm: false, 
			  closeOnCancel: false  
			}).then(
			function(isConfirm){ 
			  if (isConfirm) {
			    swal("???????????????", "","success")
			    .then(() => {
				setTimeout(returnPostList, 2000);
				function returnPostList(){
					let deleteFormName = "#deleteForm"+targetNum;
					document.querySelector(deleteFormName).submit();
				}
			 }); 
			  } else { 
			    swal("???????????????", "",
			"error"); 
			  } 
			});
	})
}
</script>
<%@ include file="/front-end/footer.jsp"%>