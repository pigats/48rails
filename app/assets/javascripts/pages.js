$(document).ready( function() { 
  
  var o = $('img.flower');
  f = o.clone();
  o.hide();
  target = $('[role=main] footer');
  
  flowers();
    
  setInterval('animation()', t);
})

function flowers() { 
  for(var i=0; i<5; i++) {
    _f = f.clone();
    _f.css({bottom: Math.floor(Math.random()*150) + 250, left: Math.floor(Math.random()*50) + 150} );
    target.append(_f);
    _f.animate({left: '+=500px', opacity: '-=1'}, Math.floor(Math.random()*5000) + 10000, function() { $(this).remove() });
  }
}

var f, target
var counter = 0;

function animation() {
  timer_s1()
  if(counter < 2000) {
    counter += t
  } else {
    counter = 0;
    flowers();
  }
  
}