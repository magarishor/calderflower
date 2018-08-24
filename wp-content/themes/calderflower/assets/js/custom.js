jQuery(function($) {
    // Home Banner Slider
    $('.slider-for').slick({
        slidesToShow: 1,
        arrows: false,
        fade: false,
        asNavFor: '.slider-nav',
        autoplay: true,
        autoplaySpeed: 7000
    });
    $('.slider-nav').slick({
        slidesToShow: 1,
        asNavFor: '.slider-for',
        dots: true,
        arrows: false,
        focusOnSelect: true,
        fade: false,
        autoplay: true,
        autoplaySpeed: 7000
    });

    ////////////////////////////////
    //scroll to top on mbl filter //
    ////////////////////////////////
    function scrollTo_filter() {
        if ($(window).width() < 768) {
            $("html,body").animate({
                scrollTop: $(".project-filter").offset().top - 55
            }, 400);
        }

    }

    //on change select value project area
    $('#project-area').selectric().on('change', function() {
        //opacity set before loading post
        $(".project-grid").css("opacity", 0.5);
        //Get selected value
        var project_cat = $('#project-category :selected').val();
        var project_area = $('#project-area :selected').val();
        //ajax call
        ajax_project_filter(project_cat, project_area);

    });

    //on change radio button project area
    $("input:radio[name=radio]").click(function() {
        //set radio2 property checked false
        $("input[name='radio2']").prop('checked', false);
        //Get value
        var project_cat = $("input[name='radio1']:checked").val();
        var project_area = $("input[name='radio']:checked").val();
        //remove popup filterby
        $('.toggle-filter').removeClass("shown");
        $(".modal-backdrop").remove();
        $(".filter-by").hide();
        //ajax call
        ajax_project_filter(project_cat, project_area);

    });


    /* Project area filter function */
    function ajax_project_filter(project_cat, project_area) {

        //ajax filter
        $.ajax({
                url: Calderobj.admin_ajax,
                type: 'POST',
                data: {
                    action: 'project_area_filter',
                    project_area: project_area,
                    project_cat: project_cat,
                },
            })
            .done(function(response) {
                console.log("success");
                $('#project-grids').html(response);
            var success_post_count = count_post_project('totalposts');
            if (parseInt($('#total_post').val(), 10) == success_post_count) {
                $('#loadmore').hide();
                }else{
                $('#loadmore').show();
                }
                $(".project-grid").css("opacity", 1);
                scrollTo_filter();
            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                console.log("complete");
            });
    }

    //on change select value project category
    $('#project-category').selectric().on('change', function() {
        // opacity set
        $(".project-grid").css("opacity", 0.5);
        //Get selected value
        var project_cat = $('#project-category :selected').val();
        var project_area = $('#project-area :selected').val();
        //ajax call
        ajax_cat_filter(project_cat, project_area);

    });

    //on change radio button project category
    $("input:radio[name=radio1]").click(function() {
        //set radio2 property checked false
        $("input[name='radio2']").prop('checked', false);
        var project_cat = $("input[name='radio1']:checked").val();
        var project_area = $("input[name='radio']:checked").val();
        //remove popup filterby
        $('.toggle-filter').removeClass("shown");
        $(".modal-backdrop").remove();
        $(".filter-by").hide();
        //ajax call
        ajax_cat_filter(project_cat, project_area);

    });

    /*Project cat filter function*/
    function ajax_cat_filter(project_cat, project_area) {
        $.ajax({
                url: Calderobj.admin_ajax,
                type: 'POST',
                data: {
                    action: 'project_cat_filter',
                    project_cat: project_cat,
                    project_area: project_area
                },
            })
            .done(function(response) {
                console.log("success");
                $('#project-grids').html(response);
                var success_post_count = count_post_project('totalposts');
                if (parseInt($('#total_post').val(), 10) == success_post_count) {
                $('#loadmore').hide();
                }else{
                $('#loadmore').show();
                }
                $(".project-grid").css("opacity", 1);
                scrollTo_filter();
            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                console.log("complete");
            });
    }

    //on change select sort by
    $('#sort-by').selectric().on('change', function() {
        //get value
        var project_sort_by = $('#sort-by :selected').val();
        //opacity set
        $(".project-grid").css("opacity", 0.5);
        //ajax call
        ajax_filer_sortby(project_sort_by);

    });

    //on change radio sort by
    $("input:radio[name=radio2]").click(function() {
        //set radio property checked false
        $("input[name='radio'], input[name='radio1']").prop('checked', false);
        //get value
        var project_sort_by = $("input[name='radio2']:checked").val();
        //remove popup filterby
        $('.toggle-filter').removeClass("shown");
        $(".modal-backdrop").remove();
        $(".filter-by").hide();
        //ajax call
        ajax_filer_sortby(project_sort_by);

    });

    /*ajax filter sort by function*/
    function ajax_filer_sortby(project_sort_by) {
        $.ajax({
                url: Calderobj.admin_ajax,
                type: 'POST',
                data: {
                    action: 'project_sort_filter',
                    project_sort_by: project_sort_by
                },
            })
            .done(function(response) {
                console.log("success");
                $('#project-grids').html(response);
                var success_post_count = count_post_project('totalposts');
                if (parseInt($('#total_post').val(), 10) == success_post_count) {
                $('#loadmore').hide();
                }else{
                $('#loadmore').show();
                }
                $(".project-grid").css("opacity", 1);
                scrollTo_filter();
            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                console.log("complete");
            });
    }

    /*Loadmore project*/
    $('#loadmore').click(function(ev) {
        //prevent default a href
        ev.preventDefault();
        //post collection array init
        post_collection = [];
        post_collection = count_post_project('ids');
        //get value
        project_cat = $('#project-category :selected').val();
        project_area = $('#project-area :selected').val();
        project_sort_by = $('#sort-by :selected').val();


        $.ajax({
            url: Calderobj.admin_ajax,
            type: 'POST',
            data: {
                action: 'project_load_more',
                postids: post_collection,
                project_area: project_area,
                project_cat: project_cat,
                project_sort_by: project_sort_by,
            },
        })
        .done(function(response) {
            console.log("success");
            $("#project-grids").append(response);
            var success_post_count = count_post_project('totalposts');
            if (parseInt($('#total_post').val(), 10) == success_post_count) {
                $('#loadmore').hide();
            }else{
                $('#loadmore').show();
            }
        })
        .fail(function() {
            console.log("error");
        })
        .always(function() {
            console.log("complete");
        });
    //loadmore hide
    var success_post_count = count_post_project('totalposts');
            if (parseInt($('#total_post').val(), 10) == success_post_count) {
                $('#loadmore').hide();
            }



    });

    //Count Total project and pass exist project ids
    function count_post_project(retrun_type) {
        post_collection_last = [];
        $('#project-grids article').each(function() {
            var postid = $(this).attr('data-id');
            post_collection_last.push(postid);
        });
        if (retrun_type == 'totalposts') {
            return post_collection_last.length;
        } else {
            return post_collection_last;
            }
        }


    // scroll down
    $(".toggle-filter").click(function() {
        $(this).toggleClass("shown");
        $(this).next(".filter-by").slideToggle("fast");
        if ($(".toggle-filter").hasClass("shown")) {
            jQuery("body").append("<div class='modal-backdrop fade show'> </div>");
        } else {
            jQuery(".modal-backdrop").remove();
        }
    });

    // toggle filter mbl
    $(".fa-chevron-down").click(function() {
        $("html,body").animate({
            scrollTop: $(".featured-work").offset().top
        });
    });

    //body shift
    if ($(window).width() > 1366) {
        var container_off = $("#header .container").offset().left;
        var get_diff = 315 - container_off;

        jQuery.fn.clickToggle = function(a, b) {
            function cb() {
                [b, a][this._tog ^= 1].call(this);
            }
            return this.on("click", cb);
        };
        $('#dp-hamburger').clickToggle(function() {
                $("#site-wrapper").css("left", get_diff + 90);
                console.log(get_diff);
            },
            function() {
                $("#site-wrapper").css("left", 0);
                console.log(get_diff);

            });
    }


    //  selectric js
    $('.selectric').selectric({
        disableOnMobile: false
    });

    //fancybox
    // $(".fancybox").fancybox();
    $("a.grouped_elements").fancybox({
        'transitionIn': 'elastic',
        'transitionOut': 'elastic',
        'speedIn': 0,
        'speedOut': 0,
        'overlayShow': true
    });

    $(".inline-popup").fancybox({});

    var is_chrome = !!window.chrome && !is_opera;
    var is_explorer = typeof document !== 'undefined' && !!document.documentMode && !isEdge;
    var is_firefox = typeof window.InstallTrigger !== 'undefined';
    var is_safari = /^((?!chrome|android).)*safari/i.test(navigator.userAgent);
    var is_opera = !!window.opera || navigator.userAgent.indexOf(' OPR/') >= 0;

    if (is_safari) {
        jQuery.fn.clickToggle = function(a, b) {
            function cb() {
                [b, a][this._tog ^= 1].call(this);
            }
            return this.on("click", cb);
        };
        $('#dp-hamburger').clickToggle(function() {
                $("#site-wrapper").css("left", get_diff + 90);
                console.log(get_diff);
                $("#header , #site-wrapper").css("left", "315px");
            },
            function() {
                $("#site-wrapper").css("left", 0);
                $("#header , #site-wrapper").css("left", "0");
                console.log(get_diff);

            });
    }

    // vertical timeline
    var $timeline_block = $('.cd-timeline-block');

    //hide timeline blocks which are outside the viewport
    $timeline_block.each(function() {
        if ($(this).offset().top > $(window).scrollTop() + $(window).height() * 0.75) {
            $(this).find('.cd-timeline-img, .cd-timeline-content').addClass('is-hidden');
        }
    });

    //on scolling, show/animate timeline blocks when enter the viewport
    $(window).on('scroll', function() {
        $timeline_block.each(function() {
            if ($(this).offset().top <= $(window).scrollTop() + $(window).height() * 0.75 && $(this).find('.cd-timeline-img').hasClass('is-hidden')) {
                $(this).find('.cd-timeline-img, .cd-timeline-content').removeClass('is-hidden').addClass('bounce-in');
            }
        });
    });

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