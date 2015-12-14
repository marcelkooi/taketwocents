$(document).ready(function() {      

  $("#swipeable_card").swipe( {

    swipeLeft:function(event, direction, distance, duration, fingerCount, fingerData) {
      $("#voteno").trigger('click');
    }, 
    swipeRight:function(event, direction, distance, duration, fingerCount, fingerData) {
      $("#voteyes").trigger('click');
    }, 

    threshold:20
  });
});
