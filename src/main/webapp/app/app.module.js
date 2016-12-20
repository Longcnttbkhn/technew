(function() {
    'use strict';

    angular
        .module('technewApp', [
            'ngStorage', 
            'tmh.dynamicLocale',
            'pascalprecht.translate', 
            'ngResource',
            'ngCookies',
            'ngAria',
            'ngCacheBuster',
            'ngFileUpload',
            'ui.bootstrap',
            'ui.bootstrap.datetimepicker',
            'ui.router',
            'infinite-scroll',
            // jhipster-needle-angularjs-add-module JHipster will add new module here
            'angular-loading-bar',
            'xeditable',
            'toaster',
            'textAngular',
            'angular-img-cropper',
            'ngtimeago'
        ])
        .run(run);

    run.$inject = ['stateHandler', 'translationHandler', 'editableOptions'];

    function run(stateHandler, translationHandler, editableOptions) {
        stateHandler.initialize();
        translationHandler.initialize();
        editableOptions.theme = 'bs3'; 
    }
})();
