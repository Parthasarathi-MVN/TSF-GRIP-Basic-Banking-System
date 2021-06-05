<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.entities.Customer"%>
<%@page import="com.entities.Transfer"%>
<%@page import="org.hibernate.Session"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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







    
    <div class="limiter">
		<div class="container-table100" style="padding:0;">
		
			<div class="wrap-table100">
			<h1 class="">All Transactions</h1>
				<div class="table100 ver1 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">S No.</th>
									<th class="cell100 column2">Amount</th>
									<th class="cell100 column3">From</th>
									<th class="cell100 column4">To</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
							
							
	<%
    Session s = FactoryProvider.getFactory().openSession();
    
    Query q = s.createQuery("from Transfer");
    List<Transfer> list = q.list();
    for(Transfer trs:list)
    {
    %>
							
							
	<tr class="row100 body">
	<td class="cell100 column1"><%= trs.getId()%></td>
	<td class="cell100 column2"><%= trs.getTransfer_amt()%></td>
	<td class="cell100 column3"><%= trs.getFrom_acc()%></td>
	<td class="cell100 column4"><%= trs.getTo_acc()%></td>

	</tr>

								
								
    <%
    
    }
    
    s.close();
    %>

								

								
							</tbody>
						</table>
					</div>
				</div>
				
				</div>
			</div>
		</div>
	</div>


<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function(){
				ps.update();
			})
		});
			
		
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
    
    
    








</body>
</html>