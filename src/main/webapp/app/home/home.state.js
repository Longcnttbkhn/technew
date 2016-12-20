(function() {
    'use strict';

    angular
        .module('technewApp')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('public', {
            parent: 'app',
            abstract: true,
            data: {
                authorities: []
            },
            views: {
                'content@': {
                    templateUrl: 'app/home/public.html',
                    controller: 'PublicController',
                    controllerAs: 'vm'
                }
            },
            resolve: {
                categories: ['Category', function(Category) {
                    return Category.query().$promise;
                }],
                mainTranslatePartialLoader: ['$translate', '$translatePartialLoader', function ($translate,$translatePartialLoader) {
                    $translatePartialLoader.addPart('category');
                    return $translate.refresh();
                }]
            }
        })
        .state('home', {
            parent: 'public',
            url: '/',
            data: {
                authorities: []
            },
            views: {
                'public-content': {
                    templateUrl: 'app/home/home.html',
                    controller: 'HomeController',
                    controllerAs: 'vm'
                }
            },
            resolve: {
                mainTranslatePartialLoader: ['$translate', '$translatePartialLoader', function ($translate,$translatePartialLoader) {
                    $translatePartialLoader.addPart('home');
                    return $translate.refresh();
                }]
            }
        });
    }
})();
