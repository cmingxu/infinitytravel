$("#primary_navigation tbody tr td").hover(function(){
	$(this).children().addClass("show_menu");
	$inner_menu=$(this).find("ul").html();
	var appendEle="<div class='corner_top_left'></div><div class='corner_top_right'></div><div class='corner_bottom_right'></div><div class='corner_bottom_left'></div><div class='side_top'></div><div class='side_right'></div><div class='side_bottom'></div><div class='side_left'></div>";
	$(this).find(".menu").addClass("show_menu").html("<div class='outset_content'><div class='inset_content'></div></div>").find(".inset_content").html("<ul>"+$inner_menu+"</ul>").parents(".menu").append(appendEle);
},function(){
	$(this).children().removeClass("show_menu");
	$inner_menu=$(this).find("ul");
	$(this).find(".menu").removeClass("show_menu").html($inner_menu);
});
// popout mask onclick remove
$("#popout_modal_mask").live("click",function(){
	$(".search_modal").hide();
	$("#popout_modal").hide();
	$(this).remove();
});
function set_compare(){
	if($.cookie("trip_compare")){
		$("span#saved_trip_count").html($.cookie("trip_compare").split(",").length);
	}else{
		$("span#saved_trip_count").html("0");
		$.cookie("trip_compare","", { expires: 7, path: '/' })
	}
}
$(document).ready(function(){
	set_compare();
})
function largeMap(a){
	$('<div id="largeMap"><div class="close" onclick="largeMapClose();">&times;</div><img src='+a.lastChild.src+' alt="" /></div>').appendTo('body');
	halfWidth=$("#largeMap img").width()/2;
	$('#largeMap').attr("style","margin-left:-"+halfWidth+"px");
	$('<div id="popout_modal_mask"></div>').appendTo("body");
}
function largeMapClose(){
	$('#largeMap').remove();
	$('#popout_modal_mask').remove();
}
function slide_show_banner(){
	if($(".slide_show_banner img").size()>1){
	  $(".slide_show_banner").slidesjs({
	    pagination: {
	      active: true,
	      effect: "fade"
	    },
	    play: {
	      active: true,
	      effect: "fade",
	      interval: 10000,
	      auto: true,
	      swap: false,
	      pauseOnHover: false,
	      restartDelay: 2500
	    },
		fade: {
			speed: 1000
		}
	  });
	};
}
slide_show_banner()