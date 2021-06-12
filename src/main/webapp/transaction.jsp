<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.entities.Customer"%>
<%@page import="org.hibernate.Session"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transaction</title>






<script type="text/javascript">

	function validate(){
		var amt = document.myForm.send_amt.value;
		if(amt<=0){
			alert("Enter correct value in amount");
			document.myForm.send_amt.focus();
			return false;
		}
		
	}
</script>








<link rel="stylesheet" type="text/css" href="Tables/vendor/bootstrap/css/bootstrap.min.css">

	<link rel="stylesheet" type="text/css" href="css/main.css">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

</head>
<body>



	
    <div class="nav-all">
		<header class="nav-all">
		  <nav>
			<ul class="nav-links">
			  <li class="nav-all"><a class="nav-all" href="index.jsp">Home</a></li>
			  <li><a class="nav-all current" href="all_customers.jsp">Money Transfer</a></li>
			  <li><a class="nav-all" href="all_transactions.jsp">Transaction History</a></li>
			</ul>
		  </nav>
		  <a href=""><button hidden class="contact">contact</button></a>
		</header>
	  </div>    







<form name="myForm" action="MoneyTransfer"  method="post">
<div class="limiter">
		<div class="container-table100 less-vh">
			<div class="wrap-table100">
			  <center>
                    <h2 class="mb-3">Account Holder details</h2>
                </center>
				<div class="table100 ver1 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1" style="width: 28%;">Id</th>
									<th class="cell100 column2" style="width: 20%;">Name</th>
									<th class="cell100 column3">E-mail</th>
									<th class="cell100 column4">Amount</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
			
							
							
	<tr class="row100 body">
	<td class="cell100 column1"><input style="border:none;" name="id" value=${id}></td>
	<td class="cell100 column2"><input style="border:none;" name="name" value=${name}></td>
	<td class="cell100 column3"><input style="border:none;" name="email" value=${email}></td>
	<td class="cell100 column4"><input style="border:none;" name="balance" value=${balance}></td>
									
	</tr>
								
							</tbody>
						</table>
					</div>
				</div>
				
				</div>
			</div>
		</div>
	</div>



	
<div class="text-center">

<h3 class="mb-3">Choose an account to transfer money</h3>
<center><select id="select-blank" name = "receiver" required="" style="max-width: 500px;" class="form-select"></center>


</div>
		<%
    Session s = FactoryProvider.getFactory().openSession();
    
    Query q = s.createQuery("from Customer");
    List<Customer> list = q.list();
    for(Customer cus:list)
    {
    	if(cus.getId()!=(int)request.getAttribute("id"))
    	{
    %>

 
<option value=<%= cus.getId()%>,<%= cus.getName()%>,<%= cus.getEmail()%>,<%= cus.getBalance()%> >
 Account Number: <%= cus.getId()%> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Name: <%= cus.getName()%> </option>
 <%
    	}
    }
    
    s.close();
    %>


</select>
	<div>
					<label for="send_amt" class="mt-4"><h4>Enter amount</h4></label>
					<div style="max-width: 250px;" class="form-group">
						<input class="form-control" required name="send_amt" type="number">
					</div>
				</div>


	<button class="btn btn-outline-success mt-3"
				onClick="return validate();" type="submit">Confirm</button>
				
			

</form>








</body>
</html>