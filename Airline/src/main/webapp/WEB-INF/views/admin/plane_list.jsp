<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/admin/css/air_schedule_manage_list.css" rel="stylesheet">
<style>

</style>
</head>
<body>
	<!-- <div class="row">
		<div class="col-8" id="searchContainer"> -->
		<div id="searchContainer">
		<div>
			<form action="/admin/airScheManage" method="get">
					<div style="width: 500px; margin: 0 auto; font-size: 20px; font-weight: bold; margin-top: 50px;">
						항공기 코드 
						<input type="text" name="planeCode">
						<input type="submit" class="btn btn-primary" value="검색">
					</div>
			</form>
		</div>

		<!-- <div class="col-10" id="listContainer"> -->
		<div>
		<table class="planeTable">
			<!-- <table class="table table-light"> -->
			<colgroup>
				<col width="*">
				<col width="*">
				<col width="13%">
				<col width="*">
				<col width="13%">
				<col width="*">
				<col width="13%">
				<col width="*">
			</colgroup>
				<thead>
					<tr>
						<td>항공기 코드</td>
						<td>다음 경로</td>
						<td>다음 일정 출발 일</td>
						<td>다음 일정 도착 일</td>
						<td>최종 경로</td>
						<td>최종 출발 일</td>	
						<td>최종 도착 일</td>
					</tr>
				</thead>
				
				
				<tbody>
				<c:forEach items="${planeList }" var="list">
						
							<tr onclick="location.href='/admin/airScheList?planeCode=${list.planeCode}';"
								<c:choose>
<%-- 									<c:when	test="${currentDate > departureDate and currentDate < arrivalDate}"> --%>
									<c:when	test="${currentDate > list.departureDate and currentDate < list.arrivalDate}">
										class="on" style="background-color: #66DE93;"  
									</c:when>
									<c:otherwise>
										class="off" style="background-color: #FF616D;" 
									</c:otherwise>
								</c:choose>
							>
								<!-- data-bs-toggle="modal" data-bs-target="#staticBackdrop" -->
								
								
								<td>
								${list.planeCode }
								</td>
								<td>
									<c:if test="${empty list.departurePortCode }">
									미정
									</c:if>
									${list.departurePortCode }
									<c:if test="${not empty list.departurePortCode }">
										-
									</c:if> 
									${list.arrivalPortCode }
								</td>
								<td>
									<c:if test="${empty list.departureDate }">
									미정
									</c:if>
									${list.departureDate }
								</td>
								<td>
									<c:if test="${empty list.arrivalDate }">
									미정
									</c:if>
									${list.arrivalDate }
								</td>
								<td>
									<c:if test="${empty list.finalDeparturePortCode }">
									미정
									</c:if>
									
									${list.finalDeparturePortCode }
									<c:if test="${not empty list.finalDeparturePortCode }">
										-
									</c:if>
									${list.finalArrivalPortCode }
								</td>
								<td>
									<c:if test="${empty list.finalDepartureDate }">
									미정
									</c:if>
									${list.finalDepartureDate }
								</td>
								<td>
									<c:if test="${empty list.finalArrivalDate }">
									미정
									</c:if>
									${list.finalArrivalDate }
								</td>
							</tr>
						
				</c:forEach>
				</tbody>
			</table>


				<div class="col-10">
					<nav aria-label="...">
						<ul class="pagination">
							<li
								class="page-item <c:if test="${!searchVO.prev }">disabled</c:if>">
								<a class="page-link"
								href="admin/airScheManage?nowPage=${searchVO.beginPage - 1 }">Previous</a>
							</li>
							<c:forEach begin="${searchVO.beginPage }"
								end="${searchVO.endPage }" var="pageIndex">
								<li
									class="page-item <c:if test="${searchVO.nowPage eq pageIndex }">active</c:if>"><a
									class="page-link"
									href="/admin/airScheManage?nowPage=${pageIndex }">${pageIndex}</a></li>
							</c:forEach>
							<li
								class="page-item <c:if test="${!searchVO.next }">disabled</c:if>">
								<a class="page-link"
								href="/admin/airScheManage?=${searchVO.endPage + 1 }">Next</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
	</div>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</body>
</html>