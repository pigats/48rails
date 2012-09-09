var opening = new Date(2012,9,14,01,00,00)
var distance = 2640;
var t = 33;

$(document).ready(function() {
	var now = new Date();
	var timediff = parseInt((opening.getTime()-now.getTime()) / 1000);
	days = parseInt(timediff / (24*60*60));		
	timediff -= days*24*60*60;
	hours = parseInt(timediff / (60*60));
	timediff -= hours*60*60;
	mins = parseInt(timediff / 60);
	timediff -= mins*60;
	secs = timediff;	

	d10 = parseInt(days / 10)
	d1 = days - (d10*10)
	h10 = parseInt(hours / 10)
	h1 = hours - (h10*10)
	m10 = parseInt(mins / 10)
	m1 = mins - (m10*10)
	s10 = parseInt(secs / 10)
	s1 = secs - (s10*10)


	$(".countdown img").css("top", 0);

	$("#d10").css("top", -d10*distance)
	$("#d1").css("top", -d1*distance)
	
	$("#h10").css("top", -h10*distance)
	$("#h1").css("top", -h1*distance)
	
	$("#m10").css("top", -m10*distance)
	$("#m1").css("top", -m1*distance)
	
	$("#s10").css("top", -s10*distance)
	$("#s1").css("top", -s1*distance)

height = 88;
bottom_9 = -26312; 
bottom_5 = -15752;
bottom_3 = -7920;
bottom_2 = -5280;

//setInterval("timer_s1()",t) moved to pages.js

})

function timer_s1() {
s1 = parseInt($("#s1").css("top")) + height;
$("#s1").css("top", s1);
if(s1 == 0) {
	$("#s1").css("top", bottom_9);
	animation_s10 = setInterval('timer_s10()',t);
}
}

function timer_s10() {
s10 = parseInt($("#s10").css("top")) + height
if(s10 > 0) {
	s10 = bottom_5;
	animation_m1 = setInterval('timer_m1()',t);
}
$("#s10").css("top", s10)
if (!(s10 % distance)) clearInterval(animation_s10)
}

function timer_m1() {
m1 = parseInt($("#m1").css("top")) + height
if(m1 > 0) {
	m1 = bottom_9;
	animation_m10 = setInterval('timer_m10()',t);
}
$("#m1").css("top", m1)
if (!(m1 % distance)) clearInterval(animation_m1)
}

function timer_m10() {
m10 = parseInt($("#m10").css("top")) + height
if(m10 > 0) {
	m10 = bottom_5;
	animation_h1 = setInterval('timer_h1()',t);
}
$("#m10").css("top", m10)
if (!(m10 % distance)) clearInterval(animation_m10)
}

function timer_h1() {
h1 = parseInt($("#h1").css("top")) + height
if(h1 > 0) {
	h1 = bottom_9;
	if(h10 == 0) {h1 = bottom_3}
	animation_h10 = setInterval('timer_h10()',t);
}
$("#h1").css("top", h1)
if (!(h1 % distance)) clearInterval(animation_h1)
}

function timer_h10() {
h10 = parseInt($("#h10").css("top")) + height
if(h10 > 0) {
	h10 = bottom_2;
	animation_d1 = setInterval('timer_d1()',t);
}
$("#h10").css("top", h10)
if (!(h10 % distance)) clearInterval(animation_h10)
}

function timer_d1() {
d1 = parseInt($("#d1").css("top")) + height
if(d1 > 0) {
	d1 = bottom_9;
	animation_d10 = setInterval('timer_d10()',t);
}
$("#d1").css("top", d1)
if (!(d1 % distance)) clearInterval(animation_d1)
}

function timer_d10() {
d10 = parseInt($("#d10").css("top")) + height
if(d10 > 0) {
	d10 = bottom_9;
}
$("#d10").css("top", d10)
if (!(d10 % distance)) clearInterval(animation_d10)
}
