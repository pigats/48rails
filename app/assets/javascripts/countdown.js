var opening = new Date;
opening.setUTCFullYear(2012);
opening.setUTCMonth(9);
opening.setUTCDate(13);
opening.setUTCHours(0);
opening.setUTCMinutes(0);
opening.setUTCSeconds(0);

var now = new Date();
var timediff = parseInt((opening.getTime()-now.getTime()) / 1000);

days = parseInt(timediff / (24*60*60));		
timediff -= days*24*60*60;
hours = parseInt(timediff / (60*60));
timediff -= hours*60*60;
mins = parseInt(timediff / 60);
timediff -= mins*60;
secs = timediff;	

d10 = parseInt(days / 10);
d1 = days - (d10*10);
h10 = parseInt(hours / 10);
h1 = hours - (h10*10);
m10 = parseInt(mins / 10);
m1 = mins - (m10*10);
s10 = parseInt(secs / 10);
s1 = secs - (s10*10);

d10 = 0;
d1 = 0;
h10 = 0;
h1 = 0;
m10 = 0;
m1 = 0;
s10 = 0;
s1 = 0;


$(document).ready(function() {
	
	set($("#s1"), s1, 9);
	set($("#s10"), s10, 5);
	set($("#m1"), m1, 9);
	set($("#m10"), m10, 5);
	set($("#h1"), h1, 9);
	set($("#h10"), h10, 2);
	set($("#d1"), d1, 9);
	set($("#d10"), d10, 9);	
	
})


function set(selector, number, max) {
  selector.addClass('flipping')
  setTimeout(function() { 
    selector.removeClass('flipping'); 
    selector.find('.front, .bottom').text(number);
    selector.find('.back, .top').text(number - 1 < 0 ? max : number - 1);
  }, 900)
}

function timer_s1() {
  var max = 9;
  var selector = $('#s1');
  var value = parseInt(selector.children('.top').text());
  if (value == max) { timer_s10() }
  set(selector, value, max);
}

function timer_s10() {
  var max = 5;
  var selector = $('#s10');
  var value = parseInt(selector.children('.top').text());
  if (value == max) { timer_m1() }
  set(selector, value, max);
}

function timer_m1() {
  var max = 9;
  var selector = $('#m1');
  var value = parseInt(selector.children('.top').text());
  if (value == max) { timer_m10() }
  set(selector, value, max);
}

function timer_m10() {
  var max = 5;
  var selector = $('#m10');
  var value = parseInt(selector.children('.top').text());
  if (value == max) { timer_h1() }
  set(selector, value, max);
}

function timer_h1() {
  var max = 9;
  var selector = $('#h1');
  var value = parseInt(selector.children('.top').text());
  if (value == max) { 
    if (parseInt($('#h10').children('.top').text()) == 2) { 
      selector.find('.back, .top').text(3);
      value = 3;
    } 
    timer_h10()  
  }
  set(selector, value, max);
}

function timer_h10() {
  var max = 2;
  var selector = $('#h10');
  var value = parseInt(selector.children('.top').text());
  if (value == max) { timer_d1() }
  set(selector, value, max);
}

function timer_d1() {
  var max = 9;
  var selector = $('#d1');
  var value = parseInt(selector.children('.top').text());
  if (value == max) { timer_d10() }
  set(selector, value, max);
}

function timer_d10() {
  var max = 9;
  var selector = $('#d10');
  var value = parseInt(selector.children('.top').text());
  set(selector, value, max);
}
