$(document).ready(function(){

	$.fn.simpleEditor = function(){
		
		var options = {
			size : {
				width: "99%",
				height: "300px"
			},
			defaults: {
				"fontFamily": "Calibri"
			},
			css: {
				"border": "1px solid silver",
				"margin": "0 auto"
			}
		};

		var instance = $(this).wysiwyg(options);

		var $iframe = instance.getIframe();

		var theCont = $iframe.parent(".simpleEditorContainer");

		theCont.prepend('<div class="control-btn-wrapper"></div>');

		$(".control-btn-wrapper").append('<button class="control-btn bold-btn"><span class="fa fa-bold"></span></button>');
		$(".control-btn-wrapper").append('<button class="control-btn italic-btn"><span class="fa fa-italic"></span></button>');
		$(".control-btn-wrapper").append('<button class="control-btn underline-btn"><span class="fa fa-underline"></span></button>');

		$(".bold-btn").click(function(){
			instance.doAction("bold");
		});

		$(".italic-btn").click(function(){
			instance.doAction("italic");
		});

		$(".underline-btn").click(function(){
			instance.doAction("underline");
		});

	}
});