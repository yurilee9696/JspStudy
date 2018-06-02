<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#learn-box{
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  width:100%;
}
#learn-box>div{
	width: 80%;
	max-width: 45em;
}
#card{
	background-color: #FFF;
    margin: auto;
    padding: 1.5em 1em;
    text-align:center;
    border-radius: 15px;
    box-shadow: 0px 3px 11px rgba(0, 0, 0, 0.13);
    font-size: 1.5em;
    
}
#mean{
	font-size: 1.1em;
	margin-top: 0.7em;
}
#first-ch,#second-ch,#word-ch{
	color: #2ADE43;
	font-size: 1.3em;
}
#first-m, #first-ch,#second-m,#second-ch,#word-m,#word-ch{
	display: inline;
}
#learn-text{
	background-color: #FFF;
    margin: auto;
    padding: 1.5em;
    padding:3em 0;
    text-align:center;
    border-radius: 15px;
    box-shadow: 0px 3px 11px rgba(0, 0, 0, 0.13);
    font-size: 1.5em;
}
.sim-button,.next-button, .pre-button{
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

.next-button, .pre-button{
	line-height: 40px;
	text-align: center;
	width: 4em;
	box-shadow: 0px 3px 11px rgba(0, 0, 0, 0.13);
	font-size: 0.9em;
}
.pre-button{
	background-color: #FFF;
	margin-right: 1em;
	color: #88ACFF;
}


#button-box{
	text-align: center;
}
</style>
</head>
<body>

<%!
BufferedReader reader=null;
String text="";
String k;
%>



<%
	String path = application.getRealPath("/WEB-INF/question");
	File f = new File( path );
	File[] files = f.listFiles();
	System.out.println(path);
	// files
	int count = 0;
	for (int i = 0; i < files.length; i++) {
	
		if ( files[i].isFile() ) {
			count++;
		} // end of if
	} // end of for
	
try{
	 String todayPath=application.getRealPath("/WEB-INF/todayCh.txt");
	
	 //오늘 날짜 구하기
	 SimpleDateFormat sdf = new SimpleDateFormat("yyyy MM dd");
	 Date date = new Date();
	 String today = sdf.format(date);

	

	 
	  FileReader fr = new FileReader(todayPath); //파일읽기객체생성
       BufferedReader br = new BufferedReader(fr); //버퍼리더객체생성
       String line = null;
       while((line=br.readLine())!=null){ //라인단위 읽기
    	   text=line;
			  
		}//while End
       System.out.println(text);
       int idx = text.indexOf("*"); 
       String front = "";
       front=text.substring(0, idx);
       String end = text.substring(idx+1);
       String s="";
       
       BufferedWriter out2 = new BufferedWriter(new FileWriter(todayPath));
       
       if(end.equals(today)){
    	   System.out.println("값 못 바꿈");
    	   s=text;
    	   k=front;
    	   br.close();
    	   out2.flush();
       }else{
    	   System.out.println("값 바꿈");
    	   int num=(int) Double.parseDouble(front);
    	   if(count!=num){
    	   		num+=1;
    	   }
    	   else {
    		   num=1;
    	   }
    	   k = Integer.toString(num);
		   s=k+"*"+today;
		   br.close();
		   out2.flush();
       }
       out2.write(s);
	   out2.newLine();

	   out2.close();
	   System.out.println("k : "+k);
     
}catch(Exception e) { 
	    System.out.println(e.toString()); //에러 발생시 메시지 출력
 }

	BufferedReader reader=null;
	int i=0;
	String[] ch=new String[10];
	int n=0;
try{
	 String couponPath=application.getRealPath("/WEB-INF/question/learn"+k+".txt");
	
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
<div id="learn-box">
	<div>
		<div id="card" hidden="didden">
			<div id="text">
				<div id="first-m">뜻</div>
				<div id="first-ch">한자1</div> +
				<div id="second-m">뜻</div>
				<div id="second-ch">한자2</div> ->
				<div id="word-m">회의자 뜻</div>
				<div id="word-ch">회의자 한자</div>
				<div id="mean">의미</div>
			</div>
			<input type="button" id="prev" value="prev" onclick="prev()" class="pre-button button1">
			<input type="button" id="next" value="next" onclick="next()" class="next-button button1">
		</div>
		<div id="learn-text">시작하기 버튼을 눌러<br>한자 학습을 시작해볼까요?</div>
		<div id="button-box">
			<input type="button" id="show-card-btn" value="시작하기" onclick="showCard()" class="sim-button button1">
		</div>
	</div>
</div>
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
