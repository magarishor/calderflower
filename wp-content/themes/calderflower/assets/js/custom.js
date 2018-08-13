const abc = new Vue({
    el: "#site-wrapper",
    data: {
        shiftRight: false,
        change: false,
        menu : "Menu"
    },
    methods: {
        dpToggleMenu(){
            this.shiftRight = !this.shiftRight;
            this.change = !this.change;
            this.menu = this.change ? 'Close' : 'Menu' ;
        }
    }
})


jQuery(function($){
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
            },
            function () {
                $("#site-wrapper").css("left", 0);
                console.log(get_diff);

            });
    }

 
});
