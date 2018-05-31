<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedReader"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#card{
	background-color: #FFF;
    margin: auto;
    padding: 1.5em;
    width: 40em;
    border-radius: 15px;
    box-shadow: 0px 3px 11px rgba(0, 0, 0, 0.13);
}
#first-m, #first-ch,#second-m,#second-ch,#word-m,#word-ch{
	display: inline;
}
</style>
</head>
<body>
<%

	BufferedReader reader=null;
	int i=0;
	String[] ch=new String[10];
	int n=0;
try{
	 String couponPath=application.getRealPath("/WEB-INF/question/learn.txt");
	
	  FileReader fr = new FileReader(couponPath); //파일읽기객체생성
       BufferedReader br = new BufferedReader(fr); //버퍼리더객체생성
       String line =null;
       String sText     = "";
       
       while ( (line = br.readLine()) != null ) {  
    	    //  out.println("라인단위 [" + line + " ] <br/><br/>");
    	    	if((line = br.readLine()) == null) break;
    	      ch[i]=line;
    	      sText = sText + line + "\n";  
    	      i++;
    	    }

    	   // out.println("전체단위 [" + sText + " ] ");
	  
     
     
     
}catch(Exception e) { 
	    System.out.println(e.toString()); //에러 발생시 메시지 출력
 }
%>
<div id="card">
	<div id="text">
		<div id="first-m">a</div>
		<div id="first-ch">b</div>
		<div id="second-m">c</div>
		<div id="second-ch">d</div>
		<div id="word-m">e</div>
		<div id="word-ch">f</div>
		<div id="mean">g</div>
	</div>
	<input type="button" id="prev" value="prev" onclick="prev()">
	<input type="button" id="next" value="next" onclick="next()">
</div>
<script>
var beforeStr = "<%=ch[n]%>";
var afterStr = beforeStr.split('/'); //슬래쉬를 기준으로 문자열 잘라서 배열에 넣기
var firstM = document.getElementById("first-m"); //첫 번째 한자의 뜻
var firstCh = document.getElementById("first-ch"); //첫 번째 한자의 글자
var secondM = document.getElementById("second-m"); //두 번째 한자의 뜻
var secondCh = document.getElementById("second-ch"); //두 번째 한자의 글자
var wordM = document.getElementById("word-m"); //결합된 한자의 뜻
var wordCh = document.getElementById("word-ch"); //결합된 한자의 글자
var mean = document.getElementById("mean"); //뜻

	function prev(){
		var num="<%= n %>";
		if(num==0)return;
		//n--;
		beforeStr = "<%=ch[n]%>";
		afterStr = beforeStr.split('/');
		firstM.innerHTML=afterStr[0];
		firstCh.innerHTML=afterStr[1];
		secondM.innerHTML=afterStr[2];
		secondCH.innerHTML=afterStr[3];
		wordM.innerHTML=afterStr[4];
		wordCh.innerHTML=afterStr[5];
		mean.innerHTML=afterStr[6];
	}
	function next(){
		var num="<%= n %>";
		if(num==10)return;
		//n++;
		beforeStr = "<%=ch[n]%>";
		afterStr = beforeStr.split('/');
		//alert(afterStr[0]);
		//jsp배열을 받아 자바스크립트에서 배열에 넣기
		firstM.innerHTML=afterStr[0];
		firstCh.innerHTML=afterStr[1];
		secondM.innerHTML=afterStr[2];
		secondCh.innerHTML=afterStr[3];
		wordM.innerHTML=afterStr[4];
		wordCh.innerHTML=afterStr[5];
		mean.innerHTML=afterStr[6];
	}
</script>
</body>
</html>
