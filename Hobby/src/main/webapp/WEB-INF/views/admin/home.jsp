<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
body {
	padding-top: 80px;
}

#sidebar {
	position: fixed;
	top: 50px;
	left: 220px;
	width: 220px;
	margin-left: -220px;
	border: none;
	border-radius: 0;
	overflow-y: auto;
	background-color: #222;
	bottom: 0;
	overflow-x: hidden;
	padding-bottom: 40px;
}

.side-bar>li>a {
	color: #eee;
	width: 220px;
}

.side-bar li a:hover, .side-bar li a:focus {
	background-color: #092A00;
}

#sidebar .side-bar > li:hover > a {
    background-color: #092A00;
    color: white;
    font-weight: bold;
}

.tmargin {
	margin-top: 15px;
}

navbar {
	color: white;
}
</style>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.2.3/animate.min.css">
<!--
<link rel="stylesheet" href="resources/css/styles.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
		 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


<script type="text/javascript">
	function go_admin() {
		location.href = "/adminHome.do"
	}

	function go_adminUser() {
		location.href = "/adminUser.do"
	}

	function go_adminGroup() {
		location.href = "/adminGroup.do"
	}

	function go_adminQNA() {
		location.href = "/adminQNA.do"
	}

	function go_adminReport() {
		location.href = "/adminReport.do"
	}

	function go_home() {
		location.href = "/home.do"
	}
</script>
</head>
<body>


	<nav class="navbar navbar-inverse navbar-fixed-top"
		style="background-color: #0F4200;">
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/">관리자 홈</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-user">&nbsp;</span>Hello
							Admin</a></li>
					<li class="active"><a title="View Website" href="#"><span
							class="glyphicon glyphicon-globe"></span></a></li>
					<li><a href="#">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav> 
	
	
	<div class="container-fluid" >
		<div class="col-md-3" >

			<div id="sidebar"  style="background-color: #0F4200;" >
				<div class="container-fluid tmargin" >
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search..." />
						<span class="input-group-btn">
							<button class="btn btn-default">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
				</div>

				<ul class="nav navbar-nav side-bar" >
					<li class="side-bar tmargin"><a href="#"><span
							class="glyphicon glyphicon-list">&nbsp;</span>대쉬보드</a></li>
					<li class="side-bar"><a href="#"><span
							class="glyphicon glyphicon-flag">&nbsp;</span>Purok</a>
						<li class="side-bar dropdown">
						    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
						        <span class="glyphicon glyphicon-flag">&nbsp;</span>Purok <span class="caret"></span>
						    </a>
						    <ul class="dropdown-menu" role="menu">
						        <li><a href="#">Button 1</a></li>
						        <li><a href="#">Button 2</a></li>
						        <li><a href="#">Button 3</a></li>
						    </ul>
						</li>		
					<li class="side-bar"><a href="#"><span
							class="glyphicon glyphicon-star">&nbsp;</span>Blotter</a></li>
					<li class="side-bar"><a href="#"><span
							class="glyphicon glyphicon-certificate">&nbsp;</span>Officials</a></li>

					<li class="side-bar"><a href="#"><span
							class="glyphicon glyphicon-signal">&nbsp;</span>Statistics</a></li>
					<li class="side-bar"><a href="#"><span
							class="glyphicon glyphicon-cog">&nbsp;</span>Settings</a></li>

				</ul>
			</div>
		</div>
		
		<div class="col-md-9 animated bounce">
			<h1 class="page-header">Dashboard</h1>
			<ul class="breadcrumb">
				<li><span class="glyphicon glyphicon-home">&nbsp;</span>Home</li>
				<li><a href="#">Dashboard</a></li>
			</ul>
			<table class="table table-hover">
				<thead>
					<th>&nbsp;</th>
					<th class="text-center">#</th>
					<th>Title</th>
					<th class="text-center">Author</th>
					<th>Status</th>

				</thead>
				<tbody>
					<!--
          <tr>
            <td><input type="checkbox" /></td>
            <td class="text-center">1</td>
            <td width="70%">Lorem ipsum dolor sit amet, consectetur adipisicing elit...</td>
            <td class="text-center" width="10%">Admin</td>
            <td><span class="label label-info">Pending</span></td>
          </tr>
-->
					<!-- START CONTENT END -->
					<tr>
						<td><input type="checkbox" /></td>
						<td class="text-center">1</td>
						<td width="70%">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit...</td>
						<td class="text-center" width="10%">Admin</td>
						<td><span class="label label-info"><span
								class="glyphicon glyphicon-time">&nbsp;</span>Pending</span></td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td class="text-center">1</td>
						<td width="70%">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit...</td>
						<td class="text-center" width="10%">Admin</td>
						<td><span class="label label-success"><span
								class="glyphicon glyphicon-ok-sign">&nbsp;</span>Live</span></td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td class="text-center">1</td>
						<td width="70%">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit...</td>
						<td class="text-center" width="10%">Admin</td>
						<td><span class="label label-success"><span
								class="glyphicon glyphicon-ok-sign">&nbsp;</span>Live</span></td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td class="text-center">1</td>
						<td width="70%">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit...</td>
						<td class="text-center" width="10%">Admin</td>
						<td><span class="label label-success"><span
								class="glyphicon glyphicon-ok-sign">&nbsp;</span>Live</span></td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td class="text-center">1</td>
						<td width="70%">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit...</td>
						<td class="text-center" width="10%">Admin</td>
						<td><span class="label label-success"><span
								class="glyphicon glyphicon-ok-sign">&nbsp;</span>Live</span></td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td class="text-center">1</td>
						<td width="70%">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit...</td>
						<td class="text-center" width="10%">Admin</td>
						<td><span class="label label-success"><span
								class="glyphicon glyphicon-ok-sign">&nbsp;</span>Live</span></td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td class="text-center">1</td>
						<td width="70%">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit...</td>
						<td class="text-center" width="10%">Admin</td>
						<td><span class="label label-success"><span
								class="glyphicon glyphicon-ok-sign">&nbsp;</span>Live</span></td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td class="text-center">1</td>
						<td width="70%">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit...</td>
						<td class="text-center" width="10%">Admin</td>
						<td><span class="label label-success"><span
								class="glyphicon glyphicon-ok-sign">&nbsp;</span>Live</span></td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td class="text-center">1</td>
						<td width="70%">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit...</td>
						<td class="text-center" width="10%">Admin</td>
						<td><span class="label label-success"><span
								class="glyphicon glyphicon-ok-sign">&nbsp;</span>Live</span></td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td class="text-center">1</td>
						<td width="70%">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit...</td>
						<td class="text-center" width="10%">Admin</td>
						<td><span class="label label-success"><span
								class="glyphicon glyphicon-ok-sign">&nbsp;</span>Live</span></td>
					</tr>

					<!-- DUMP CONTENT END -->

				</tbody>

			</table>
		</div>
	</div>



</body>
</html>