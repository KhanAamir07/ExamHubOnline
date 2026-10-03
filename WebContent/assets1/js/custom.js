(function ($) {

    "use strict";


    /* =========================================================
       HEADER SCROLL EFFECT
       ========================================================= */

    $(window).scroll(function () {

        var scroll = $(window).scrollTop();
        var box = $('.header-text').height();
        var header = $('header').height();

        if (scroll >= box - header) {
            $("header").addClass("background-header");
        } else {
            $("header").removeClass("background-header");
        }

    });


    /* =========================================================
       PORTFOLIO FILTER
       ========================================================= */

    $('.filters ul li').click(function () {

        $('.filters ul li').removeClass('active');
        $(this).addClass('active');

        var data = $(this).attr('data-filter');

        if (typeof $grid !== 'undefined' && $grid.length) {
            $grid.isotope({
                filter: data
            });
        }

    });


var $grid = $(".grid");

if ($grid.length && $.fn.isotope) {
    $grid.isotope({
        itemSelector: ".all",
        percentPosition: true,
        masonry: {
            columnWidth: ".all"
        }
    });
}

    /* =========================================================
       MODERN SLIDER
       ========================================================= */

    if ($(".Modern-Slider").length && $.fn.slick) {

        $(".Modern-Slider").slick({

            autoplay: true,
            autoplaySpeed: 10000,
            speed: 600,
            slidesToShow: 1,
            slidesToScroll: 1,
            pauseOnHover: false,
            dots: true,
            pauseOnDotsHover: true,
            cssEase: 'linear',

            draggable: false,

            prevArrow: '<button class="PrevArrow" aria-label="Previous Slide"><i class="fa fa-chevron-left"></i></button>',
            nextArrow: '<button class="NextArrow" aria-label="Next Slide"><i class="fa fa-chevron-right"></i></button>'

        });

    }


    /* =========================================================
       SEARCH
       ========================================================= */

    $('.search-icon a').on("click", function (event) {

        event.preventDefault();

        $("#search").addClass("open");

        $('#search > form > input[type="search"]').focus();

    });


    $("#search, #search button.close").on(
        "click keyup",
        function (event) {

            if (
                event.target == this ||
                event.target.className == "close" ||
                event.keyCode == 27
            ) {

                $(this).removeClass("open");

            }

        }
    );


    $("#search-box").submit(function (event) {

        event.preventDefault();

        return false;

    });


    /* =========================================================
       OWL CAROUSEL
       ========================================================= */

    if ($('.owl-carousel').length && $.fn.owlCarousel) {

        $('.owl-carousel').owlCarousel({

            loop: true,
            margin: 30,
            nav: false,
            pagination: true,

            responsive: {

                0: {
                    items: 1
                },

                600: {
                    items: 2
                },

                1000: {
                    items: 3
                }

            }

        });

    }


    /* =========================================================
       MOBILE MENU INITIALIZATION
       ========================================================= */

    mobileNav();


    /* =========================================================
       SCROLL REVEAL
       ========================================================= */

    if (typeof scrollReveal === "function") {
        window.sr = new scrollReveal();
    }


    /* =========================================================
       MENU DROPDOWN TOGGLE (FIXED FOR MOBILE VIEW)
       ========================================================= */

    if ($('.menu-trigger').length) {

        $(".menu-trigger").off('click').on('click', function (e) {

            e.preventDefault();

            $(this).toggleClass('active');

            $('.header-area .main-nav .nav').stop(true, true).slideToggle(250);

        });

    }


    /* =========================================================
       SAFE SMOOTH SCROLL
       IMPORTANT:
       javascript:void(0) and normal links are ignored.
       ========================================================= */

    $('a').on('click', function (event) {

        var href = $(this).attr('href');

        /*
         * Ignore:
         * - undefined href
         * - empty href
         * - #
         * - javascript:void(0)
         * - mailto:
         * - tel:
         * - external links
         * - normal JSP/page links
         */

        if (
            typeof href !== 'string' ||
            href.length === 0 ||
            href === '#' ||
            href.indexOf('#') !== 0
        ) {
            return;
        }


        /*
         * Make sure href is a valid ID selector.
         */

        var target = null;

        try {

            target = $(href);

        } catch (error) {

            return;

        }


        if (!target || !target.length) {
            return;
        }


        /*
         * Same-page smooth scrolling.
         */

        if (
            location.pathname.replace(/^\//, '') ===
            this.pathname.replace(/^\//, '') &&

            location.hostname === this.hostname
        ) {

            var width = $(window).width();

            if (width <= 991) {

                $('.menu-trigger').removeClass('active');

                $('.header-area .nav').slideUp(200);

            }


            $('html, body').animate({

                scrollTop: target.offset().top - 80

            }, 700);


            event.preventDefault();

        }

    });


    /* =========================================================
       DOCUMENT READY
       ========================================================= */

    $(document).ready(function () {


        /* ---------------------------------------------------------
           SCROLL SPY
           --------------------------------------------------------- */

        $(document).on("scroll", onScroll);


        /* ---------------------------------------------------------
           SAFE NAVIGATION CLICK
           --------------------------------------------------------- */

        $('.nav a').on('click', function (e) {

            var href = $(this).attr('href');


            /*
             * Only process real hash links.
             * This completely prevents:
             *
             * javascript:void(0);
             *
             * from reaching jQuery selector.
             */

            if (
                typeof href !== 'string' ||
                href.length === 0 ||
                href === '#' ||
                href.charAt(0) !== '#'
            ) {

                return;

            }


            var target = null;

            try {

                target = $(href);

            } catch (error) {

                return;

            }


            if (!target || !target.length) {
                return;
            }


            e.preventDefault();

            $(document).off("scroll");


            $('.nav a').each(function () {
                $(this).removeClass('active');
            });


            $(this).addClass('active');


            $('html, body').stop().animate({

                scrollTop: target.offset().top - 79

            }, 500, 'swing', function () {

                /*
                 * Update hash without putting javascript:void(0)
                 * through jQuery.
                 */

                if (href.length > 1) {
                    window.location.hash = href.substring(1);
                }

                $(document).on("scroll", onScroll);

            });

        });

    });


    /* =========================================================
       ON SCROLL NAVIGATION
       ========================================================= */

    function onScroll(event) {

        var scrollPos = $(document).scrollTop();


        $('.nav a').each(function () {

            var currLink = $(this);

            var href = currLink.attr("href");


            /*
             * ONLY HASH LINKS ARE VALID FOR SCROLL SPY.
             *
             * This prevents jQuery from ever executing:
             *
             * $( "javascript:void(0);" )
             *
             */

            if (
                typeof href !== 'string' ||
                href.length === 0 ||
                href === '#' ||
                href.charAt(0) !== '#'
            ) {

                currLink.removeClass("active");

                return;

            }


            var refElement = null;


            /*
             * Extra protection against invalid CSS selectors.
             */

            try {

                refElement = $(href);

            } catch (error) {

                currLink.removeClass("active");

                return;

            }


            if (!refElement || !refElement.length) {

                currLink.removeClass("active");

                return;

            }


            var elementPosition = refElement.position();


            if (!elementPosition) {

                currLink.removeClass("active");

                return;

            }


            if (
                elementPosition.top <= scrollPos &&
                elementPosition.top + refElement.height() > scrollPos
            ) {

                $('.nav ul li a').removeClass("active");

                currLink.addClass("active");

            } else {

                currLink.removeClass("active");

            }

        });

    }


    /* =========================================================
       PAGE LOADING ANIMATION
       ========================================================= */

    $(window).on('load', function () {

        if ($('.cover').length && $.fn.parallax) {

            $('.cover').parallax({

                imageSrc: $('.cover').data('image'),
                zIndex: '1'

            });

        }


        $("#preloader").animate({

            'opacity': '0'

        }, 600, function () {

            setTimeout(function () {

                $("#preloader")
                    .css("visibility", "hidden")
                    .fadeOut();

            }, 300);

        });

    });


    /* =========================================================
       WINDOW RESIZE
       ========================================================= */

    $(window).on('resize', function () {

        mobileNav();

        if ($(window).width() > 991) {
            $('.header-area .main-nav .nav').removeAttr('style');
            $('.header-area .main-nav .nav li.submenu ul').removeAttr('style');
            $('.menu-trigger').removeClass('active');
            $('.submenu').removeClass('open');
        }

    });


    /* =========================================================
       MOBILE NAVIGATION & ACCORDION SUBMENUS (FIXED)
       ========================================================= */

    function mobileNav() {

        var width = $(window).width();

        if (width <= 991) {

            $('.submenu > a')
                .off('click')
                .on('click', function (e) {

                    e.preventDefault();

                    var $parent = $(this).parent('.submenu');

                    $parent.siblings('.submenu').removeClass('open').find('ul').slideUp(200);

                    $parent.toggleClass('open');

                    $parent.children('ul').stop(true, true).slideToggle(200);

                });

        } else {

            $('.submenu > a').off('click');
            $('.submenu ul').removeAttr('style');
            $('.submenu').removeClass('open');

        }

    }


})(window.jQuery);