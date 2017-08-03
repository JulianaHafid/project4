$(function() {

  $("#service_search input").keyup(function() {
    console.log("here")
    $.get($("#service_search").attr("action"), $("#service_search").serialize(), null, "script");
    return false;
  });

  autoType(".type-js",200);



});


function autoType(elementClass, typingSpeed){
  var thhis = $(elementClass);
  thhis.css({
    "position": "relative",
    "display": "inline-block"
  });
  thhis.prepend('<div class="cursor" style="right: initial; left:0;"></div>');
  thhis = thhis.find(".text-js");
  var text = thhis.text().trim().split('');
  var amntOfChars = text.length;
  var newString = "";
  thhis.text("|");
  setTimeout(function(){
    thhis.css("opacity",1);
    thhis.prev().removeAttr("style");
    thhis.text("");
    for(var i = 0; i < amntOfChars; i++){
      (function(i,char){
        setTimeout(function() {
          newString += char;
          thhis.text(newString);
        },i*typingSpeed);
      })(i+1,text[i]);
    }
  },1500);
}


$('.datepicker').datepicker({
    format: 'dd/mm/yyyy'
});

// $(document).ready(function() {
//
//   setInterval(function() {
//
//       $.ajax({
//           type: 'GET',
//           url: '<%= url_for(:action => 'show_partial', :id => @service) %>',
//           data: {},
//           cache: false,
//           success: function(result) {
//               $('#book').html(result)
//           }
//       });
//
//   }, 2000);
//
// });
