$(document).ready(function(){
  $('.product-add-to-cart-content .btn-number, #product_single_page .btn-number, #product_designer .btn-number').click(function(e){
      e.preventDefault();
      
      fieldName = $(this).attr('data-field');
      type      = $(this).attr('data-type');
      var input = $("input[name='"+ fieldName+ "']");
      var currentVal = parseInt(input.val());
      
      if (!isNaN(currentVal)) {
        if(type == 'minus') {
          if(currentVal > input.attr('min')) {
            input.val(currentVal - 1).change();
          } 
          
          if(parseInt(input.val()) == input.attr('min')) {
            $(this).attr('disabled', true);
          }
          
          if(input.attr('max') != ''){
            if(input.attr('max') > parseInt(input.val())){
              $('.plus-control').attr('disabled', false);
            }
          }
          
        } else if(type == 'plus') {
          
          if(input.attr('max') != ''){
            if(currentVal < input.attr('max')) {
              input.val(currentVal + 1).change();
            }

            if(parseInt(input.val()) == input.attr('max')) {
              $(this).attr('disabled', true);
            }
          }
          else{
            input.val(currentVal + 1).change();
          }
          
          if(parseInt(input.val()) > input.attr('min')){
            $('.minus-control').attr('disabled', false);
          }
        }
      } else {
          input.val(1);
      }
  });
		
  $("#product_single_page .input-number, #product_designer .input-number").keydown(function (e) {
      // Allow: backspace, delete, tab, escape, enter and .
      if ($.inArray(e.keyCode, [46, 8, 9, 27, 13]) !== -1 ||
           // Allow: Ctrl+A
          (e.keyCode == 65 && e.ctrlKey === true) || 
           // Allow: home, end, left, right
          (e.keyCode >= 35 && e.keyCode <= 39)) {
               // let it happen, don't do anything
               return;
      }
      // Ensure that it is a number and stop the keypress
      if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
          e.preventDefault();
      }
  });
  
  if($('.product-share-content').length>0){
    $('.product-share-content [data-toggle="tooltip"]').tooltip(); 
  }
  
  $('#related_products .carousel[data-type="multi"] .item').each(function(){
    var next = $(this).next();
    if (!next.length) {
      next = $(this).siblings(':first');
    }
    next.children(':first-child').clone().appendTo($(this));

    for (var i=0;i<2;i++) {
      next=next.next();
      if (!next.length) {
          next = $(this).siblings(':first');
          }

      next.children(':first-child').clone().appendTo($(this));
    }
  });
	
	$('.product-reviews-content .rating-select .btn').on('mouseover', function(){
		$(this).removeClass('btn-light').addClass('btn-warning');
		$(this).prevAll().removeClass('btn-light').addClass('btn-warning');
		$(this).nextAll().removeClass('btn-warning').addClass('btn-light');
	});

	$('.product-reviews-content .rating-select').on('mouseleave', function(){
		active = $(this).parent().find('.selected');
		if(active.length) {
			active.removeClass('btn-light').addClass('btn-warning');
			active.prevAll().removeClass('btn-light').addClass('btn-warning');
			active.nextAll().removeClass('btn-warning').addClass('btn-light');
		} else {
			$(this).find('.btn').removeClass('btn-warning').addClass('btn-light');
		}
	});

	$('.product-reviews-content .rating-select .btn').click(function(){
		if($(this).hasClass('selected')) {
			$('.product-reviews-content .rating-select .selected').removeClass('selected');
		} else {
			$('.product-reviews-content .rating-select .selected').removeClass('selected');
			$(this).addClass('selected');
			
			if($('.product-reviews-content #selected_rating_value').length>0){
				$('.product-reviews-content #selected_rating_value').val( $(this).data('rating_value') );
			}
		}
	});
 
$("#product_image_zoom").elevateZoom({gallery:'product_gallery_image', tint:true, responsive:true, tintColour:'#F90', tintOpacity:0.5, cursor: 'pointer', galleryActiveClass: "active", imageCrossfade: true, loadingIcon: "images/ajax-loader-for-list-delete.gif"}); 

$("#product_image_zoom").bind("click", function() {  
  var ez =   $('#product_image_zoom').data('elevateZoom');
  ez.closeAll();
  return false;
}); 

if($('#quantity').length>0){
  $('#quantity').on('keyup', function(){
    if($(this).attr('max') && $(this).attr('max') != null){
      var min = parseInt(1);
      var max = parseInt($(this).attr('max'));
      var val = parseInt($(this).val());

      if(val > max){
        $(this).val(max);
        return false;
      }
      else if(val < min){
        $(this).val(min);
        return false;
      }
    }
  });
}
});