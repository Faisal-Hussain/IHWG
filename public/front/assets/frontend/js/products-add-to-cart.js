var frontendLocalizationString;
$(document).ready(function() 
{
	if($('#hf_base_url').length>0 && $('#lang_code').length>0){
    $.getJSON( $('#hf_base_url').val() + '/resources/lang/'+ $('#lang_code').val() +'/frontend_js.json', function( data ) {
      frontendLocalizationString = data;
    });
  }
  /**
	 * product add to cart
	 */

  //ajax request for add to cart
  if($('.add-to-cart-bg').length>0 || $('.single-page-add-to-cart').length>0){
    dynamicAddToCart();
  }
});

var dynamicAddToCart= function(){
  $('.add-to-cart-bg, .single-page-add-to-cart').on('click', function(e){
    e.preventDefault();
    var dataObj = {};
    var selected_option = {};
    
    dataObj['product_id'] = $(this).data('id');

    if($('#quantity').length>0){
      dataObj['qty'] = parseInt( $('#quantity').val() );
    }
    else{
      dataObj['qty'] = 1;
    }
    
    if($('#backorder_val').length>0 && ($('#backorder_val').val() == 'not_allow' || $('#backorder_val').val() == 'variation_not_allow') && $('#available_stock_val').val() > 0 && dataObj.qty > $('#available_stock_val').val()){
      alert("Maximum quantity allow " + $('#available_stock_val').val());
      return false;
    }
    
    if($('#selected_variation_id').length>0 && $('#selected_variation_id').val()){
      dataObj['variation_id'] = parseInt( $('#selected_variation_id').val() );
    }
    
    if($('.variations-content-main').length>0){
      $('.variations-content-main .variations-line').each(function(){
        selected_option[ $(this).find('.variation-attr-name').html() ] = $(this).find('.variation-attr-value input[type="radio"]:checked:checked').data('value');
      });
    }
    
    dataObj['selected_option'] = selected_option;
    
    $('#shadow-layer, .add-to-cart-loader').show();
    $.ajax({
        url: $('#hf_base_url').val() + '/ajax/add-to-cart',
        type: 'POST',
        cache: false,
        datatype: 'json',
        headers: { 'X-CSRF-TOKEN' : $('meta[name="csrf-token"]').attr('content') },
        data: dataObj,

        success: function(data){
          if(data && data == 'zero_price'){
            $('#shadow-layer, .add-to-cart-loader').hide();
            swal("" , frontendLocalizationString.price_can_not_be_zero );
          }
          else if(data && data == 'out_of_stock'){
            $('#shadow-layer, .add-to-cart-loader').hide();
            swal("" , frontendLocalizationString.product_out_of_stock );
          }
          else if(data && data == 'vendor_not_same'){
            $('#shadow-layer, .add-to-cart-loader').hide();
            swal("" , frontendLocalizationString.vendor_not_same_msg );
          }
          else if(data && data == 'stock_over'){
            $('#shadow-layer, .add-to-cart-loader').hide();
            swal("" , 'May be you try with over quantity!' );
          }
          else if(data && data == 'item_added'){
            var get_mini_cart_id = $('.show-mini-cart').data('id');
            $.ajax({
                url: $('#hf_base_url').val() + '/ajax/get-mini-cart-data',
                type: 'POST',
                cache: false,
                data: { mini_cart_id : get_mini_cart_id },
                datatype: 'json',
                headers: { 'X-CSRF-TOKEN' : $('meta[name="csrf-token"]').attr('content') },

                success: function(data){
                  if(data.status && data.status == 'success' && data.type == 'mini_cart_data' && data.html){

                    $('.mini-cart-content').html( data.html );
                    $('#shadow-layer, .add-to-cart-loader').hide();

                    if(get_mini_cart_id == 1){
                      if($('.show-mini-cart').length>0){
                        $('.show-mini-cart').off('click').on('click', function(e){
                          e.preventDefault();
                          e.stopPropagation();

                          $('#list_popover').fadeToggle();return false;
                        });
                      }
                    }
                    else if(get_mini_cart_id == 2){
                      $body = $('body');  
                      $body.on('click', 'header .mini-cart-content',function(e) {
                        $('header .mini-cart-content').find(".mini-cart-dropdown").addClass('open');
                        e.preventDefault();
                      });

                      $body.on('click', 'header .mini-cart-content .close-cart', function(e) {
                        e.preventDefault();
                        e.stopPropagation();
                        $('header .mini-cart-content').find(".mini-cart-dropdown").removeClass('open');
                      });

                      $body.on('click', 'header .mini-cart-content .title, header .mini-cart-content .img, header .mini-cart-content .delete, header .mini-cart-content .cart-bottom .checkout, header .mini-cart-content .cart-bottom .cart', function(e) {
                        e.preventDefault();
                        e.stopPropagation();
                        window.location.href = $(this).find('a').attr('href');
                      });
                    }
                    
                    if(get_mini_cart_id == 1){
                      $('#list_popover').fadeIn();
                    }
                    else if(get_mini_cart_id == 2){
                      $('header .mini-cart-content').find(".mini-cart-dropdown").addClass('open');
                    }
                    
                    $("html, body").animate({ scrollTop: 0 }, "slow");
                    return false;
                  }
                },
                error:function(){}
            });
          }
        },
        error:function(){}
    });
  });
}