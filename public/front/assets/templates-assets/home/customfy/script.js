$(document).ready(function(){
  if($('.slick-featured-items').length>0){
    $('.slick-featured-items').slick({
      infinite: true,
      slidesToShow: 3,
      slidesToScroll: 3,
      autoplay: true,
      responsive: 
      [
        {
          breakpoint:570,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        },
        {
          breakpoint:768,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 2
          }
        }
      ]
    });
  }
  
  if($('.slick-recommended-items').length>0){
    $('.slick-recommended-items').slick({
      infinite: true,
      slidesToShow: 3,
      slidesToScroll: 3,
      autoplay: true,
      responsive: 
      [
        {
          breakpoint:570,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        },
        {
          breakpoint:768,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 2
          }
        }
      ]
    });
  }
  
  if($('.brands-list-content').length>0){
    $('.brands-list-content').slick({
      infinite: true,
      slidesToShow: 5,
      slidesToScroll: 5,
      autoplay: true,
      responsive: 
      [
        {
          breakpoint:570,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 2
          }
        },
        {
          breakpoint:768,
          settings: {
            slidesToShow: 3,
            slidesToScroll: 3
          }
        }
      ]
    });
  }
});