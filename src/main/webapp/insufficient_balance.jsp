<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insufficent Balance</title>

<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

</head>
<body>


<div class="nav-all">
		<header class="nav-all">
		  <nav>
			<ul class="nav-links">
			  <li class="nav-all"><a class="nav-all" href="index.jsp">Home</a></li>
			  <li><a class="nav-all" href="all_customers.jsp">Money Transfer</a></li>
			  <li><a class="nav-all current" href="all_transactions.jsp">Transaction History</a></li>
			</ul>
		  </nav>
		  <a href=""><button hidden class="contact">contact</button></a>
		</header>
	  </div>




<div class="text-center pt-5"><h1>You DO NOT have sufficient balance to perform this transaction.</h1></div>
<center><h5><a href="all_customers.jsp"> Click here to go back and enter right amount of money.</a></h5></center>
</body>
</html>