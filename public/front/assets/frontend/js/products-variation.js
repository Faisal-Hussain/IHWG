var get_products_img, frontendLocalizationString;
$(document).ready(function() {
	if($('#hf_base_url').length>0 && $('#lang_code').length>0){
    $.getJSON( $('#hf_base_url').val() + '/resources/lang/'+ $('#lang_code').val() +'/frontend_js.json', function( data ) {
      frontendLocalizationString = data;
    });
  }
  
  /**
   * Variations data handling
   */
  
  //change event   
  $('.variations-content-main').on('change', '.variation-options-lists input:radio', function(){
    var all_set             = false;
    var any_set             = false;
    var current_settings_ary = [];
    
    //count checked radio
    $('.variations-content-main').find('.variation-options-lists input:radio:checked').each( function() {
      var current_settings    = {};
      // Encode entities
      value = $(this).val()
          .replace(/&/g, '&')
          .replace(/"/g, '"')
          .replace(/'/g, "'")
          .replace(/</g, '<')
          .replace(/>/g, '>');
     
      current_settings['attr_name']  = $(this).attr('name');
      current_settings['attr_val']   = value;
      
      current_settings_ary.push( current_settings );
    });
     
    //send selected variations data
    if($('.variations-content-main').find('.variation-options-lists input:radio:checked').length == $('.variations-content-main').find('.variations-line').length){
      all_set = true;
    }
    else{
      any_set = true;
    }
    
    if(all_set && !any_set){
      manage_matching_variations( current_settings_ary );
    }
  });
});

//find matching variations
function manage_matching_variations( selected_options ){
  var getMatchedVariation = find_matching_variations( selected_options );
  
  if(getMatchedVariation !== undefined && getMatchedVariation){
    if(!get_products_img){
      get_products_img = $('#product_single_page .product-main-image img').attr('src');
    }
    
    if(getMatchedVariation._variation_post_img_url){
      $('#product_single_page .selected-variation-product img').attr('src', $('#hf_base_url').val() + getMatchedVariation._variation_post_img_url);
      $('#product_single_page .selected-variation-product').show();
      $('#product_single_page .product-main-content').hide();
    }
    else{
      $('#product_single_page .selected-variation-product').show();
      $('#product_single_page .selected-variation-product img').attr('src', $('#hf_base_url').val() + 'public/images/no-image.png');
      $('#product_single_page .product-main-content').hide();
    }
    
    var price_html = '';
    
    if($('.variations-content-main').length>0 && $('.variations-content-main').data('is_login') == 'yes' && $('.variations-content-main').data('login_user_slug') !== '' && getMatchedVariation._is_role_based_pricing_enable == 1){
       
      if( getMatchedVariation.regular_price_comp_val > getMatchedVariation.regular_price_comp_val){
        price_html += '<span class="offer-price">'+  getMatchedVariation.regular_price +'</span>';
        price_html += '<span class="solid-price">'+ getMatchedVariation.sales_price +'</span>';
      }
      else if(getMatchedVariation.regular_price_comp_val && getMatchedVariation.regular_price_comp_val !=''){
        price_html += '<span class="solid-price">'+ getMatchedVariation.regular_price +'</span>';
      }
    }
    else{
      if( getMatchedVariation._variation_post_regular_price && getMatchedVariation._variation_post_regular_price > 0 && getMatchedVariation._variation_post_sale_price && getMatchedVariation._variation_post_sale_price > 0 && parseFloat(getMatchedVariation._variation_post_regular_price) >  parseFloat(getMatchedVariation._variation_post_sale_price) ){
        price_html += '<span class="offer-price">'+  getMatchedVariation._variation_post_regular_price +'</span>';
      }
        price_html += '<span class="solid-price">'+ getMatchedVariation._variation_post_price  +'</span>';
    }
    
    $('.variation-price-label').html( price_html );
    if(getMatchedVariation._variation_post_manage_stock == 1 && getMatchedVariation._variation_post_manage_stock_qty > 0){
      $('.variation-stock-label').html( 'Available stock: ' +  getMatchedVariation._variation_post_manage_stock_qty );
      $('#available_stock_val').val( getMatchedVariation._variation_post_manage_stock_qty );
      $('#backorder_val').val( getMatchedVariation._variation_post_back_to_order );
      $('.variations-content-main').find('.add-to-cart-content #quantity').attr('max', getMatchedVariation._variation_post_manage_stock_qty);
    }
    else{
      $('.variation-stock-label').html('');
      $('#available_stock_val').val('');
      $('#backorder_val').val( getMatchedVariation._variation_post_back_to_order );
      $('.variations-content-main').find('.add-to-cart-content #quantity').attr('max', '');
    }
    
    //offer price message
    var price_msg_html = ''; 
    if( getMatchedVariation._variation_post_regular_price && getMatchedVariation._variation_post_sale_price && parseFloat(getMatchedVariation._variation_post_regular_price) >  parseFloat(getMatchedVariation._variation_post_sale_price) && getMatchedVariation._variation_post_sale_price_start_date && getMatchedVariation._variation_post_sale_price_end_date){
      price_msg_html = '<div class="offer-message-container"><p class="offer-message-label">&#10148; '+ frontendLocalizationString.offer_msg + ' <i>' + getMatchedVariation._variation_post_sale_price_start_date +' ' + frontendLocalizationString.offer_msg + ' ' + getMatchedVariation._variation_post_sale_price_end_date +'</i></p><br></div>';

      $('.variation-price-label').after( price_msg_html );
    }
    
    var stock_message = '';
    if($('.add-to-cart-content').find('.stock-message').length>0){
      $('.add-to-cart-content').find('.stock-message').remove();
    }
    
    if($('.stock-message-error').length>0){
      $('.stock-message-error').remove();
    }
      
    if(getMatchedVariation._variation_post_manage_stock == 1 && getMatchedVariation._variation_post_manage_stock_qty == 0 && getMatchedVariation._variation_post_back_to_order == 'variation_not_allow'){
      
      if($('.stock-message-error').length>0){
        $('.stock-message-error').remove();
      }
      stock_message = '<div class="stock-message-error"><p>&#10148; '+ frontendLocalizationString.out_of_stock +'</p></div>';
      $('.variations-data').after( stock_message );
    }
    else if(getMatchedVariation._variation_post_manage_stock == 0 && getMatchedVariation._variation_post_stock_availability == 'variation_in_stock'){
      $('#selected_variation_id').val( getMatchedVariation.id );

      if($('.no-product-available-msg').length>0){
        $('.no-product-available-msg').remove();
      }

      $('.add-to-cart-content').fadeIn();
    }
    else if(getMatchedVariation._variation_post_manage_stock == 0 && getMatchedVariation._variation_post_stock_availability == 'variation_out_of_stock'){
      if($('.stock-message-error').length>0){
        $('.stock-message-error').remove();
      }
      
      stock_message = '<div class="stock-message-error"><p>&#10148; '+ frontendLocalizationString.out_of_stock +'</p></div>';
      $('.variations-data').after( stock_message );
    }
    else{
      if(getMatchedVariation._variation_post_back_to_order == 'variation_allow_notify_customer'){
        if($('.add-to-cart-content').find('.stock-message').length>0){
          $('.add-to-cart-content').find('.stock-message').remove();
        }
        
        stock_message = '<div class="stock-message"><p>&#10148; '+ frontendLocalizationString.stock_available +'</p></div>';
        $('.add-to-cart-content').append( stock_message );
      }
      
      $('#selected_variation_id').val( getMatchedVariation.id );

      if($('.no-product-available-msg').length>0){
        $('.no-product-available-msg').remove();
      }

      $('.add-to-cart-content').fadeIn();
    }
  }
  else{
    $('#product_single_page .selected-variation-product').hide();
    $('#product_single_page .selected-variation-product img').attr('src', '');
    $('#product_single_page .product-main-content').show();

    if($('.offer-message-container').length>0){
      $('.offer-message-container').remove();
    }

    if($('.stock-message').length>0){
      $('.stock-message').remove();
    }

    $('#selected_variation_id').val( '' );

    $('.add-to-cart-content').fadeOut();

    if($('.variations-data').length > 0){
      if($('.no-product-available-msg').length>0){
        $('.no-product-available-msg').remove();
      }

      $('.variations-data').after('<div class="no-product-available-msg" style="padding-top:10px;color:#FF0000; font-weight:bold;">'+ frontendLocalizationString.no_product_available_label +'</div>');
    }
  }
}

function find_matching_variations(selected_options){
  var selected_variations = {};
  var loop_variations = {};
  var variations = $('.variations-content-main').data('variations_details');
  
  //selected option loop
  if(selected_options.length > 0){
    for(var selected_count = 0; selected_count < selected_options.length; selected_count ++){
      selected_variations[ stringResize(selected_options[ selected_count ].attr_name) ] = stringResize(selected_options[ selected_count ].attr_val);
    }
  }  
  
  //all variations loop
  if(variations.length > 0){
    
    //all attr val match
    for(var variation_count = 0; variation_count < variations.length; variation_count ++){
      if(variations[variation_count].status == 1){
        var get_variation_comb = variations[variation_count]._variation_array_data;
        
        if(get_variation_comb.length > 0){
          for(var count = 0; count<get_variation_comb.length; count ++){
            loop_variations[ stringResize(get_variation_comb[count].attr_name) ] = stringResize(get_variation_comb[count].attr_val);
          }
        }
        
        if( !$.isEmptyObject( selected_variations ) && !$.isEmptyObject( loop_variations ) ){
          if( JSON.stringify(selected_variations) === JSON.stringify(loop_variations) ){
            return variations[variation_count];
          }
        }
      }
    }
    
    //some attr val match
    var loop_variations2 = {};
    var remove_attr_name;
    
    for(var variation_count = 0; variation_count < variations.length; variation_count ++){
      if(variations[variation_count].status == 1){
        var get_variation_comb = variations[variation_count]._variation_array_data;
        
        if(get_variation_comb.length > 0){
          for(var count = 0; count<get_variation_comb.length; count ++){
            if(get_variation_comb[count].attr_val != 'all'){
              loop_variations2[ stringResize(get_variation_comb[count].attr_name) ] = stringResize(get_variation_comb[count].attr_val);
            }
            if(get_variation_comb[count].attr_val == 'all'){
              remove_attr_name = get_variation_comb[count].attr_name;
            }
          }
        }
        
        delete selected_variations[remove_attr_name];
        
        if( !$.isEmptyObject( selected_variations ) && !$.isEmptyObject( loop_variations2 ) ){
          if( JSON.stringify(selected_variations) === JSON.stringify(loop_variations2) ){
            return variations[variation_count];
          }
        }
      }
    }
    
    //any attr
    var loop_variations3 = {};
    var all_variation = {};
    
    for(var variation_count = 0; variation_count < variations.length; variation_count ++){
      if(variations[variation_count].status == 1){
        var get_variation_comb = variations[variation_count]._variation_array_data;
        
        if(get_variation_comb.length > 0){
          for(var count = 0; count<get_variation_comb.length; count ++){
            if(get_variation_comb[count].attr_val != 'all'){
              loop_variations3[ stringResize(get_variation_comb[count].attr_name) ] = stringResize(get_variation_comb[count].attr_val);
            }
            if(get_variation_comb[count].attr_val == 'all'){
              all_variation[ stringResize(get_variation_comb[count].attr_name) ] = stringResize(get_variation_comb[count].attr_val);
            }
          }
        }
        
        if( $.isEmptyObject( loop_variations3 ) && !$.isEmptyObject( all_variation ) ){
          return variations[variation_count];
        }
      }
    }
  }
}

function stringResize(str){
  return str
    .toString()
    .toLowerCase()
    .replace(/\s+/g, '-')           
    .replace(/[^\w\-]+/g, '')       
    .replace(/\-\-+/g, '-')         
    .replace(/^-+/, '')             
    .replace(/-+$/, '');
}