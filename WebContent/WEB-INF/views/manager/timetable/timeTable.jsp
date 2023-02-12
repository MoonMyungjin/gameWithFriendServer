<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<style scoped="scoped">
	@import url("<%=request.getContextPath() %>/resources/bootstrap/assets/css/style.css");
</style>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
	<!-- Font Awesome Icons -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">


<div class="cd-schedule cd-schedule--loading margin-top-xs margin-bottom-lg js-cd-schedule">
	<div class="cd-schedule__timeline">
		<ul>
			<li><span>16:00</span></li>
			<li><span>16:30</span></li>
			<li><span>17:00</span></li>
			<li><span>17:30</span></li>
			<li><span>18:00</span></li>
			<li><span>18:30</span></li>
			<li><span>19:00</span></li>
			<li><span>19:30</span></li>
			<li><span>20:00</span></li>
		</ul>
	</div> 
	<div class="cd-schedule__events">
		<ul>
			<li class="cd-schedule__group">
				<div class="cd-schedule__top-info"><span>Monday</span></div>
				<ul>
					<li class="cd-schedule__event">
						<a data-start="16:00" data-end="18:50" data-content="event-abs-circuit" data-event="event-1" href="#0">
							<em class="cd-schedule__name">수학</em>
						</a>
					</li>
					<li class="cd-schedule__event">
						<a data-start="19:00" data-end="19:50" data-content="event-rowing-workout" data-event="event-2" href="#0">
							<em class="cd-schedule__name">중3 사회</em>
						</a>
					</li>
				</ul>
			</li>
			<li class="cd-schedule__group">
				<div class="cd-schedule__top-info"><span>Tuesday</span></div>
				<ul>
					<li class="cd-schedule__event">
						<a data-start="16:00" data-end="18:50" data-content="event-yoga-1" data-event="event-3" href="#0">
							<em class="cd-schedule__name">중1 국어</em>
						</a>
					</li>
					<li class="cd-schedule__event">
						<a data-start="19:00" data-end="19:50" data-content="event-restorative-yoga" data-event="event-4" href="#0">
							<em class="cd-schedule__name">필수 영단어</em>
						</a>
					</li>
				</ul>
			</li>
			<li class="cd-schedule__group">
				<div class="cd-schedule__top-info"><span>Wednesday</span></div>
				<ul>
					<li class="cd-schedule__event">
						<a data-start="16:00" data-end="18:50" data-content="event-restorative-yoga" data-event="event-4" href="#0">
							<em class="cd-schedule__name">중3 영어</em>
						</a>
					</li>
					<li class="cd-schedule__event">
						<a data-start="19:00" data-end="19:50" data-content="event-yoga-5" data-event="event-3" href="#0">
							<em class="cd-schedule__name">국어특강</em>
						</a>
					</li>
				</ul>
			</li>
			<li class="cd-schedule__group">
				<div class="cd-schedule__top-info"><span>Thursday</span></div>
				<ul>
					<li class="cd-schedule__event">
						<a data-start="16:00" data-end="18:50" data-content="event-abs-circuit" data-event="event-1" href="#0">
							<em class="cd-schedule__name">수학</em>
						</a>
					</li>
				</ul>
			</li>
		<li class="cd-schedule__group">
			<div class="cd-schedule__top-info"><span>Friday</span></div>
			<ul>
				<li class="cd-schedule__event">
					<a data-start="16:00" data-end="18:50" data-content="event-restorative-yoga" data-event="event-4" href="#0">
						<em class="cd-schedule__name">중3 영어</em>
					</a>
				</li>
				<li class="cd-schedule__event">
					<a data-start="19:00" data-end="19:50" data-content="event-abs-circuit" data-event="event-1" href="#0">
						<em class="cd-schedule__name">확률의 이해</em>
					</a>
				</li>
			</ul>
		</li>
		<li class="cd-schedule__group">
			<div class="cd-schedule__top-info"><span>Saturday</span></div>
			<ul>
				<li class="cd-schedule__event">
					<a data-start="16:00" data-end="18:50" data-content="event-rowing-workout" data-event="event-2" href="#0">
						<em class="cd-schedule__name">중3 사회</em>
					</a>
				</li>
				<li class="cd-schedule__event">
					<a data-start="19:00" data-end="19:50" data-content="event-yoga-1" data-event="event-3" href="#0">
						<em class="cd-schedule__name">시 바로읽기</em>
					</a>
				</li>
			</ul>
		</li>
	</ul>
	</div>
	<div class="cd-schedule-modal">
	<header class="cd-schedule-modal__header">
	<div class="cd-schedule-modal__content">
	<span class="cd-schedule-modal__date"></span>
	<h3 class="cd-schedule-modal__name"></h3>
	</div>
	<div class="cd-schedule-modal__header-bg"></div>
	</header>
	<div class="cd-schedule-modal__body">
	<div class="cd-schedule-modal__event-info"></div>
	<div class="cd-schedule-modal__body-bg"></div>
	</div>
	<a href="#0" class="cd-schedule-modal__close text-replace">Close</a>
	</div>
	<div class="cd-schedule__cover-layer"></div>
</div> 
   
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/util.js"></script> 
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/main.js"></script>

<div class="demo-avd demo-avd-cf demo-avd--dark js-demo-avd" style="top: 30px; right: 30px; left: auto; bottom: auto;"></div>
<script src="../../assets/js/demo-avd.js?v=6"></script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-48014931-1', 'codyhouse.co');
    ga('set', 'anonymizeIp', true);
    ga('send', 'pageview');
</script>