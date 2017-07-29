$(function() {
  $("#service_search input").keyup(function() {
    console.log("here")
    $.get($("#service_search").attr("action"), $("#service_search").serialize(), null, "script");
    return false;
  });
});
