<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>GYM CARRY : 캐리 마이페이지</title>

<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<link rel="stylesheet" href="/gym/css/mypage/carrymypage.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 캘린더 -->
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

<style>
#allsave {
	width: 130px;
	height: 40px;
	background-color: #2C3E50;
	color: white;
	cursor: pointer;
	border-radius: 15%;
	margin: auto 10px;
}
</style>
</head>
<script>
   function readInputFile(input) {
      if (input.files && input.files[0]) {
         var reader = new FileReader();
         reader.onload = function(e) {
            $('#main').html("<img src="+ e.target.result +">");
         }
         reader.readAsDataURL(input.files[0]);
      }
   };
</script>
<body>
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>


	<div class="container">
		<div class="main">
			<!-- <p>바탕색은 구분을 위한 임시배경색입니다</p> -->
			<!-- <img src="/images/icon/profile.png"><br> -->
			<img src="<c:url value="/uploadfile/${CRPHOTO}"/>" class="profile">
			<div class="nameline">
				<!-- 정렬을 위해 왼쪽에 숨겨둘 것 -->
				<button class="edit1" type="button" onclick></button>
				<!-- 여기까지 -->
				<h3 class="title">${crname}</h3>
				<a href="/gym/carry/modify"> <img
					src="<c:url value="/images/icon/edit.png"/>" class="edit2">
				</a>
				<!-- 달력 DB 저장 버튼 -->
				<button type="button" id="allsave">달력 일정
					저장하기</button>
					<!-- <!-- <button id="allsave" onclick="javascript:allSave();">달력 일정
					저장하기</button> -->
			</div>
			<!-- calendar 태그 -->
			<div id="calendar_container">
				<div id="calendar"></div>
			</div>

		</div>


		<div class="second-line">
			<div class="modi-list">
				<h3>My Page</h3>
				<ul>
					<li><a href="/gym/carry/modify">기본 정보 수정</a> <!-- <a href="<c:url value="/"/>"> -->
					</li>
					<br>
					<li><a href="/gym/mypage/carrymodify">캐리 정보
							수정</a> <!-- <a href="<c:url value="/"/>"> --></li>
					<br>
					<li><a href="/gym/mypage/carrymypage/mymember">내
							회원 리스트</a> <!-- <a href="<c:url value="/"/>"> --></li>
					<br>
				</ul>
			</div>

			<div class="today-schedule">
				<li>
					<h3>오늘의 일정</h3> <a class="insert" href="#"><img
						src="<c:url value="/images/icon/edit.png"/>"></a>
				</li>
			</div>
		</div>
	</div>
	<!-- Contents end -->


	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
	<script>
crname = $("#crname");
</script>

<script>
$("#allsave").click(function(){
	
	 var arr = allSave();
	 
	 var arr = [];
	 $.each(arr, function(index, events){
	  calendar.addEvent( events );
	 });
	 calendar.render();
	});

</script>


<script>


var calendarEl = null;
var calendar = null;


	(function() {
		$(function() {
			// calendar element 취득
			calendarEl = $('#calendar')[0];
			// full-calendar 생성하기
			calendar = new FullCalendar.Calendar(calendarEl, {
				height : '700px', // calendar 높이 설정
				expandRows : true, // 화면에 맞게 높이 재설정
				slotMinTime : '08:00', // Day 캘린더에서 시작 시간
				slotMaxTime : '20:00', // Day 캘린더에서 종료 시간
				// 해더에 표시할 툴바
				headerToolbar : {
					left : 'prev,next today',
					center : 'title',
					right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
				},
				initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
				navLinks : true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
				editable : true, // 수정 가능 여부
				selectable : true, // 달력 일자 드래그 설정가능
				nowIndicator : true, // 현재 시간 마크
				dayMaxEvents : true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
				locale : 'ko', // 한국어 설정
				//Boolean: true,
				groupId : $('cridx'),
				
				eventAdd : function(obj) { // 이벤트가 추가되면 발생하는 이벤트
					console.log(obj);
				},
				eventChange : function(obj) { // 이벤트가 수정되면 발생하는 이벤트
					console.log(obj);
				},
				//Logic for clicking on an event
			     eventClick: function(event_click){
			    	console.log("이벤트 클릭 : " + event_click.event);
			      alert('선택하신 일정을 삭제합니다.'),
			      //Remove event from calendar
				  event_click.event.remove()
				},
				/*  eventRemove : function(eventClick) { // 이벤트가 삭제되면 발생하는 이벤트
					 console.log("이벤트 클릭 : " + event_click.title);
					 alert('['+eventClick.title + '] 일정을 삭제합니다.'),
					 eventClick.remove()
				}, */
			
				select : function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
					var title = prompt('일정을 입력해주세요:');
					if (title) {
						calendar.addEvent({
							title : title,
							start : arg.start,
							end : arg.end,
							allDay : arg.allDay
						})
					}
					calendar.unselect()
				},
			// 이벤트 
			events : [

				$.ajax({
					type : 'get',
					url : '<c:url value="/mypage/scheduleview"/>',
					data: {},
					success : function(schelist){
						console.log(schelist);
						 for(i=0; i<schelist.length; i++){
							calendar.addEvent({
								title : schelist[i]['title'],
								allday : schelist[i]['allday'],
								start : schelist[i]['start'],
								end : schelist[i]['end']
							})
						}
					}
				})
			]
			});
			// 캘린더 랜더링
			calendar.render();
		});
		
	})();
	

	
	// 1. 전체 이벤트 데이터 추출하기
	// 2. 추출된 데이터를 ajax로 서버에 전송 -> DB에 저장
	function allSave(){
		
		//calendar.getEventSourceById( id )
	
		var allEvent = calendar.getEvents();
		//var allEvent = calendar.getEventSourceById(groupId);
		console.log("allEvent1 : " + allEvent);
		
		var events = new Array();
		for(var i=0; i < allEvent.length; i++){
			
			var obj = new Object();
			
			//obj.groupId = allEvent[i]._def.groupId; // 로그인한 캐리 인덱스 
			obj.title = allEvent[i]._def.title; // 일정 명칭 
			obj.allday = allEvent[i]._def.allDay; // 일정 기간이 하루종일 or 시간제인지 boolean 타입(true/false)
			obj.start = allEvent[i]._instance.range.start; // 일정 시작 날짜 및 시간
			obj.end = allEvent[i]._instance.range.end; // 일정 종료 날짜 및 시간
			
			events.push(obj);
			console.log("events : " + events);
			console.log("obj : "+obj);
		}
		 var jsondata = JSON.stringify(events);
		
		savedata(jsondata);
	}
	
	 function savedata(jsondata){
		 
		$.ajax({
			type : 'post',
			url : '<c:url value="/mypage/schedule"/>',				
			data: jsondata,
			dataType :'text',
			accept: "application/json",
			contentType: "application/json",
			async : false
		}).done(function(result){
			console.log(result)
		})
		.fail(function(error){
            console.log(error);
        });// 실패했을 때 실행 *
		console.log("data : " + jsondata);
	} 
	
	
</script>
 
