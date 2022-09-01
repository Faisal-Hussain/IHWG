$(document).ready(function(){

	$.fn.wysiwyg = function ( options ) {

		var iframe = $('<iframe class="wysiwyg">');

		$(this).replaceWith(iframe);

		iframe[0].contentDocument.body.innerHTML = $(this).text();

		iframe[0].contentDocument.designMode = "On";

		if ( iframe[0].contentWindow )
		{

			iframe[0].contentWindow.document.open();
			// optionally write content here
			iframe[0].contentWindow.document.close();
			iframe[0].contentWindow.document.designMode = "on";
			iframe[0].contentWindow.document.body.innerHTML = $(this).text();

		}

		iframe[0].contentDocument.execCommand('styleWithCSS', true, null);

		if ( options.size )
		{
			if (options.size.height)
			{
				iframe.height(options.size.height);
			}

			if (options.size.width)
			{
				iframe.width(options.size.width);
			}
		}

		iframe[0].contentDocument.execCommand('enableObjectResizing', false, false);
		iframe[0].contentDocument.execCommand('useCSS', true, null);


// Click ready control object

		if ( options.controls )
		{
			if ( options.controls.bold )
			{
				options.controls.bold.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('bold', false, null);
				});
			}

			if ( options.controls.removeFormat )
			{
				options.controls.removeFormat.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('removeFormat', false, null);
				});
			}

			if ( options.controls.selectAll )
			{
				options.controls.selectAll.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('selectAll', false, null);
				});
			}

			if ( options.controls.paste )
			{
				options.controls.paste.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('paste', false, null);
				});
			}

			if ( options.controls.cut )
			{
				options.controls.cut.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('cut', false, null);
				});
			}

			if ( options.controls.delete )
			{
				options.controls.delete.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('delete', false, null);
				});
			}

			if ( options.controls.forwardDelete )
			{
				options.controls.forwardDelete.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('forwardDelete', false, null);
				});
			}		

			if ( options.controls.increaseFontSize )
			{
				options.controls.increaseFontSize.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('increaseFontSize', false, null);
				});
			}

			if ( options.controls.copy )
			{
				options.controls.copy.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('copy', false, null);
				});
			}

			if ( options.controls.undo )
			{
				options.controls.undo.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('undo', false, null);
				});
			}

			if ( options.controls.redo )
			{
				options.controls.redo.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('redo', false, null);
				});
			}


			if ( options.controls.unlink )
			{
				options.controls.unlink.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('unlink', false, null);
				});
			}

			if ( options.controls.indent )
			{
				options.controls.indent.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('indent', false, null);
				});
			}	

			if ( options.controls.outdent )
			{
				options.controls.outdent.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('outdent', false, null);
				});
			}	

			if ( options.controls.italic )
			{
				options.controls.italic.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('italic', false, null);
				});
			}

			if ( options.controls.underline )
			{
				options.controls.underline.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('underline', false, null);
				});
			}

			if ( options.controls.orderedList )
			{
				options.controls.orderedList.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('insertOrderedList', false, null);
				});
			}

			if ( options.controls.unOrderedList )
			{
				options.controls.unOrderedList.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('insertUnorderedList', false, null);
				});
			}

			if ( options.controls.justifyCenter )
			{
				options.controls.justifyCenter.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('justifyCenter', false, null);
				});			
			}

			if ( options.controls.justifyLeft )
			{
				options.controls.justifyLeft.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('justifyLeft', false, null);
				});			
			}

			if ( options.controls.justifyRight )
			{
				options.controls.justifyRight.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('justifyRight', false, null);
				});			
			}

			if ( options.controls.justifyFull )
			{
				options.controls.justifyFull.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('justifyFull', false, null);
				});			
			}

			if ( options.controls.insertHorizontalRule )
			{
				options.controls.insertHorizontalRule.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('insertHorizontalRule', false, null);
				});			
			}	

			if ( options.controls.subscript )
			{
				options.controls.subscript.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('subscript', false, null);
				});			
			}	

			if ( options.controls.superscript )
			{
				options.controls.superscript.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('superscript', false, null);
				});			
			}

			if ( options.controls.strikeThrough )
			{
				options.controls.strikeThrough.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('strikeThrough', false, null);
				});			
			}

			if ( options.controls.insertParagraph )
			{
				options.controls.insertParagraph.click(function(e){
					e.preventDefault();
					iframe[0].contentDocument.execCommand('insertParagraph', false, null);
				});			
			}

		}


// input controls object

		if ( options.inputControls )
		{
			if ( options.inputControls.fontName )
			{
				options.inputControls.fontName.change(function(e){
					e.preventDefault();
					var val = options.inputControls.fontName.val();
					iframe[0].contentDocument.execCommand('fontName', false, val);
					// console.log(val); 
				});
			}

			if ( options.inputControls.createLink )
			{
				options.inputControls.createLink.change(function(e){
					e.preventDefault();
					var val = options.inputControls.createLink.val();
					iframe[0].contentDocument.execCommand('createLink', false, val);
					// console.log(val); 
				});
			}

			if ( options.inputControls.fontSize )
			{
				options.inputControls.fontSize.change(function(e){
					e.preventDefault();
					var val = options.inputControls.fontSize.val();
					iframe[0].contentDocument.execCommand('fontSize', false, val);
					// console.log(val); 
				});
			}

			if ( options.inputControls.fontColor )
			{
				options.inputControls.fontColor.change(function(e){
					e.preventDefault();
					var val = options.inputControls.fontColor.val();
					iframe[0].contentDocument.execCommand('foreColor', false, val);
					// console.log(val); 
				});
			}

			if ( options.inputControls.insertImage )
			{
				options.inputControls.insertImage.change(function(e){
					e.preventDefault();
					var val = options.inputControls.insertImage.val();
					iframe[0].contentDocument.execCommand('insertImage', false, val);
					// console.log(val); 
				});
			}

			if ( options.inputControls.insertHTML )
			{
				options.inputControls.insertHTML.change(function(e){
					e.preventDefault();
					var val = options.inputControls.insertHTML.val();
					iframe[0].contentDocument.execCommand('insertHTML', false, val);
					// console.log(val); 
				});
			}

			if ( options.inputControls.hiliteColor )
			{
				options.inputControls.hiliteColor.change(function(e){
					e.preventDefault();
					var val = options.inputControls.hiliteColor.val();
					iframe[0].contentDocument.execCommand('hiliteColor', false, val);
					// console.log(val); 
				});
			}		
		}



// defaults object
	if ( options.defaults )
	{
		if ( options.defaults.fontFamily ) 
		{
			iframe[0].contentDocument.body.style.fontFamily = options.defaults.fontFamily;
		}

		if ( options.defaults.border ) 
		{
			iframe[0].style.border = options.defaults.border;
		}
	}


// CSS Object

		if ( options.css )
		{
			iframe.css(options.css);
		}

		return new WYSIWYG(iframe);

	};

	function htmlEntities(str) {
	    return String(str).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
	}

	function WYSIWYG(iframe)
	{
		var editor = iframe[0].contentDocument;
		this.doAction = function(actionName, value){
			if( value )
			{
				editor.execCommand(actionName, false, value);
			} else {
				iframe[0].contentDocument.execCommand(actionName, false, null);
			}
		}

		this.html = function()
		{
			return iframe[0].contentDocument.body.innerHTML;
		}

		this.rawHTML = function()
		{
			return htmlEntities(this.html());
		}

		this.getIframe = function()
		{
			return iframe;
		}

	}

});

