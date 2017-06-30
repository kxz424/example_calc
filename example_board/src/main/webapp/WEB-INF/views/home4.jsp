<html>
<head>

<style type="text/css">

#calc,#recode {
	width: 400px;
	height: 560px;
	position: absolute;
	margin-left: 30%;
	border: 1px solid #ddd;
}
#bt input {
	width: 100px;
	height: 70px;
	float: left;
	border: 0;
	background: #eee;
	font-size: 18pt;
	font-weight: bold;
}
#answer, #answer2 {
	width: 100%;
	height: 70px;
	border: 0;
	background: #fff;
	text-align: right;
	padding: 10px;
}
#answer {
	font-size: 15pt;
}
#answer2 {
	font-size: 25pt;
	font-weight: bold;
	border-bottom: 1px solid #ddd;
}
input#remainder,input#sqrt,input#pow,input#frac {
	background: #fff;
}
#bt input:hover {
	background: #999;
}
#bt input:active {
	background: #777;
}
#C {
	color: red;
}
#CE {
	color: blue;
}
#recode {
	width: 400px;
	height: 562px;
	margin-left: 40%;
	margin-top: 0;
	position: absolute;
	top: 0;
	left: 62%;
	border: 1px solid #ddd;
	
}
#recodetitle {
	font-size: 18pt;
	font-weight: bold;
	border: 0;
}


</style>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>

<body>
<div id="calc">
    <form action="" id="calculator" role="form" method="post">
    	<input type="hidden" id="operation" name="formula" value="" />
    	<input type="hidden" id="result" name="result" value="" />
    	<input type="text" id="answer" value="" disabled="disabled" />
    	<input type="text" id="answer2" name="answer2" value="" disabled="disabled" />
    	
    	<div id="bt">
    		<input type="button" value="%" id="remainder" />
    		<input type="button" value="√" id="sqrt" />
    		<input type="button" value="x²" id="pow" />
    		<input type="button" value="1/x" id="frac" />
    	
    		<input type="submit" value="CE" id="CE" />
    		<input type="button" value="C" id="C" />
    		<input type="button" value="←" id="backspace" />
    		<input type="button" value="/" id="divide" />    		
    	
        	<input type="button" value="7" id="7" />
        	<input type="button" value="8" id="8" />
        	<input type="button" value="9" id="9" />
        	<input type="button" value="*" id="product" />        	
        
        	<input type="button" value="4" id="4" />
        	<input type="button" value="5" id="5" />
        	<input type="button" value="6" id="6" />
        	<input type="button" value="-" id="subtract" />
        	
        	<input type="button" value="1" id="1" />
        	<input type="button" value="2" id="2" />
        	<input type="button" value="3" id="3" />
        	<input type="button" value="+" id="plus" />
        	
        	<input type="button" value="±" id="negate" />
        	<input type="button" value="0" id="0" />
        	<input type="button" value="." id="decimal_point" />
        	<input type="submit" value="=" id="equals" />
    	</div>
    	<div id="recode">
		<input id="recodetitle" value="기록" />
	</div>
    </form>
    
</div>

</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
	var formObj = $("form[role='form']");
	$('#answer2').val('${result}');
	$('#operation').val($('#answer').val());
	
	//숫자 클릭
    $('#1,#2,#3,#4,#5,#6,#7,#8,#9,#0').click(function(e){
    	//방금 클릭한 숫자를 저장
		var v = $(this).val();
    	var v2 = $('#answer2').val();
    	if(v2.length <= 15) {
    		//클릭된 숫자를 원래 문자 뒤에 계속 더함
    		$('#answer').val($('#answer').val() + v);
        	if($('#answer2').attr('class') == 'number') {
        		$('#answer2').val(v2 + v);
        	} else {
        		$('#answer2').val(v);
        	}
    		$('#answer2').addClass('number');
    	}
    	
    	
	});
	
	//소수점 클릭
	$('#decimal_point').click(function(){
		$('#answer').val($('#answer').val() + '.');
		$('#answer2').val($('#answer2').val() + '.');
	});
    
	//더하기 클릭
	$('#plus').click(function(e) { 
		//텍스트창이 빈칸일경우
		if($('#answer').val() == '' || $('#answer2').val() == ''){
			//이벤트 전파 막고 이벤트 기본동작 중단
			return false;
			//빈칸일때 클릭시 이벤트 취소
			$('#equals').attr('onclick','');
		}
		else if ( $('#operation').attr('class') == 'activeAnswer') {
			$('#operation').val( $('#operation').val() + $('#plus').val() );
			$('#equals').attr('onclick','');
		}
		else{
			$('#operation').val( $('#operation').val() + $('#answer2').val() + $('#plus').val() );
			$('#equals').attr('onclick','');
		}
		$('#answer').val($('#operation').val());
		$('#answer2').attr('class', '');
// 		$('#answer2').val('');
		$('#operation').attr('class', '');
    });
	
	//빼기 클릭
	$('#subtract').click(function(e) { 
	
		if($('#answer').val() == ''){
			//이벤트 전파 막고 이벤트 기본동작 중단
			return false;	
			//빈칸일때 클릭시 이벤트 취소
			$('#equals').attr('onclick','');
		}
		//이전 결과값에 이어서 계산
		else if ( $('#operation').attr('class') == 'activeAnswer') {
			$('#operation').val( $('#operation').val() + $('#subtract').val() );
			$('#equals').attr('onclick','');
		}
		//현재 입력하고 있는 값들만 계산
		else{
			$('#operation').val( $('#operation').val() + $('#answer2').val() + $('#subtract').val() );
			$('#equals').attr('onclick','');
		}
		$('#answer').val($('#operation').val());
		$('#answer2').attr('class', '');
		$('#operation').attr('class', '');
    });
	
	//나누기 클릭
	$('#divide').click(function(e) { 
	
		if($('#answer').val() == ''){
			//이벤트 전파 막고 이벤트 기본동작 중단
			return false;	
			//빈칸일때 클릭시 이벤트 취소	
			$('#equals').attr('onclick','');
		}
		else if ( $('#operation').attr('class') == 'activeAnswer') {
			$('#operation').val( $('#operation').val() + $('#divide').val() );
			$('#equals').attr('onclick','');
		}
		else{
			$('#operation').val( $('#operation').val() + $('#answer2').val() + $('#divide').val() );
			$('#equals').attr('onclick','');
		}
		$('#answer').val($('#operation').val());
		$('#answer2').attr('class', '');
		$('#operation').attr('class', '');
    });
	
	//곱하기 클릭
	$('#product').click(function(e) { 
		if($('#answer').val() == ''){
			//이벤트 전파 막고 이벤트 기본동작 중단
			return false;	
			//빈칸일때 클릭시 이벤트 취소
			$('#equals').attr('onclick','');
		}
		else if ( $('#operation').attr('class') == 'activeAnswer') {
			$('#operation').val( $('#operation').val() + $('#product').val() );
			$('#equals').attr('onclick','');
		}
		else{
			$('#operation').val( $('#operation').val() + $('#answer2').val() + $('#product').val() );
			$('#equals').attr('onclick','');
		}
		$('#answer').val($('#operation').val());
		$('#answer2').attr('class', '');
		$('#operation').attr('class', '');
    });	
	
	//퍼센트 클릭
	$('#remainder').click(function(e) { 
	
		if($('#answer').val() == ''){
			//이벤트 전파 막고 이벤트 기본동작 중단
			return false;	
			//빈칸일때 클릭시 이벤트 취소	
			$('#equals').attr('onclick','');
		}
		else if ( $('#operation').attr('class') == 'activeAnswer') {
			$('#operation').val( $('#operation').val() + $('#remainder').val() );
			$('#equals').attr('onclick','');
		}
		else{
			$('#operation').val( $('#operation').val() + $('#answer2').val() + $('#remainder').val() );
			$('#equals').attr('onclick','');
		}
		$('#answer').val($('#operation').val());
		$('#answer2').attr('class', '');
		$('#operation').attr('class', '');
    });
	
	//제곱근 클릭
	$('#sqrt').click(function(e) {
		var sqrt = Math.sqrt;
	
		if($('#answer').val() == ''){
			//이벤트 전파 막고 이벤트 기본동작 중단
			return false;	
			//빈칸일때 클릭시 이벤트 취소	
			$('#equals').attr('onclick','');
		} 
		else {
// 			$('#operation').val('sqrt' + '(' + $('#answer').val() + ')'); 
			$('#answer2').val(sqrt($('#answer2').val()));
			$('#operation').val( $('#operation').val() + $('#answer2').val() );
			$('#operation').attr('class', 'activeAnswer');
			$('#equals').attr('onclick','');
		}
		$('#answer').val($('#operation').val());
		$('#answer2').attr('class', '');		
    });
	
	//제곱 클릭
	$('#pow').click(function(e) {
		var pow = Math.pow;
	
		if($('#answer').val() == ''){
			//이벤트 전파 막고 이벤트 기본동작 중단
			return false;	
			//빈칸일때 클릭시 이벤트 취소	
			$('#equals').attr('onclick','');
		}
		else {
// 			$('#operation').val('pow' + '(' + $('#answer').val() + ',' + 2 + ')'); 
			$('#answer2').val(pow($('#answer2').val(), 2));
			$('#operation').val( $('#operation').val() + $('#answer2').val() );
			$('#operation').attr('class', 'activeAnswer');
			$('#equals').attr('onclick','');
		}
		$('#answer').val($('#operation').val());
		$('#answer2').attr('class', '');		
    });
	
	//n분의 1 클릭
	$('#frac').click(function(e) {
		if($('#answer').val() == ''){
			//이벤트 전파 막고 이벤트 기본동작 중단
			return false;	
			//빈칸일때 클릭시 이벤트 취소	
			$('#equals').attr('onclick','');
		}
		else {
// 			$('#operation').val('negate' + '(' + $('#answer').val() + ')'); 
			$('#answer2').val(1 / $('#answer2').val());
			$('#operation').val( $('#operation').val() + $('#answer2').val() );
			$('#operation').attr('class', 'activeAnswer');
			$('#equals').attr('onclick','');
		}
		$('#answer').val($('#operation').val());
		$('#answer2').attr('class', '');	
    });
	
	//플마 클릭
	$('#negate').click(function(e) {
		var a2 = $('#answer2').val();
	
		if(a2 == ''){
			//이벤트 전파 막고 이벤트 기본동작 중단
			return false;	
			//빈칸일때 클릭시 이벤트 취소	
			$('#equals').attr('onclick','');
		}
		else {
// 			$('#operation').val('negate' + '(' + a2 + ')'); 
			$('#answer2').val(-a2);
			$('#operation').val( $('#operation').val() + $('#answer2').val() );
			$('#operation').attr('class', 'activeAnswer');
			$('#equals').attr('onclick','');
		}
		$('#answer').val($('#operation').val());
		$('#answer2').attr('class', '');
    });
	
	//DB초기화
	$('#CE').click(function(){
		$('#answer').val('');
		$('#operation').val('');
		$('#result').val('');
		$('#operation').removeClass('activeAnswer');

		formObj.attr("action", "/delete");
		formObj.submit();

		$('#equals').attr('onclick','');
				
	});
	
	//초기화
	$('#C').click(function(){
		$('#answer').val('');
		$('#answer2').val('');
		$('#operation').val('');
		$('#result').val('');
		$('#operation').removeClass('activeAnswer');
// 		alert($('#answer').val());
		$('#equals').attr('onclick','');
	});
	
	//결과 호출
	$('#equals').click(function(){
		
		if($('#equals').attr('onclick') != 'return false'){
			
			var formObj = $("form[role='form']");
		
			var a = $('#answer2').val();
			var b = $('#operation').val();
			//concat함수 : 문자열 연결
			var c = b.concat(a);
			//evel함수 : 함수 실행 동시에 들어온 값의 연산도 함께 처리(?) c의 값인 계산식을 처리함
		
			if($('#operation').attr('class') == 'activeAnswer') {
				$('#operation').val(b);
				$('#result').val(eval(b));
			}else {
				$('#operation').val(c);
				$('#result').val(eval(c));
			}
			
			
			//이전 계산 유무 처리
// 			$('#operation').addClass('activeAnswer');
			$('#operation').attr('class', 'activeAnswer');
// 			$('#answer').val('');
			
			formObj.submit();
// 			$('#answer2').val('${result}');
			alert("계산 완료!!!");
			var rc = 1;
			$('#recode').append($('<input/>', {
				id: 'operation' + rc,
				value: $('#answer').val() + "=",
				type: 'text'
			}));
			$('#recode').append($('<input/>', {
				id: 'result' + rc,
				value: $('#answer2').val(),
				type: 'text'
			}));
			rc++;
			
			$('#equals').attr('onclick','return false');
		
		}
	});
	
	$('#backspace').click(function(){
		var answer = $('#answer').val();
		var answer2 = $('#answer2').val();
		$('#answer').val(answer.slice(0,-1));
		$('#answer2').val(answer2.slice(0,-1));
	});
});

</script>
</html>