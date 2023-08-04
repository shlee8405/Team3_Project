<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<style>
	.b{
		border: solid 1px black;
	}
</style>
<body>
    <h1>hello world</h1>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-sm-6 b">hi</div>
			<div class="col-md-3 col-sm-6 b">hi</div>
			<div class="col-md-3 col-sm-12 b">hi</div>
		</div>
		<div class="row">
			<div class="col-md-4 offset-md-4 b">hi</div>
			<div class="col-md-4 b">hi</div>
			</div>
	</div>
	
	<h1 class="display-1">hihihihihihi</h1>
	<kbd><kbd> 컨트롤 </kbd></kbd>
	
	<div class="container2">
		<div class="row2">
			<div class="col-md-4 b">
				<img class="img-fluid rounded-circle" src="/resources/img/Audi-R8.jpg">
			</div>
			<div class="col-md-4 b">
				<img class="img-fluid img-thumbnail" src="/resources/img/Audi-R8.jpg">
			</div>
			<div class="col-md-4 b">
				<img src="/resources/img/Audi-R8.jpg">
			</div>
		</div>
	</div>

	<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
    Launch demo modal
  </button>
  
  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          ...
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </div>
    </div>
  </div>



</body>
</html>