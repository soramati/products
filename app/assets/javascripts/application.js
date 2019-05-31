// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require popper
//= require jquery3
//= require jquery_ujs
//= require bootstrap-sprockets

document.addEventListener('turbolinks:load', function(){
	$(document).on("ajax:success", function() {

	document.getElementById('modal_iframe').contentWindow.location.replace('card/modal');

	    var navClass = $(this).attr("class"),
	        id = $(this).attr("id");
		            
	        $("#modal").fadeIn();
		    $(this).addClass("open");
		    return false;
		});
		 
		$(".modalClose").click(function(){
		    $(this).parents(".modal").fadeOut();
		    $(".modalOpen").removeClass("open");
		    return false;
		}); 


});


		        
