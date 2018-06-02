<html>
 <head>
 <meta charset="UTF-8">
<title>하루한자</title>
 <style>
html, body{
	width: 100%;
	height: 100%;
}
body{
	display: table;
}
#content {
	height: 90%;
	background-color: #EEEEEE;
}
table {
	margin: 0 auto;
	height: 100%;
	width: 100%;
}
 </style>
 </head>
 <body>
 <!--  templateTest.jsp     URL에 표시되는 내용은 main.jsp이다 -->
 
<table border=0 >
 	<tr>
 		<td>
 			<jsp:include page="logo.jsp" flush="false"/>
 		</td>
 	</tr>
 	<tr>
 		<td>
 			<jsp:include page="top.jsp" flush="false"/>
 		</td>
 	</tr>
 	<tr>
 		<td valign="top" id="content">
 			<jsp:include page="<%=contentpage%>"></jsp:include>
 		</td>
 	</tr>
 	<tr>
 		<td id="foot">
 			<jsp:include page="bottom.jsp" flush="false"/>
 		</td>
 	</tr>
 </table>
 
 </body>
 </html>