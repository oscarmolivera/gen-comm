    require("@rails/ujs").start()
    require("turbolinks").start()
    require("@rails/activestorage").start()
    require("channels") 
    require('datatables.net-bs4')
    
    import "bootstrap";
    import "chart.js";
    import "../src/font-awesome";
    import "./stylesheets/application.scss";
    
    import $ from 'jquery';
    global.toastr = require("toastr")
    global.$ = jQuery;