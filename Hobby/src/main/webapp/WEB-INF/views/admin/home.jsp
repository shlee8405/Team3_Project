<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 홈</title>

<style type="text/css">

main {
    display:flex;
    flex-direction: row;
}


.sidebar-link {
color:#ffffff!important;

}

</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

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
<script
src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
</script>
</head>
<body>
<main>
    <!-- SIDEBAR -->
  


<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

main {
    display:flex;
    flex-direction: row;
}


.sidebar-link {
color:#ffffff!important;

}


</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

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
    <!-- SIDEBAR -->
   	<jsp:include page="sidebar.jsp" />



    <div class="container"  style="width: 85%; background-color: white">
        <div class="row mt-3" style=" box-shadow: 0px 5px 2px rgba(0, 0, 0, 0.25);
        border-radius: 10px;background-color: rgba(0, 0, 0, 0.11);  margin-left:10%; width:80%; height:30%;">
            <div class="col " style="height: 100%;">
                <div style="width: 300px!important; flex-direction: row; display: flex; " class="mt-4" >
                    <canvas id="myChart" style="width: 300px; max-width: 350px;  height:250px; background-color: rgba(255,255,255,0.7);"></canvas>
                    <div style=""><button class="ms-5" style=" width:100%; height: 100%;background-color: white ;   border:0px; border-radius: 10px;">four</button></div>
                </div>
                <div></div>
            </div>
        </div>
        <div class="row mt-3" style=" box-shadow: 0px 5px 2px rgba(0, 0, 0, 0.25);
        border-radius: 10px;background-color: rgba(0, 0, 0, 0.11);  margin-left:10%; width:80%; height:30%;">
            <div class="col " style="height: 100%;">
                <button class="ms-3 mt-3 mb-1" style="background-color: white ; height: 85%; width: 30%; border:0px; border-radius: 10px;">four</button>
                <button class="ms-3 mt-3 mb-1" style="background-color: white ; height: 85%; width: 30%; border:0px; border-radius: 10px;">five</button>
                <button class="ms-3 mt-3 mb-1" style="background-color: white ; height: 85%; width: 30%; border:0px; border-radius: 10px;">six</button>
            </div>
        </div>
        <div class="row mt-3" style=" box-shadow: 0px 5px 2px rgba(0, 0, 0, 0.25);
        border-radius: 10px;background-color: rgba(0, 0, 0, 0.11);  margin-left:10%; width:80%; height:30%;">
            <div class="col " style="height: 100%;">
                <button class="ms-3 mt-3 mb-1" style="background-color: white ; height: 85%; width: 30%; border:0px; border-radius: 10px;">one</button>
                <button class="ms-3 mt-3 mb-1" style="background-color: white ; height: 85%; width: 30%; border:0px; border-radius: 10px;">two</button>
                <button class="ms-3 mt-3 mb-1" style="background-color: white ; height: 85%; width: 30%; border:0px; border-radius: 10px;">three</button>
            </div>
        </div>
    </div>


 

   
<script>
   const xValues = [100,200,300,400,500,600,700,800,900,1000];

new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: [{
      data: [860,1140,1060,1060,1070,1110,1330,2210,7830,2478],
      borderColor: "red",
      fill: false
    },{
      data: [1600,1700,1700,1900,2000,2700,4000,5000,6000,7000],
      borderColor: "green",
      fill: false
    },{
      data: [300,700,2000,5000,6000,4000,2000,1000,200,100],
      borderColor: "blue",
      fill: false
    }]
  },
  options: {
    legend: {display: false}
  }
});
    </script>

</main>

</body>
</html>