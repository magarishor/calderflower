
jQuery(function($){
     // Home Banner Slider
     $('.slider-for').slick({
         slidesToShow: 1,
         arrows: false,
         fade: false,
         asNavFor: '.slider-nav'
     });
     $('.slider-nav').slick({
         slidesToShow: 1,
         asNavFor: '.slider-for',
         dots: true,
         arrows: false,
         focusOnSelect: true,
         fade: false
     });
     
    // scroll down
    $(".fa-chevron-down").click(function () {
        $("html,body").animate({
            scrollTop: $(".featured-work").offset().top
        });
    });

    //body shift
    if ($(window).width() > 1366) {
        var container_off = $("#header .container").offset().left;
        var get_diff = 315 - container_off;

        jQuery.fn.clickToggle = function (a, b) {
            function cb() {
                [b, a][this._tog ^= 1].call(this);
            }
            return this.on("click", cb);
        };
        $('#dp-hamburger').clickToggle(function () {
                $("#site-wrapper").css("left", get_diff + 90);
                console.log(get_diff);
                $("#header").css("position", "absolute");
            },
            function () {
                $("#site-wrapper").css("left", 0);
                $("#header").css("position", "fixed");
                console.log(get_diff);

            });
    }

     var is_chrome = !!window.chrome && !is_opera;
     var is_explorer = typeof document !== 'undefined' && !!document.documentMode && !isEdge;
     var is_firefox = typeof window.InstallTrigger !== 'undefined';
     var is_safari = /^((?!chrome|android).)*safari/i.test(navigator.userAgent);
     var is_opera = !!window.opera || navigator.userAgent.indexOf(' OPR/') >= 0;

     if (is_safari){
          jQuery.fn.clickToggle = function (a, b) {
              function cb() {
                  [b, a][this._tog ^= 1].call(this);
              }
              return this.on("click", cb);
          };
          $('#dp-hamburger').clickToggle(function () {
                  $("#site-wrapper").css("left", get_diff + 90);
                  console.log(get_diff);
                  $("#header , #site-wrapper").css("left", "315px");
              },
              function () {
                  $("#site-wrapper").css("left", 0);
                  $("#header , #site-wrapper").css("left", "0");
                  console.log(get_diff);

              });
     }

   
});


    function dpToggleMenu(x) {
        x.classList.toggle("change");
        document.getElementById("site-navigation").classList.toggle("shiftRight");
        document.getElementById("site-wrapper").classList.toggle("shiftRight");
        // text toggle
        var x = document.getElementById("menu-text");
        if (x.innerHTML === "Menu") {
            x.innerHTML = "Close";
        } else {
            x.innerHTML = "Menu";
        }
    }

// const abc = new Vue({
//     el: "#site-wrapper",
//     data: {
//         shiftRight: false,
//         change: false,
//         menu: "Menu"
//     },
//     methods: {
//         dpToggleMenu: function () {
//              this.shiftRight = !this.shiftRight;
//              this.change = !this.change;
//              this.menu = this.change ? 'Close' : 'Menu';
//         }
//     }
// })