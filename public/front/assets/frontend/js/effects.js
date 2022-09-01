$(document).ready(function(){

    $('.radio-wrapper').click(function(){
        $(this).addClass('active');
        $('.radio-wrapper').removeClass('active');
    })


    $('.radio-wrapper.pay').click(function(){
        $("#credit_card_info").css("display","block");
    })
    
    $('.pay-mod span').click(function(){
        $('.pay-mod span').removeClass('active');
        $(this).addClass('active');   	 

    })

   $('.choose-pricing .btn-group .btn').click(function(){
        $('.choose-pricing .btn-group .btn').removeClass('active');
         $('.choose-pricing .btn-group .inpt-first').removeClass('active');
         var placeholder=$('.choose-pricing .btn-group .inpt-first').attr("placeholder");
                         $('.choose-pricing .btn-group .inpt-first').val("");
                         $('.choose-pricing .btn-group .inpt-first').val(placeholder);
        $(this).addClass('active');
		var cvalue = $(this).text();
		
		$("#amountToShow").text(cvalue);
		
		//alert('saf')
    });
   
	$("input.inpt-first").on("input", function(){
	   var cvalue2 = $('.inpt-first').val();
	   $("#amountToShow").text(cvalue2);
	   
   });

    $('.radio-wrapper').click(function(){
        $('.radio-wrapper').removeClass('active');
        $(this).addClass('active');
    })
    $("#1,#s_bank,#3").click(function(){
        $('#creMsg').css('display','none');
    })
    $("#2").click(function(){
        $('#creMsg').css('display','block');
    })

    $('.pay-mod span').click(function(){ 
        $(this).addClass('active');
        if($('.link').hasClass('active')){
           $('#credit_card_info').css('display','block');
        }
        else{
            $('#credit_card_info').css('display','none');
        }

    })
    
    $('.radio-wrapper').click(function(){
        if(paymentMethods.creditCard){ 
           $('.pay-mod span').removeClass('active');  
           $('.pay-mod span:first').addClass('active');
            $('#creMsg').css('display','block');
        }else{
//           $('.pay-mod-list span:second').addClass('active');  
        }
    })

    // tooltip hover 
    $(".tooltip").hover(function(){
        $(".tooltip-hover").css("display","block");
    },function(){
        $(".tooltip-hover").css("display","none");
    });


    //  For Select box

    $("#tech").msDropdown(); //no need to pass main css name - it will use default theme
    $("#mycomp").msDropdown({
        mainCSS:'blue'
    }); //you dont have to pass here if you have in select element- data-maincss="blue"
    $("#flat").msDropdown({
        roundedCorner:false
    });
   
    try {
        var pages = $("#pages").msDropdown({
            on:{
                change:function(data, ui) {
                    var val = data.value;
                    if(val!="")
                        window.location = val;
                }
            }
        }).data("dd");

    var pagename = document.location.pathname.toString();
    pagename = pagename.split("/");
    pages.setIndexByValue(pagename[pagename.length-1]);
    $("#ver").html(msBeautify.version.msDropdown);
} catch(e) {
   
    }

    $("#ver").html(msBeautify.version.msDropdown);
        
    $(".selectBox").chosen();
    $(".chzn-select-deselect").chosen({
        allow_single_deselect:true
    });
        
    // for country
    $("#language").on("change",function(){
        $("#lang").submit();     
    }); 
    // For language select
});


