//= require jquery.jqplot.min
//= require jqplot.dateAxisRenderer
//= require_self

var railsrumble_start = opening;
var railsrumble_stop = new Date 
railsrumble_stop.setUTCFullYear(2012);
railsrumble_stop.setUTCMonth(9);
railsrumble_stop.setUTCDate(15);
railsrumble_stop.setUTCHours(0);
railsrumble_stop.setUTCMinutes(0);
railsrumble_stop.setUTCSeconds(0);


var path = "http://www.48rails.it/leaderboard/"

var links = ['48rails', 'load_constancy', 'team_balance', 'team_sinergy', 'stakanov']

$(window).ready(function() {
  var location = window.location;
  var next_index;
  if(location.indexOf('/leaderboard/48rails') != -1) { next_index = 1 }
  if(location.indexOf('/leaderboard/load_constancy') != -1) { next_index = 2 }  
  if(location.indexOf('/leaderboard/team_balance') != -1) { next_index = 3 }
  if(location.indexOf('/leaderboard/team_sinergy') != -1) { next_index = 4 } 
  if(location.indexOf('/leaderboard/stakanov') != -1) { next_index = 0 }  
 
  setTimeout(function() {window.location = path + links[next_index]}, 5000) 

})

function draw(time_serie, colors) {
  data = []
  $.each(time_serie, function(i,d) { data[i] = eval(d); }) 
  $.each(data, function(i, team) { $.each(team, function(j,c) {  data[i][j][0] *= 1000 } ) })
  $.jqplot('chartdiv', data, { axes: { xaxis: { renderer: $.jqplot.DateAxisRenderer, min: railsrumble_start, max: railsrumble_stop } }, series: [{color: colors[0]},{color: colors[1]},{color: colors[2]},{color: colors[3]},{color: colors[4]},{color: colors[5]},{color: colors[6]}] } );
}