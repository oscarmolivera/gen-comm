    require("@rails/ujs").start()
    require("turbolinks").start()
    require("@rails/activestorage").start()
    require("channels") 
    require('datatables.net-bs4')
    
    import "bootstrap";
    import "chart.js";
    import "../src/font-awesome";
    import "../src/category";
    import "../src/sb-admin-2";
    import "./stylesheets/application.scss";
    
    import $ from 'jquery';
    global.$ = jQuery;