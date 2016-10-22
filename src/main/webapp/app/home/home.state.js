(function() {
    'use strict';

    angular
        .module('technewApp')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('home', {
            parent: 'app',
            abstract: true,
            views: {
                'content@': {
                    templateUrl: 'app/home/home.html',
                    controller: 'HomeController',
                    controllerAs: 'vm'
                }
            },
            resolve: {
                mainTranslatePartialLoader: ['$translate', '$translatePartialLoader', function($translate, $translatePartialLoader) {
                    $translatePartialLoader.addPart('home');
                    return $translate.refresh();
                }]
            }
        })
        .state('home.new', {
            parent: 'home',
            url: '/',
            data: {
                authorities: []
            },
            views: {
                'home-content': {
                    templateUrl: 'app/home/list-post/list-post.html',
                    controller: 'ListPostController',
                    controllerAs: 'vm'
                }
            },
            resolve: {
                deps: ['$ocLazyLoad',
                    function($ocLazyLoad) {
                        return $ocLazyLoad.load('app/home/list-post/list-post.controller.js')
                    }
                ],
                mainTranslatePartialLoader: ['$translate', '$translatePartialLoader', function($translate, $translatePartialLoader) {
                    $translatePartialLoader.addPart('home');
                    return $translate.refresh();
                }]
            }
        });
    }
})();
