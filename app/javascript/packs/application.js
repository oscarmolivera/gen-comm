    require("@rails/ujs").start()
    require("turbolinks").start()
    require("@rails/activestorage").start()
    require("packs/demo/chart-area-demo")
    require("packs/demo/chart-bar-demo")
    require("packs/demo/chart-pie-demo")
    require("packs/demo/datatables-demo")
    require("packs/sb-admin-2")
    require("channels")    
    
    import 'bootstrap';
    import "@fortawesome/fontawesome-free/js/all";
    import './stylesheets/application.scss';
    global.$ = jQuery;
