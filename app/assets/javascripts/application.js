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
////////==== require1111 turbolinks1111
//= require_tree .
var acounter = 0;

$(document).ready(function(){

  $( "[name='OpenQuestionBtn']" ).click(function(){
	//alert("OpenQuestionBtn");
	var id = $(this).attr('id');
	$("[id='QBtn_" + id + "']").addClass( "hidden" );
	$("[id='QBlk_" + id + "']").removeClass( "hidden" );
  });

  // добавить вопрос к новому ответу
  //$( "#AddAnswerToTestQuestion" ).click(function(){
  $( "[name='AddAnswerToNewTestQuestionBtn']" ).click(function(){
	//alert("AddAnswerToNewTestQuestion");
	acounter = acounter + 1 ;
	var answer =
		'<div class="form-group bs-callout bs-callout-info">' +
		'<div class="row">' +
		'<div class="col-xs-12">' +
		'<label>ответ</label>' +
		'<input class="form-control input-sm" placeholder="введите ответ"' +
		'name="answers[' + acounter + '][text]">' +
		'</div>' +
		'</div>' +
		'<div class="row">' +
		'<div class="col-xs-12">' +
		'<div class="myborder">' +
		'<code>ответ верный? </code>' +
		'<strong>Да</strong>' +
		'<input type="radio" name="answers[' + acounter + '][right]" value="YES">' +
		'<strong>Нет</strong>' +
		'<input type="radio" name="answers[' + acounter +
		'][right]" value="NO" checked="checked">' +
		'</div>' +
		'</div>' +
		'</div>' +
		'</div>' ;
	$( "#NewQuestionAndHimAnswersBlock" ).append(answer);
	return false;
  });

  // добавить вопрос к существующему ответу
  $( "[name='AddAnswerToTestQuestion']" ).click(function(){
	var id = $(this).attr('id').replace("QAddBtn_","");
	//alert("AddAnswerToTestQuestion " + id);
	acounter = acounter - 1 ;
	var answer =
		'<div class="form-group bs-callout bs-callout-info">' +
		'<div class="row">' +
		'<div class="col-xs-12">' +
		'<label>ответ</label>' +
		'<input class="form-control input-sm" placeholder="введите ответ"' +
		'name="answers[' + acounter + '][text]">' +
		'</div>' +
		'</div>' +
		'<div class="row">' +
		'<div class="col-xs-12">' +
		'<div class="myborder">' +
		'<code>ответ верный? </code>' +
		'<strong>Да</strong>' +
		'<input type="radio" name="answers[' + acounter + '][right]" value="YES">' +
		'<strong>Нет</strong>' +
		'<input type="radio" name="answers[' + acounter +
		'][right]" value="NO" checked="checked">' +
		'</div>' +
		'</div>' +
		'</div>' +
		'</div>' ;
	$("[id='QBlock_" + id + "']").append(answer);
	return false;
  });
  
  $( "[name='CloseQuestionBtn']" ).click(function(){
	var id = $(this).attr('id');
	$("[id='QBtn_" + id + "']").removeClass( "hidden" );
	$("[id='QBlk_" + id + "']").addClass( "hidden" );
  });

  $( "#AddNewQuestionToTestBtn" ).click(function(){
	$("#NewQuestion").removeClass( "hidden" );
	return false;
  });

  $( "[name='MyAnswBtn']" ).click(function(){
	var id = $(this).attr('id');
	//alert(1);
	$("[id='MyAnswrsBlk_"+id+"']").toggleClass( "hidden" );
	return false;
  });
    
});
