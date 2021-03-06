//= require jquery
//= require tether
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-sprockets
//= require modernizr
//= require_tree .

$(document).on("turbolinks:load", function() {
  if ($(".nav-pills")) {
    function handler( event ) {
      const target = $( event.target );
        if ( target.is( "div.overlay" ) || target.is( "a.expand" )) {
            event.preventDefault();
            $('.effects').hide()
            target.parents(".effects").siblings(".modal").toggle();
        }

        if (target.is( ".modal" ) ) {
            $('.effects').show()
            target.toggle();        
        }
    }

    $( "div.overlay" ).click( handler )
    $( ".modal").click( handler )

    // Image Overlay Hover Effects jQuery
    if (Modernizr.touch) {
        // show the close overlay button
        $(".close-overlay").removeClass("hidden");
        // handle the adding of hover class when clicked
        $(".img").click(function(e){
            if (!$(this).hasClass("hover")) {
                $(this).addClass("hover");
            }
        });
        // handle the closing of the overlay
        $(".close-overlay").click(function(e){
            e.preventDefault();
            e.stopPropagation();
            if ($(this).closest(".img").hasClass("hover")) {
                $(this).closest(".img").removeClass("hover");
            }
        });
    } else {
        // handle the mouseenter functionality
        $(".img").mouseenter(function(){
            $(this).addClass("hover");
        })
        // handle the mouseleave functionality
        .mouseleave(function(){
            $(this).removeClass("hover");
        });
    }
  }
});