// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery

// this is for the menù
$(document).ready(function () {
    document.addEventListener('turbolinks:load', function () {
        navbarNavigation();
    })
    navbarNavigation();
})

function navbarNavigation() {
    let menu = document.getElementById("menu-toggle-btn");
    if(!menu){
        menu = document.getElementById("menu-close-btn");
        $(menu).attr("id", "menu-toggle-btn");
    }

    $(menu).click(function () {
        if ($(menu).attr('id') == "menu-toggle-btn")
            $(menu).attr("id", "menu-close-btn");
        else
            $(menu).attr("id", "menu-toggle-btn");

        x = document.querySelector(".nav-bar-selection");
        if (x.style.display === "none") {
            $(x).fadeIn(500);
            $(document.querySelector(".logo-container")).fadeOut(400);
            $(document.querySelector(".logo-container-big")).fadeIn(600);
        }
        else {
            $(x).fadeOut(500);
            $(document.querySelector(".logo-container-big")).fadeOut(400);
            $(document.querySelector(".logo-container")).fadeIn(600);
        }
    });
}