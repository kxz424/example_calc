<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<TITLE></TITLE>
<style type="text/css">
<!--
body {
	font-family: helvetica
}

p {
	font-size: 12pt
}

.red {
	color: red
}

.blue {
	color: blue
}

#equal {
	
}
-->
</style>
<SCRIPT LANGUAGE="JavaScript">
	var Memory = 0;
	var Number1 = "";
	var Number2 = "";
	var NewNumber = "blank";
	var opvalue = "";

	function Display(displaynumber) {
		document.calculator.answer.value = displaynumber;
	}
	function MemoryClear() {
		Memory = 0;
		document.calculator.mem.value = "";
	}
	function MemoryRecall(answer) {
		if (NewNumber != "blank") {
			Number2 += answer;
		} else {
			Number1 = answer;
		}
		NewNumber = "blank";
		Display(answer);
	}
	function MemorySubtract(answer) {
		Memory = Memory - eval(answer);
	}
	function MemoryAdd(answer) {
		Memory = Memory + eval(answer);
		document.calculator.mem.value = " M ";
		NewNumber = "blank";
	}
	function ClearCalc() {
		Number1 = "";
		Number2 = "";
		NewNumber = "blank";
		Display("");
	}
	function Backspace(answer) {
		answerlength = answer.length;
		answer = answer.substring(0, answerlength - 1);
		if (Number2 != "") {
			Number2 = answer.toString();
			Display(Number2);
		} else {
			Number1 = answer.toString();
			Display(Number1);
		}
	}
	function CECalc() {
		Number2 = "";
		NewNumber = "yes";
		Display("");
	}
	function CheckNumber(answer) {
		if (answer == ".") {
			Number = document.calculator.answer.value;
			if (Number.indexOf(".") != -1) {
				answer = "";
			}
		}
		if (NewNumber == "yes") {
			Number2 += answer;
			Display(Number2);
		} else {
			if (NewNumber == "blank") {
				Number1 = answer;
				Number2 = "";
				NewNumber = "no";
			} else {
				Number1 += answer;
			}
			Display(Number1);
		}
	}
	function AddButton(x) {
		if (x == 1)
			EqualButton();
		if (Number2 != "") {
			Number1 = parseFloat(Number1) + parseFloat(Number2);
		}
		NewNumber = "yes";
		opvalue = '+';
		Display(Number1);
	}
	function SubButton(x) {
		if (x == 1)
			EqualButton();
		if (Number2 != "") {
			Number1 = parseFloat(Number1) - parseFloat(Number2);
		}
		NewNumber = "yes";
		opvalue = '-';
		Display(Number1);
	}
	function MultButton(x) {
		if (x == 1)
			EqualButton();
		if (Number2 != "") {
			Number1 = parseFloat(Number1) * parseFloat(Number2);
		}
		NewNumber = "yes";
		opvalue = '*';
		Display(Number1);
	}
	function DivButton(x) {
		if (x == 1)
			EqualButton();
		if (Number2 != "") {
			Number1 = parseFloat(Number1) / parseFloat(Number2);
		}
		NewNumber = "yes";
		opvalue = '/';
		Display(Number1);
	}
	function SqrtButton() {
		Number1 = Math.sqrt(Number1);
		NewNumber = "blank";
		Display(Number1);
	}
	function PercentButton() {
		if (NewNumber != "blank") {
			Number2 *= .01;
			NewNumber = "blank";
			Display(Number2);
		}
	}
	function RecipButton() {
		Number1 = 1 / Number1;
		NewNumber = "blank";
		Display(Number1);
	}
	function NegateButton() {
		Number1 = parseFloat(-Number1);
		NewNumber = "no";
		Display(Number1);
	}
	function EqualButton() {
		if (opvalue == "+")
			AddButton(0);
		if (opvalue == "-")
			SubButton(0);
		if (opvalue == "*")
			MultButton(0);
		if (opvalue == "/")
			DivButton(0);
		Number2 = "";
		opvalue = "";
	}
// -->
</script>
</HEAD>
<BODY>
	<center>
		<form name="calculator">
			<table bgcolor="#aaaaaa" width=220>

				<table border=0 cellpadding=0>
					<tr>
						<td bgcolor="#000080" align=center><b style="color: white">계산기</b></td>
					</tr>
					<tr>
						<td>
							<table width="100%" border=0>
								<tr>
									<td colspan=6><input type="text" name="answer" size=33
										maxlength=30 onChange="CheckNumber(this.value)"></td>
								</tr>
								<tr>
									<td><input type="button" name="MC" class="red"
										value=" MC " onClick="MemoryClear(); return false;"></td>
									<td><input type="button" name="MR" class="red"
										value=" MR " onClick="MemoryRecall(Memory); return false;"></td>
									<td><input type="button" name="MS" class="red"
										value=" MS "
										onClick="MemorySubtract(document.calculator.answer.value); return false;"></td>
									<td><input type="button" name="MPlus" class="red"
										value=" M+ "
										onClick="MemoryAdd(document.calculator.answer.value); return false;"></td>
								</tr>
								<tr>
									<td><input type="button" name="backspace" class="red"
										value="  ←  "
										onClick="Backspace(document.calculator.answer.value); return false;"></td>
									<td><input type="button" name="CE" class="red"
										value=" CE " onClick="CECalc(); return false;"></td>
									<td><input type="reset" name="C" class="red" value="  C  "
										onClick="ClearCalc(); return false;"></td>
									<td><input type="button" name="negate" class="blue"
										value=" +/- " onClick="NegateButton(); return false;"></td>
									<td><input type="button" name="sqrt" class="blue"
										value="sqrt " onClick="SqrtButton(); return false;"></td>
								</tr>
								<tr>
									<td><input type="button" name="calc7" class="blue"
										value="  7  " onClick="CheckNumber('7'); return false;"></td>
									<td><input type="button" name="calc8" class="blue"
										value="  8  " onClick="CheckNumber('8'); return false;"></td>
									<td><input type="button" name="calc9" class="blue"
										value="  9  " onClick="CheckNumber('9'); return false;"></td>
									<td><input type="button" name="divide" class="red"
										value="  /  " onClick="DivButton(1); return false;"></td>
									<td><input type="button" name="percent" class="blue"
										value="  %  " onClick="PercentButton(); return false;"></td>
								</tr>

								<tr>
									<td><input type="button" name="calc4" class="blue"
										value="  4  " onClick="CheckNumber('4'); return false;"></td>
									<td><input type="button" name="calc5" class="blue"
										value="  5  " onClick="CheckNumber('5'); return false;"></td>
									<td><input type="button" name="calc6" class="blue"
										value="  6  " onClick="CheckNumber('6'); return false;"></td>
									<td><input type="button" name="multiply" class="red"
										value="  *  " onClick="MultButton(1); return false;"></td>
									<td><input type="button" name="recip" class="blue"
										value=" 1/x " onClick="RecipButton(); return false;"></td>
								</tr>
								<tr>
									<td><input type="button" name="calc1" class="blue"
										value="  1  " onClick="CheckNumber('1'); return false;"></td>
									<td><input type="button" name="calc2" class="blue"
										value="  2  " onClick="CheckNumber('2'); return false;"></td>
									<td><input type="button" name="calc3" class="blue"
										value="  3  " onClick="CheckNumber('3'); return false;"></td>
									<td><input type="button" name="minus" class="red"
										value="  -  " onClick="SubButton(1); return false;"></td>
									<td><input type="button" name="equal" id="equal"
										class="red" height="20" value="  =  "
										onClick="EqualButton(); return false;"></td>
								</tr>

								<tr>
									<td><input type="button" name="calc0" class="blue"
										value="  0  " onClick="CheckNumber('0'); return false;"></td>
									<td><input type="button" name="negate" class="blue"
										value=" +/- " onClick="NegateButton(); return false;"></td>
									<td><input type="button" name="dot" class="blue"
										value="  .   " onClick="CheckNumber('.'); return false;"></td>
									<td><input type="button" name="plus" class="red"
										value=" +  " onClick="AddButton(1); return false;"></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>

			</table>
		</form>
	</center>
</BODY>
</HTML>