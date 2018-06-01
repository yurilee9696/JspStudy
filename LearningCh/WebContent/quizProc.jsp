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
#card, #answer{
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
#answer{
    margin-top: 1em;
}
#answer div{
	display: inline;
	padding: 0.5em;
	font-size: 20px;
	cursor: pointer;
}
#drop-first, #drop-second{
	width: 5em;
	height:5em;
	display:inline-block;
	float:right;
	margin-top: 1em;
	text-align: center;
	font-size: 50px;
	background-color: #FFF;
    border-radius: 15px;
    box-shadow: 0px 3px 11px rgba(0, 0, 0, 0.13);
}
#drop-first{
	margin-right: 1em;
	float: left;
}
#answer-box{
	width:30em;
	height:auto;
	cursor: pointer;
	font-size: 20px;
	margin: 0 auto;
	background-color: fuchsia;
	text-align: center;
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
<div id="card">
	<div id="text">
		<div id="word-m">e</div>
	</div>
	<input type="button" id="prev" value="prev" onclick="prev()">
	<input type="button" id="next" value="next" onclick="next()">
</div>
<div id="answer-box">
	<div id="drop-first" ondrop="drop(event)" ondragover="allowDrop(event)">
	
	</div>
	<div id="drop-second" ondrop="drop(event)" ondragover="allowDrop(event)">
	
	</div>
</div>
<div id="answer" ondrop="drop(event)" ondragover="allowDrop(event)">
	<div id="d1" draggable="true" ondragstart="drag(event)">a</div>
	<div id="d2" draggable="true" ondragstart="drag(event)">a</div>
	<div id="d3" draggable="true" ondragstart="drag(event)">a</div>
	<div id="d4" draggable="true" ondragstart="drag(event)">a</div>
	<div id="d5" draggable="true" ondragstart="drag(event)">a</div>
	<div id="d6" draggable="true" ondragstart="drag(event)">a</div>
	<div id="d7" draggable="true" ondragstart="drag(event)">a</div>
	<div id="d8" draggable="true" ondragstart="drag(event)">a</div>
	<div id="d9" draggable="true" ondragstart="drag(event)">a</div>
	<div id="d10" draggable="true" ondragstart="drag(event)">a</div>
	<div id="d11" draggable="true" ondragstart="drag(event)">a</div>
	<div id="d12" draggable="true" ondragstart="drag(event)">a</div>
	<div id="d13" draggable="true" ondragstart="drag(event)">a</div>
	<div id="d14" draggable="true" ondragstart="drag(event)">a</div>
	<div id="d15" draggable="true" ondragstart="drag(event)">a</div>
	<div id="d16" draggable="true" ondragstart="drag(event)">a</div>
	<div id="d17" draggable="true" ondragstart="drag(event)">a</div>
	<div id="d18" draggable="true" ondragstart="drag(event)">a</div>
	<div id="d19" draggable="true" ondragstart="drag(event)">a</div>
	<div id="d20" draggable="true" ondragstart="drag(event)">a</div>
</div>
<script>
var tmpArr = new Array();
var randArr=new Array();
var afterStr;
var a=0;
var n=0;
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
	a++;
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

var num=0;
var beforeStr;

for(var r=0;r<10;r++){
	randCh(tmpArr[n]); 
	n++;
}

var wordM = document.getElementById("word-m"); //결합된 한자의 뜻

//alert(randArr); //한자만 들어가 있는 배열
randArr = shuffle(randArr);
//alert(randArr);
//alert(shuffle(tmpArr));
//var d1=document.getElementById("d1").innerHTML=shuffle(tmpArr[1]);

//var div1=document.getElementById("d1");

for(var c=0;c<20;c++){
	var idName="d"+(c+1);
	//alert(idName);
	var div=document.getElementById(idName);
	div.innerHTML=randArr[c];
}
function showCard(){
	

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
