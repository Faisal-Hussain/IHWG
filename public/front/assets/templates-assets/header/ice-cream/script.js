$(document).ready(function(){
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

  inputCounter();
  
  // breakpoint and up  
  $(window).resize(function(){
    if ($(window).width() >= 980){	
      // when you hover a toggle show its dropdown menu
      $("header .header-content-menu .navbar .dropdown-toggle").hover(function () {
         $(this).parent().toggleClass("show");
         $(this).parent().find(".dropdown-menu").toggleClass("show"); 
       });

        // hide the menu when the mouse leaves the dropdown
      $( "header .header-content-menu .navbar .dropdown-menu" ).mouseleave(function() {
        $(this).removeClass("show");  
      });
    }	
  });
  
  //sticky
window.onscroll = function() {stickyFunction()};

var navbar = document.getElementById("sticky_nav");
var sticky = navbar.offsetTop + 100;

function stickyFunction() {
  if ($(window).width() >= 1025){	
    if (window.pageYOffset >= sticky) {
      navbar.classList.add("sticky")
      navbar.classList.add("sticky-nav")
    } else {
      navbar.classList.remove("sticky");
      navbar.classList.remove("sticky-nav");
    }
  }
}

  var timeout1 = false;
  
  if ($('.cop-menu-vertical nav').length > 0) {
    $(document).on({
      mouseenter: function() {
        var $this = $(this),
        windowW = window.innerWidth || $(window).width();

        if (windowW > 1025 && $body.hasClass('touch-device')) {
          $(".cop-menu-vertical .dropdown > a").one("click", false);
        };

        timeout1 = setTimeout(function () {

        $this.addClass('active')
           .find(".dropdown-menu")
           .stop()
           .addClass('hover')
           .fadeIn(200);
          }, 500);
      },
      mouseleave: function(e) {
        var $this = $(this),
          $dropdown = $this.find(".dropdown-menu");

        if($(e.target).parents('.dropdown-menu').length && !$(e.target).parents('.megamenu-submenu').length && !$(e.target).parents('.one-col').length) return;

        if(timeout1 !== false) {
          clearTimeout(timeout1);
          timeout1 = false;
        }

        if($dropdown.length) {
            $dropdown.stop().fadeOut({duration: 0, complete: function() {
              $this.removeClass('active')
                   .find(".dropdown-menu")
                   .removeClass('hover');
            }});
        } else {
          $this.removeClass('active')
                 .find(".dropdown-menu")
                 .removeClass('hover');
        }

        $dropdown.removeAttr('style');

        $body.removeAttr('style');

        $('.stuck-nav').css({
          paddingRight: 'inherit'
        });

        $('.back-to-top').css({
          right: 0
        });
      }
    }, '.cop-menu-vertical nav li');

    $('.multicolumn ul li').hover(function() {
      var $ul = $(this).find('ul:first');

      if ($ul.length) {
        var windW = window.innerWidth,
            windH = window.innerHeight,
            ulW = parseInt($ul.css('width'), 10),
            thisR = this.getBoundingClientRect().right,
            thisL = this.getBoundingClientRect().left;

        if (windW - thisR < ulW) {
          $ul.removeClass('left').addClass('right');
        } else if (thisL < ulW) {
          $ul.removeClass('right').addClass('left');
        } else {
          $ul.removeClass('left right');
        }
        $ul.stop(true, true).fadeIn(300);
      }
    }, function() {
      $(this).find('ul:first').stop(true, true).fadeOut(300).removeAttr('style');
    });

    $('.megamenu-submenu li').hover(function() {
      var $ul = $(this).find('ul:first');

      if ($ul.length) {
        var $dropdownMenu = $(this).parents('.dropdown').find('.dropdown-menu'),
            dropdown_left = $dropdownMenu.get(0).getBoundingClientRect().left,
            dropdown_Right = $dropdownMenu.get(0).getBoundingClientRect().right,
            dropdown_Bottom = $dropdownMenu.get(0).getBoundingClientRect().bottom,
            ulW = parseInt($ul.css('width'), 10),
            thisR = this.getBoundingClientRect().right,
            thisL = this.getBoundingClientRect().left;

        if (dropdown_Right - 20 - thisR < ulW) {
          $ul.removeClass('left').addClass('right');
        } else if (thisL - ulW - 20 < dropdown_left) {
          $ul.removeClass('right').addClass('left');
        } else {
          $ul.removeClass('left right');
        }

        $ul.stop(true, true).fadeIn(300);

        var ul_bottom = $ul.get(0).getBoundingClientRect().bottom;

        if (dropdown_Bottom < ul_bottom) {
          var move_top = dropdown_Bottom - ul_bottom;
          $ul.css({
            top: move_top
          });
        }
      }
    }, function() {
      $(this).find('ul:first').stop(true, true).fadeOut(300).removeAttr('style');
    });

    $('.megamenu div').hover(function() {
      $(this).children('.title-underline').addClass('active');
    }, function() {
      $(this).children('.title-underline').removeClass('active');
    });
  }

  if ($('.cop-menu-vertical nav').length > 0) {
      $('.cop-menu-vertical nav li:not(.multicolumn)').hover(function() {
          var menuVerticalHeight = $('.cop-menu-vertical').innerHeight();
          var menuVerticalPopupHeight = $(this).find('.dropdown-menu').innerHeight();
          if( menuVerticalHeight >= menuVerticalPopupHeight ){
            $(this).find('.dropdown-menu').css({
              'minHeight' : menuVerticalHeight
            });
          };
      }, function() {
         $(this).find('.dropdown-menu').removeAttr('style');
      });
  }
});

function inputCounter() {
  $('header .mini-cart-content .input-counter').find('.minus-btn, .plus-btn').click(function( e ) {
      var $input = $(this).parent().find('input');
      var count = parseInt($input.val(), 10) + parseInt(e.currentTarget.className === 'plus-btn' ? 1 : -1, 10);
      $input.val(count).change();
  });
  
  $('header .mini-cart-content .input-counter').find("input").change(function() {
      var _ = $(this);
      var min = 1;
      var val = parseInt(_.val(), 10);
      var max = parseInt(_.attr('size'), 10);
      val = Math.min(val, max);
      val = Math.max(val, min);
      _.val(val);
  })
  .on("keypress", function( e ) {
      if (e.keyCode === 13) {
          e.preventDefault();
      }
  });
};