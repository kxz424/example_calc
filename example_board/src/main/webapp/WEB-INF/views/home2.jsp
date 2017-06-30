<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>http://www.blueb.co.kr</title>

<script language="JavaScript">
function round(val) {
	return(Math.round(val*10000000)/10000000);
	}
PI = 3.141592654;

function pie() {
	document.keypad.display.value = PI;
}

function MakeArray(n){
	this.length=n;
	for(var i=1; i<=n; i++) this[i]=0;
	return this
	}
	link = new MakeArray(5);

function enter(num) {
	document.keypad.display.value += num;
}

function calculate(sign) {
	var temp = document.keypad.display.value * 1;
		document.keypad.display.value = "";
		document.keypad.list.value = temp;
		link[1] = temp;
	if (sign == "/") {link[2] = "/"; document.keypad.list.value += " / ";}
	if (sign == "*") {link[2] = "*"; document.keypad.list.value += " * ";}
	if (sign == "-") {link[2] = "-"; document.keypad.list.value += " - ";}
	if (sign == "+") {link[2] = "+"; document.keypad.list.value += " + ";}
	if (sign == "p") {link[2] = "p"; document.keypad.list.value += " ^ ";}
	}

function power() {
	temp = 1;
	n = link[3];
	for(var i=1; i<=n; i++) temp *= link[1];
	return(temp);
}

function equal() {
	if (link[2]) {
	if (document.keypad.display.value != "") {
	var temp = document.keypad.display.value * 1;
		document.keypad.list.value += temp;
	link[3] = temp;
	if (link[2] == "/") {res = link[1] / link[3]; document.keypad.display.value = round(res)}
	if (link[2] == "*") {res = link[1] * link[3]; document.keypad.display.value = round(res)}
	if (link[2] == "-") {res = link[1] - link[3]; document.keypad.display.value = round(res)}
	if (link[2] == "+") {res = link[1] + link[3]; document.keypad.display.value = round(res)}
	if (link[2] == "p") {document.keypad.display.value = round( power() )}
		link[1]=0; link[2]=0; link[3]=0;
		}
	}
}

function calc(code) {
	var temp = document.keypad.display.value * 1;
	if (code == 1) {temp1 = Math.sin(temp*PI/180); document.keypad.list.value = "sin "}
	if (code == 2) {temp1 = Math.cos(temp*PI/180); document.keypad.list.value = "cos "}
	if (code == 3) {temp1 = Math.tan(temp*PI/180); document.keypad.list.value = "tan "}
	if (code == 4) {temp1 = Math.sqrt(temp); document.keypad.list.value = "sqrt "}
	if (code == 5) {temp1 = Math.log(temp); document.keypad.list.value = "ln "}
	if (code == 6) {temp1 = 1/temp; document.keypad.list.value = "1/x, x="}
	if (code == 7) {temp1 = temp * temp; document.keypad.list.value = "x*x, x="}
		document.keypad.list.value += temp;
		document.keypad.display.value = round(temp1);
}

function fsolve() {
	var a = document.keypad.c1.value*1;
	var b = document.keypad.c2.value*1;
	var c = document.keypad.c3.value*1;
	if (a==0) {document.keypad.list.value = " Not a Quadratic";
		document.keypad.display.value = " Equation"}
	else { x1 = (b*b-4*a*c);
	if ( x1 < 0) {document.keypad.list.value = " Imaginary Roots";
		temp = (Math.sqrt(Math.abs(x1)))/(2*a);
		x2 = round(-b/(2*a)) + "+/- " + round(temp) + "i";
		document.keypad.display.value = x2}
	else {
	var x1 = (-b + Math.sqrt(b*b-4*a*c)) / (2*a);
	var x2 = (-b - Math.sqrt(b*b-4*a*c)) / (2*a);
		document.keypad.list.value = "x1 = " + round(x1);
		document.keypad.display.value = "x2 = " + round(x2);
		}
	}
}

function change() {
	var temp = document.keypad.display.value;
	if (temp.substring(0,1) == "-") {document.keypad.list.value = "";
		document.keypad.display.value = 0 - document.keypad.display.value * 1}
	if (temp.substring(0,1) != "-") {document.keypad.list.value = "";
		document.keypad.display.value = "-" + temp.substring(0,temp.length)}
}

function eraser() {
	document.keypad.list.value = " Start Punching!";
	document.keypad.display.value = "";
	document.keypad.c1.value = "";
	document.keypad.c2.value = "";
	document.keypad.c3.value = "";
	link[1]=0; link[2]=0; link[3]=0;
}

function backer() {
	var temp = document.keypad.display.value;
		document.keypad.display.value = temp.substring(0,temp.length*1 -1);
	}
	var memory = 0;

function mem(val) {
	if (val == 1 ) {document.keypad.list.value = " --> Memory In";
		memory = document.keypad.display.value * 1}
	if (val == -1) {document.keypad.display.value = memory}
	if (val == 0 ) {document.keypad.list.value = " Memory Erased";
		document.keypad.display.value = ""; memory = 0}
}

function message() {
	alert('\n\nSend your comments and suggestions to:\n\n ----> aag4@lehigh.edu <----');
}

function travel(link) {
	window.open(link,"calculator","toolbar=1,location=1,status=1,scrollbars=1,directories=1,copyhistory=1,menubar=1,resizable=1")
}
var screen=" ";

function eraser2() {
	var ans = confirm('\nDo you want to clear the entire CALCpad?\n');
	if (ans) {screen = document.notes.junk.value; document.notes.junk.value = "";}
}

function copy() {
	document.notes.junk.value = document.keypad.list.value+"\n"+document.keypad.display.value+"\n"+document.notes.junk.value;
}

function help() {
	screen = document.notes.junk.value;
	msg1 = "Following are some of the\ncalculator functions:\n";
	msg2 = "\n(<-> M) - Erase Memory Contents\n(--> M) - Memory In\n(<-- M) - Memory Out";
	msg3 = "\n(<--) - Erase last character\n(x^y) - X to the power of Y";
	msg4 = "\n\nTo Go Back, click 'Restore CALCpad'";
	document.notes.junk.value = "";
	document.notes.junk.value = msg1 + msg2 + msg3 + msg4;
}

function restore() {
	document.notes.junk.value = "";
	document.notes.junk.value = screen;
}
</SCRIPT>
<TABLE border=0 bgcolor="#FAF4FF" bordercolor="#9FBAD0" cellpadding="2"
	cellspacing="0">
	<TBODY>
		<TR>
			<TD align=middle rowSpan=2 vAlign=top>
				<TABLE border=0 bgcolor="#F5ECFF">
					<TR>
						<TD align=middle rowSpan=2 vAlign=center bgcolor="#DBE4F2">
							<FORM name=keypad>
								<CENTER>

									<TABLE border=1 cellPadding=2 cellSpacing=0 bgcolor="#DBE4F2"
										bordercolor="#808080">
										<TBODY>
											<TR>
												<TD align=middle colSpan=9 vAlign=center bgcolor="#006393">
													<p align="center">
														<font color="#FFFF00" face="Arial" size="4"><B>WEB</B>
															<B>.Sci-CALCulator</B></font>
													</p>
												</TD>
											</TR>
											<TR>
												<TD align=middle colSpan=6 vAlign=center><font size="2"
													face="Verdana"><INPUT name=list size=22
														value=" Start Punching!"> </font></TD>
												<TD align=middle colSpan=3 vAlign=center><INPUT
													name=alex1 onclick=eraser() type=button value=" CLEAR "></TD>
											</TR>
											<TR>
												<TD align=middle colSpan=6 vAlign=center><font size="2"
													face="Verdana"><INPUT name=display size=22></font></TD>
												<TD align=middle colSpan=2 vAlign=center><INPUT
													name=alex2 onclick=equal() type=button value=" = "></TD>
												<TD align=middle vAlign=center><INPUT name=alex3
													onclick=backer() type=button value=" <-- "></TD>
											</TR>
											<TR>
												<TD align=middle vAlign=center><INPUT name=alex4
													onclick=enter(1) type=button value=" 1 "></TD>
												<TD align=middle vAlign=center><INPUT name=alex5
													onclick=enter(2) type=button value=" 2 "></TD>
												<TD align=middle vAlign=center><INPUT name=alex6
													onclick=enter(3) type=button value=" 3 "></TD>
												<TD></TD>
												<TD align=middle vAlign=center><INPUT name=alex7
													onclick="calculate('/')" type=button value=" / "></TD>
												<TD></TD>
												<TD align=middle vAlign=center><INPUT name=alex8
													onclick=calc(1) type=button value=" sin "></TD>
												<TD align=middle vAlign=center><INPUT name=alex9
													onclick=calc(4) type=button value=" x½ "></TD>
												<TD align=middle vAlign=center><INPUT name=alex10
													onclick=mem(0) type=button value="<->M"></TD>
											</TR>
											<TR>
												<TD align=middle vAlign=center><INPUT name=alex11
													onclick=enter(4) type=button value=" 4 "></TD>
												<TD align=middle vAlign=center><INPUT name=alex12
													onclick=enter(5) type=button value=" 5 "></TD>
												<TD align=middle vAlign=center><INPUT name=alex13
													onclick=enter(6) type=button value=" 6 "></TD>
												<TD></TD>
												<TD align=middle vAlign=center><INPUT name=alex14
													onclick="calculate('*')" type=button value=" * "></TD>
												<TD></TD>
												<TD align=middle vAlign=center><INPUT name=alex15
													onclick=calc(2) type=button value=cos></TD>
												<TD align=middle vAlign=center><INPUT name=alex16
													onclick=calc(7) type=button value=" x² "></TD>
												<TD align=middle vAlign=center><INPUT name=alex17
													onclick=mem(1) type=button value="--> M"></TD>
											</TR>
											<TR>
												<TD align=middle vAlign=center><INPUT name=alex18
													onclick=enter(7) type=button value=" 7 "></TD>
												<TD align=middle vAlign=center><INPUT name=alex19
													onclick=enter(8) type=button value=" 8 "></TD>
												<TD align=middle vAlign=center><INPUT name=alex20
													onclick=enter(9) type=button value=" 9 "></TD>
												<TD></TD>
												<TD align=middle vAlign=center><INPUT name=alex21
													onclick="calculate('-')" type=button value=" - "></TD>
												<TD></TD>
												<TD align=middle vAlign=center><INPUT name=alex22
													onclick=calc(3) type=button value="tan "></TD>
												<TD align=middle vAlign=center><INPUT name=alex23
													onclick=calc(6) type=button value="1/x "></TD>
												<TD align=middle vAlign=center><INPUT name=alex24
													onclick=mem(-1) type=button value="<-- M"></TD>
											</TR>
											<TR>
												<TD align=middle vAlign=center><INPUT name=alex25
													onclick=enter(0) type=button value=" 0 "></TD>
												<TD align=middle vAlign=center><INPUT name=alex26
													onclick="enter('.')" type=button value=dot></TD>
												<TD align=middle vAlign=center><INPUT name=alex27
													onclick=change() type=button value=" +|- "></TD>
												<TD></TD>
												<TD align=middle vAlign=center><INPUT name=alex28
													onclick="calculate('+')" type=button value=" + "></TD>
												<TD></TD>
												<TD align=middle vAlign=center><INPUT name=alex29
													onclick=pie() type=button value=" pi "></TD>
												<TD align=middle vAlign=center><INPUT name=alex30
													onclick=calc(5) type=button value=" Ln "></TD>
												<TD align=middle vAlign=center><INPUT name=alex31
													onclick="calculate('p')" type=button value=" x^y "></TD>
											</TR>
											<TR>
												<TD align=middle colSpan=9 vAlign=center></TD>
											</TR>
											<TR>
												<TD align=middle colSpan=9 vAlign=center><B><font
														face="Arial" size="2"> </font><font face="Verdana"
														size="2"><INPUT name=c1 size=4> </font><font
														face="Arial" size="3"> *X² + </font><font face="Verdana"
														size="2"> <INPUT name=c2 size=4>
													</font><font face="Arial" size="2"> </font><font face="Arial"
														size="3">*X +</font><font face="Arial" size="2"> </font><font
														face="Verdana" size="2"> <INPUT name=c3 size=4>
													</font><font face="Arial" size="2"> </font><font face="Arial"
														size="3">= 0</font><font face="Arial" size="2"> </font></B> <font
													face="Arial" size="2"> <INPUT name=alex
														onclick=fsolve() type=button value=Solve><B> </B>
												</font></TD>
											</TR>
										</TBODY>
									</TABLE>
								</CENTER>
						</TD>

					</TR>
				</TABLE>
				<CENTER>
					<INPUT name=alex onclick=help() type=button value=" Help ">
				</CENTER>
				</FORM>
			</TD>

			<TD align=middle vAlign=center bgcolor="#DBE4F2">
				<center>
					<B><font face="Arial" size="3" color="#000000">CALCpad</font></B>
				</center>
			</TD>
		</TR>
		<TR>
			<TD align=middle vAlign=center>


				<FORM name=notes>
					<TEXTAREA cols=40 name=junk rows=10 wrap=virtual>