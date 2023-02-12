<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>성적 분석</title>

<head>
	<style>
		* {
			font-size: 14px;
		}
	</style>
</head>

<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>성적 피드백</h1>
				</div>
			</div>
		</div>
	</section>
	
	<section class="content">
		<div class="container-fluid">
			<div class="row">
			
				<div class="col-sm-12">
					<div class="card card-dark card-outline">
					
						<div class="card-header">
							<h3 class="card-title">
								<i class="fas fa-comment-dots"></i>
								&nbsp;
								난이도 별 피드백
							</h3>
							<div class="card-tools" style="padding: 3px;">
							<div class="input-group input-group-sm">
								<div class="input-group">
									<button type="button" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
										저장
									</button>
								</div>
							</div>
						</div>
						</div>
						
						<div class="card-body"  style="padding: 10px;">
							<div class="row">
								<div class="col-sm-12">
									<div class="card card-warning card-outline">
										<div class="card-header">
											<h3 class="card-title">
												상 - 3 / 5
											</h3>
										</div>
										<div class="card-body"  style="padding: 0;">
											<input class="form-control" value="심화 문제풀이에 대한 스킬이 부족해보입니다.">
										</div>
									</div>
								</div>
								<div class="col-sm-12">
									<div class="card card-warning card-outline">
										<div class="card-header">
											<h3 class="card-title">
												중 - 3 / 5
											</h3>
										</div>
										<div class="card-body"  style="padding: 0;">
											<input class="form-control" value="문제 응용능력 수준이 보통수준입니다.">
										</div>
									</div>
								</div>
								<div class="col-sm-12">
									<div class="card card-warning card-outline">
										<div class="card-header">
											<h3 class="card-title">
												하 - 10 / 10
											</h3>
										</div>
										<div class="card-body"  style="padding: 0;">
											<input class="form-control" value="기초 문제풀이 능력이 매우 탁월합니다.">
										</div>
									</div>
								</div>
							</div>
							
						</div>
						
					</div>
				</div>
				
				<div class="col-sm-12">
					<div class="card card-dark card-outline">
					
						<div class="card-header">
							<h3 class="card-title">
								<i class="fas fa-comment-dots"></i>
								&nbsp;
								영역 별 피드백
							</h3>
							<div class="card-tools" style="padding: 3px;">
								<div class="input-group input-group-sm">
									<div class="input-group">
										<button type="button" class="btn btn-dark" style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;">
											저장
										</button>
									</div>
								</div>
							</div>
						</div>
						
						<div class="card-body" style="padding: 10px;">
							<div class="row">
							
								<div class="col-sm-12">
									<div class="card card-info card-outline">
										<div class="card-header">
											<h3 class="card-title">
												영역1 - 4 / 4
											</h3>
										</div>
										<div class="card-body"  style="padding: 0;">
											<input class="form-control" placeholder="피드백을 작성해주세요.">
										</div>
									</div>
								</div>
								<div class="col-sm-12">
									<div class="card card-info card-outline">
										<div class="card-header">
											<h3 class="card-title">
												영역2 - 2 / 4
											</h3>
										</div>
										<div class="card-body"  style="padding: 0;">
											<input class="form-control" placeholder="피드백을 작성해주세요.">
										</div>
									</div>
								</div>
								<div class="col-sm-12">
									<div class="card card-info card-outline">
										<div class="card-header">
											<h3 class="card-title">
												영역3 - 3 / 4
											</h3>
										</div>
										<div class="card-body"  style="padding: 0;">
											<input class="form-control" placeholder="피드백을 작성해주세요.">
										</div>
									</div>
								</div>
								<div class="col-sm-12">
									<div class="card card-info card-outline">
										<div class="card-header">
											<h3 class="card-title">
												영역4 - 4 / 4
											</h3>
										</div>
										<div class="card-body"  style="padding: 0;">
											<input class="form-control" placeholder="피드백을 작성해주세요.">
										</div>
									</div>
								</div>
								<div class="col-sm-12">
									<div class="card card-info card-outline">
										<div class="card-header">
											<h3 class="card-title">
												영역5 - 3 / 4
											</h3>
										</div>
										<div class="card-body"  style="padding: 0;">
											<input class="form-control" placeholder="피드백을 작성해주세요.">
										</div>
									</div>
								</div>
								
							</div>
						</div>
						
					</div>
				</div>
				
				<div class="col-sm-12">
					<button type="submit" class="btn btn-warning" onclick="history.go(-1);">
					이전으로 돌아가기
					</button>
					<button type="submit" class="btn btn-dark float-right" onclick="location.href='/manager/score/gradeCheck.do';">
					목록으로 돌아가기
					</button>
				</div>
				
			</div>
		</div>
	</section>