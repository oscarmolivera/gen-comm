    require("@rails/ujs").start()
    require("turbolinks").start()
    require("@rails/activestorage").start()
    require("channels")    

    require("packs/sb-admin-2")
    
    import 'bootstrap';
    import "@fortawesome/fontawesome-free/js/all";
    import './stylesheets/application.scss';
    global.$ = jQuery;
