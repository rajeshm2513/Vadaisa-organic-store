<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.net.URLEncoder" %>

<%
String amount = request.getParameter("amount");

// 🔴 Replace this with YOUR real UPI ID
String upiId = "7993647922@ibl";

String upi = "upi://pay?pa=" + upiId +
             "&pn=VadasiStore" +
             "&am=" + amount +
             "&cu=INR";

String qrURL = "https://api.qrserver.com/v1/create-qr-code/?size=300x300&data="
               + URLEncoder.encode(upi, "UTF-8");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Vedaisa Payment</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
  background:#f1f3f6;
  font-family:"Poppins",sans-serif;
}

.qr-card{
  max-width:420px;
  margin:70px auto;
  background:white;
  border-radius:15px;
  box-shadow:0 10px 25px rgba(0,0,0,.15);
  overflow:hidden;
}

.qr-header{
  background:#2e7d32;
  color:white;
  padding:20px;
  text-align:center;
}

.qr-body{
  padding:30px;
  text-align:center;
}

.amount{
  font-size:26px;
  font-weight:700;
  color:#2e7d32;
}

.qr-img{
  margin:20px 0;
  padding:15px;
  border-radius:10px;
  border:2px dashed #2e7d32;
}

.confirm-btn{
  background:#2e7d32;
  color:white;
  border:none;
  padding:12px 20px;
  width:100%;
  border-radius:8px;
  font-size:16px;
  transition:.3s;
}

.confirm-btn:hover{
  background:#1b5e20;
}
</style>
</head>

<body>

<div class="qr-card">
  <div class="qr-header">
    <h3>Vedaisa Payment</h3>
    <p class="mb-0">Scan & Pay via UPI</p>
  </div>

  <div class="qr-body">
    <p>Total Amount</p>
    <div class="amount">₹ <%= amount %></div>

    <div class="qr-img">
      <img src="<%= qrURL %>" width="220">
    </div>

    <p class="text-muted">
      Open GPay, PhonePe, Paytm or any UPI app and scan this QR
    </p>

    <a href="success.html">
      <button class="confirm-btn">I Have Paid</button>
    </a>
  </div>
</div>

</body>
</html>
