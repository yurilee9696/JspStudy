<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedReader"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
<style>
#quiz-box{
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  height: 100%;
	  width:100%;
	}
#quiz-box>div{
	width: 100%;
	max-width: 46em;
}
#card, #answer,#drop-first, #drop-second{
	background-color: #FFF;
    margin: auto;
    width: 40em;
    padding:1.5em;
    border-radius: 15px;
    box-shadow: 0px 3px 11px rgba(0, 0, 0, 0.13);
    text-align: center;
}
#card,#drop-first, #drop-second{
	width: 10em;
	height: 10em;
	margin-right: 2em;
	float: left;
	display: inline-block;
	
}
#drop-first div, #drop-second div{
font-size: 4em;
}
#card{
	margin-right: 0em;
}
#first-m, #first-ch,#second-m,#second-ch,#word-m,#word-ch{
	display: inline;
	font-size: 2em;
}
#word-m{
	text-align: center;
	margin: 0 auto;
}
#answer{
	width: 90%;
}
#answer div{
	font-size: 2em;
	display: inline;
	margin: 0.5em;
	cursor: pointer;
}
#box{
	width: 95%;
	margin: 0 auto;
	height: auto;
	min-height: 15em;
	max-height: 100%;
}

#button-box{
	text-align: center;
}
.sim-button{
	line-height: 50px;
	text-align: center;
	margin: auto;
	margin-top: 2em;
	width: 8em;
	cursor: pointer;
	background-color: #88ACFF;
	box-shadow: 0px 3px 11px rgba(0, 0, 0, 0.13);
	outline: none;
}
.button1 {
	color: #FFF;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
	position: relative;
	border: 1px solid #88ACFF;
	font-size: 1em;
}
.button1:hover {
	background-color: #FFF;
	-webkit-border-radius: 25px;
	-moz-border-radius: 25px;
	border-radius: 25px;	
	color: #88ACFF;
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

<div id="quiz-box">
	<div>
		<div id="box">
			<div id="drop-first" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
			<div id="drop-second" ondrop="drop(event)" ondragover="allowDrop(event)"></div>
			<div id="card">
				<div id="text">
					<div id="word-m">e</div>
				</div>
			</div>
		</div>
		<div id="answer" ondrop="drop(event)" ondragover="allowDrop(event)">
			<div id="d1" draggable="true" ondragstart="drag(event)"></div>
			<div id="d2" draggable="true" ondragstart="drag(event)"></div>
			<div id="d3" draggable="true" ondragstart="drag(event)"></div>
			<div id="d4" draggable="true" ondragstart="drag(event)"></div>
			<div id="d5" draggable="true" ondragstart="drag(event)"></div>
			<div id="d6" draggable="true" ondragstart="drag(event)"></div>
			<div id="d7" draggable="true" ondragstart="drag(event)"></div>
			<div id="d8" draggable="true" ondragstart="drag(event)"></div>
			<div id="d9" draggable="true" ondragstart="drag(event)"></div>
			<div id="d10" draggable="true" ondragstart="drag(event)"></div>
			<div id="d11" draggable="true" ondragstart="drag(event)"></div>
			<div id="d12" draggable="true" ondragstart="drag(event)"></div>
			<div id="d13" draggable="true" ondragstart="drag(event)"></div>
			<div id="d14" draggable="true" ondragstart="drag(event)"></div>
			<div id="d15" draggable="true" ondragstart="drag(event)"></div>
			<div id="d16" draggable="true" ondragstart="drag(event)"></div>
			<div id="d17" draggable="true" ondragstart="drag(event)"></div>
			<div id="d18" draggable="true" ondragstart="drag(event)"></div>
			<div id="d19" draggable="true" ondragstart="drag(event)"></div>
			<div id="d20" draggable="true" ondragstart="drag(event)"></div>
		</div>
		<div id="button-box">
			<input type="button" value="정답 제출하기" onclick="answerCheck()" class="sim-button button1">
		</div>
		<div id="message" hidden="hidden">
			축하합니다!<br>
			오늘의 문제를 모두 맞추셨습니다!
		</div>
		</div>
</div>
<script>
var tmpArr = new Array(); //문자열이 담겨진 변수
var randArr=new Array(); //문자열이 랜덤으로 저장되는 배열
var randMean=new Array(); //문제와 정답1 정답2가 들어갈 배열
var wordM; //결합된 의미/한자1/한자2
var afterStr;
var firstA; //드래그앤 드랍한 첫번째 박스
var firstB; //드래그앤 드랍한 두번째 박스
var meanArr;
var a=0;
var n=0;
var m=0;
var ch=0;
var num=0;
var beforeStr;
<%
for(int j=0;j<10;j++){%>
tmpArr[<%=j%>]='<%=ch[j]%>';
<%}
%>
</script>

<script>
//드래그 앤 드랍
function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}
function dropDiv(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}
</script>

<script>
function randCh(beforeStr){
	afterStr = beforeStr.split('/');
	randArr[a]=afterStr[1];
	randMean[m]=afterStr[4]+"/"+afterStr[1]+"/"+afterStr[3];
	a++;
	m++;
	randArr[a]=afterStr[3];
	a++;
}

function shuffle(d){
	   for(var c = d.length - 1; c > 0; c--){
	       var b = Math.floor(Math.random() * (c + 1));
	       var a = d[c]; d[c] = d[b]; d[b] = a;
	   }
	   return d
	};



for(var r=0;r<10;r++){
	randCh(tmpArr[n]); 
	n++;
}

wordM = document.getElementById("word-m"); //결합된 한자의 뜻

//alert(randArr); //한자만 들어가 있는 배열
randArr = shuffle(randArr);
randMean = shuffle(randMean);  //뜻이 들어있는 배열을 섞음



meanArr = randMean[ch].split('/');
//alert(meanArr);

wordM.innerHTML=meanArr[0]; //문제
for(var c=0;c<20;c++){
	var idName="d"+(c+1);
	//alert(idName);
	var div=document.getElementById(idName);
	div.innerHTML=randArr[c];
}
function answerCheck(){
//정답인지 아닌지 확인하는 함수
	
	firstA = $("#drop-first").children("div").text();
	firstB = $("#drop-second").children("div").text();
	//alert(meanArr);
	if(meanArr[1]==firstA && meanArr[2]==firstB){ //정답 확인
		//alert("정답입니다.");
		$("#drop-first").css("border","solid 1px green");
		$("#drop-second").css("border","solid 1px green");
		setTimeout( function(){
		    $('#drop-first').css('border','none');
		       },300);
		setTimeout( function(){
		    $('#drop-second').css('border','none');
		       },300);
		$("#drop-first").children("div").remove();
		$("#drop-second").children("div").remove();
		next(); //정답일 경우 다음으로 넘어감
	}//if
	else{//오답일 경우
		//alert("오답입니다 정답은 : "+meanArr[1]+meanArr[2]);
		$("#drop-first").css("border","solid 1px red");
		$("#drop-second").css("border","solid 1px red");
		setTimeout( function(){
		    $('#drop-first').css('border','none');
		       },300);
		setTimeout( function(){
		    $('#drop-second').css('border','none');
		       },300);
	}
}
function next(){
	if(ch==0) { //모든 문제를 맞춘 경우 //9
		var card = document.getElementById("card");
		var box = document.getElementById("box");
		var answer = document.getElementById("answer"); 
		card.style.display = 'none';
		box.style.display = 'none';
		answer.style.display = 'none'; //문제를 푸는데 사용했던 div를 다 숨김
		
		var message = document.getElementById("message"); 
		message.style.display = 'block';
	}
	ch++;
	meanArr = randMean[ch].split('/');
	wordM.innerHTML=meanArr[0];
}
</script>
</body>
</html>
