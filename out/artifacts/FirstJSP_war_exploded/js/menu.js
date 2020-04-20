$(document).ready(function(){
    $.easing.def = 'easeOutElastic'
    var opt =$(".navs");
    opt.click(function(){
    $(this).next('ul').slideToggle().siblings('ul').slideUp();
    });
});
