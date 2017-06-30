<html>
<head>

<style type="text/css">

#answer,#answer2 {
	text-align: right;
	
}
#recode {
	margin: 100px;
	position: relative;
	left: 10px;
	bottom: 170px;
	height: 239.5px;
	
/* 	margin-top: auto; */
	
}
#recodetext {
 	height: 309.5px;
 	width: 200px;
}

</style>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>

<body>

    <form action="" id="calculator" role="form" method="post">
    <div style="width:200px; margin:auto;">
    	<input type="hidden" id="operation" name="formula" value=""/>
    	<input type="hidden" id="result" name="result" value="" />
    	<input type="text" id="answer" value="" style="width:100%; height:35px;" disabled="disabled"/>
    	<input type="text" id="answer2" name="answer2" value="" style="width:100%; height:35px;" disabled="disabled" />
    
    <div>
    	<div>
    		<input type="button" value="%" id="remainder" style="width:50px; height:40px; float:left;"/>
    		<input type="button" value="√" id="sqrt" style="width:50px; height:40px; float:left;"/>
    		<input type="button" value="x²" id="pow" style="width:50px; height:40px; float:left;"/>
    		<input type="button" value="1/x" id="frac" style="width:50px; height:40px; float:left;"/>
    	</div>
    	<div>
    		<input type="button" value="CE" id="CE" style="width:50px; height:40px; float:left; color:blue"/>
    		<input type="button" value="C" id="C" style="width:50px; height:40px; float:left; color:red;"/>
    		<input type="button" value="←" id="backspace" style="width:50px; height:40px; float:left;"/>
    		<input type="button" value="/" id="divide" style="width:50px; height:40px; float:left;"/>
    	</div>
    	<div>
        	<input type="button" value="1" id="1" style="width:50px; height:40px; float:left;"/>
        	<input type="button" value="2" id="2" style="width:50px; height:40px; float:left;"/>
        	<input type="button" value="3" id="3" style="width:50px; height:40px; float:left;"/>
        	<input type="button" value="+" id="plus" style="width:50px; height:40px; float:left;"/>
        </div>
        <div>
        	<input type="button" value="4" id="4" style="width:50px; height:40px; float:left;"/>
        	<input type="button" value="5" id="5" style="width:50px; height:40px; float:left;"/>
        	<input type="button" value="6" id="6" style="width:50px; height:40px; float:left;"/>
        	<input type="button" value="-" id="subtract" style="width:50px; height:40px; float:left;"/>
        </div>
        <div>
        	<input type="button" value="7" id="7" style="width:50px; height:40px; float:left;"/>
        	<input type="button" value="8" id="8" style="width:50px; height:40px; float:left;"/>
        	<input type="button" value="9" id="9" style="width:50px; height:40px; float:left;"/>
        	<input type="button" value="*" id="product" style="width:50px; height:40px; float:left;"/>
        </div>
        <div>
        	<input type="button" value="±" id="negate" style="width:50px; height:40px; float:left;"/>
        	<input type="button" value="0" id="0" style="width:50px; height:40px; float:left;"/>
        	<input type="button" value="." id="decimal_point" style="width:50px; height:40px; float:left;"/>
        	<input type="submit" value="=" id="equals" style="width:50px; height:40px; float:left;"/>
    	</div>
    	</div>
    	<div id="recode">
<!--     		<input type="text" id="recodetext" value="111" disabled="disabled" /> -->
    		
    	</div>
    
</div>
</form>
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
	$('#answer2').val('${result}');
	$('#operation').val($('#answer').val());
	var formObj = $("form[role='form']");
	
	//숫자 클릭
    $('#1,#2,#3,#4,#5,#6,#7,#8,#9,#0').click(function(e){
    	//방금 클릭한 숫자를 저장
		var v = $(this).val();
    	var v2 = $('#answer2').val();
    	//클릭된 숫자를 원래 문자 뒤에 계속 더함
		$('#answer').val($('#answer').val() + v);
    	if($('#answer2').attr('class') == 'number') {
    		$('#answer2').val(v2 + v);
    	} else {
    		$('#answer2').val(v);
    	}
		$('#answer2').addClass('number');
    	
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
		$('#answer2').val('');
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
// 		alert($('#answer').val());
		$('#equals').attr('onclick','');
		formObj.attr("action", "/delete");
		formObj.submit();
				
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
			$('#answer2').val('${result}');
			alert("계산 완료!!!");
			
			
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