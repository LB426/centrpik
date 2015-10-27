// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  $( "#AddAnswerToTestQuestion" ).click(function(){
	//alert("AddAnswerToTestQuestion");			    
	var answer =
		'<div class="form-group bs-callout bs-callout-info">' +
		'<div class="row">' +
		'<div class="col-xs-12">' +
		'<label>ответ</label>' +
		'<input class="form-control input-sm" placeholder="введите ответ">' +
		'</div>' +
		'</div>' +
		'<div class="row">' +
		'<div class="col-xs-12">' +
		'<div class="myborder">' +
		'<code>ответ верный? </code>' +
		'<strong>Да</strong><input type="radio" name="qaz" value="option1">' +
		'<strong>Нет</strong><input type="radio" name="qaz" value="option2">' +
		'</div>' +
		'</div>' +
		'</div>' +
		'</div>' ;
	$( "#QuestionsAndAnswers" ).append(answer);
	return false;
  });
  
});
