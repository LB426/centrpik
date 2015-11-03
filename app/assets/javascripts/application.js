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

$(document).ready(function(){

  //$( "#AddAnswerToTestQuestion" ).click(function(){
  $( "[name='AddAnswerToTestQuestion']" ).click(function(){
	alert("AddAnswerToTestQuestion");
	acounter = acounter + 1 ;
	var answer =
		'<div class="form-group bs-callout bs-callout-info">' +
		'<div class="row">' +
		'<div class="col-xs-12">' +
		'<label>ответ</label>' +
		'<input class="form-control input-sm" placeholder="введите ответ" name="answers['+ acounter +'][text]">' +
		'</div>' +
		'</div>' +
		'<div class="row">' +
		'<div class="col-xs-12">' +
		'<div class="myborder">' +
		'<code>ответ верный? </code>' +
		'<strong>Да</strong>' +
        '<input type="radio" name="answers['+ acounter +'][right]" value="YES">' +
		'<strong>Нет</strong>' +
		'<input type="radio" name="answers['+ acounter +'][right]" value="NO" checked="checked">' +
		'</div>' +
		'</div>' +
		'</div>' +
		'</div>' ;
	$( "#QuestionsAndAnswers" ).append(answer);
	return false;
  });

  $( "[name='CloseQuestionBtn']" ).click(function(){
	var id = $(this).attr('id');
	$("[id='QBtn_" + id + "']").removeClass( "hidden" );
	$("[id='QBlk_" + id + "']").addClass( "hidden" );
  });

  $( "[name='OpenQuestionBtn']" ).click(function(){
	var id = $(this).attr('id');
	$("[id='QBtn_" + id + "']").addClass( "hidden" );
	$("[id='QBlk_" + id + "']").removeClass( "hidden" );
  });

  $( "#AddQuestionToTest" ).click(function(){
	$("#NewQuestion").removeClass( "hidden" );
	
	return false;
  });

});
