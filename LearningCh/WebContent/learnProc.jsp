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
       
       while ( (line = br.readLine()) != null ) {  
    	      ch[i]=line;
    	      i++;
    	    }
	  
     
     
     
}catch(Exception e) { 
	    System.out.println(e.toString()); //에러 발생시 메시지 출력
 }
%>
<div id="card" hidden>
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
<p id="learn-text">시작하기 버튼을 눌러 한자 학습을 시작해볼까요?</p><br>
<input type="button" id="show-card-btn" value="시작하기" onclick="showCard()">
<script>
var tmpArr = new Array();

<%
for(int j=0;j<10;j++){%>
tmpArr[<%=j%>]='<%=ch[j]%>';
<%}
%>
</script>
<script>

var num=0;
var beforeStr;
var afterStr;
var firstM = document.getElementById("first-m"); //첫 번째 한자의 뜻
var firstCh = document.getElementById("first-ch"); //첫 번째 한자의 글자
var secondM = document.getElementById("second-m"); //두 번째 한자의 뜻
var secondCh = document.getElementById("second-ch"); //두 번째 한자의 글자
var wordM = document.getElementById("word-m"); //결합된 한자의 뜻
var wordCh = document.getElementById("word-ch"); //결합된 한자의 글자
var mean = document.getElementById("mean"); //뜻

function showCard(){
	var card = document.getElementById("card");
	var btn = document.getElementById("show-card-btn");
	var txt = document.getElementById("learn-text");
	card.style.display = 'block';
	btn.style.display = 'none';
	txt.style.display = 'none';
	
	beforeStr = tmpArr[num];
	afterStr = beforeStr.split('/'); //슬래쉬를 기준으로 문자열 잘라서 배열에 넣기
	firstM.innerHTML=afterStr[0]; //첫 번째 한자의 뜻
	firstCh.innerHTML=afterStr[1]; //첫 번째 한자의 글자
	secondM.innerHTML=afterStr[2]; //두 번째 한자의 뜻
	secondCh.innerHTML=afterStr[3]; //두 번째 한자의 글자
	wordM.innerHTML=afterStr[4]; //결합된 한자의 뜻
	wordCh.innerHTML=afterStr[5]; //결합된 한자의 글자
	mean.innerHTML=afterStr[6]; //뜻
	num++;

}

function prev(){
	if(num<0)return;

	//alert("뒤로!!"+num);
	if(num==0) beforeStr = tmpArr[num];
	else beforeStr = tmpArr[num--];
	afterStr = beforeStr.split('/');
	firstM.innerHTML=afterStr[0];
	firstCh.innerHTML=afterStr[1];
	secondM.innerHTML=afterStr[2];
	secondCh.innerHTML=afterStr[3];
	wordM.innerHTML=afterStr[4];
	wordCh.innerHTML=afterStr[5];
	mean.innerHTML=afterStr[6];
}
function next(){
	// alert("앞으로"+num);
	if(num>9)return;
	if(num==9) beforeStr = tmpArr[num];
	else beforeStr = tmpArr[num++];
	afterStr = beforeStr.split('/');
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
