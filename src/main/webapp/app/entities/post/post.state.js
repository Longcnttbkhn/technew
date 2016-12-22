(function() {
    'use strict';

    angular
        .module('technewApp')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider
        .state('post', {
            parent: 'public',
            url: '/post',
            data: {
                authorities: ['ROLE_ADMIN'],
                pageTitle: 'technewApp.post.home.title'
            },
            views: {
                'public-content': {
                    templateUrl: 'app/entities/post/posts.html',
                    controller: 'PostController',
                    controllerAs: 'vm'
                }
            },
            resolve: {
                translatePartialLoader: ['$translate', '$translatePartialLoader', function ($translate, $translatePartialLoader) {
                    $translatePartialLoader.addPart('post');
                    $translatePartialLoader.addPart('status');
                    $translatePartialLoader.addPart('global');
                    return $translate.refresh();
                }]
            }
        })
        .state('post-detail', {
            parent: 'public',
            url: '/post/{id}',
            data: {
                authorities: [],
                pageTitle: 'technewApp.post.detail.title'
            },
            views: {
                'public-content': {
                    templateUrl: 'app/entities/post/post-detail.html',
                    controller: 'PostDetailController',
                    controllerAs: 'vm'
                }
            },
            resolve: {
                translatePartialLoader: ['$translate', '$translatePartialLoader', function ($translate, $translatePartialLoader) {
                    $translatePartialLoader.addPart('post');
                    $translatePartialLoader.addPart('status');
                    return $translate.refresh();
                }],
                entity: ['$stateParams', 'Post', function($stateParams, Post) {
                    return Post.get({id : $stateParams.id}).$promise;
                }],
                previousState: ["$state", function ($state) {
                    var currentStateData = {
                        name: $state.current.name || 'post',
                        params: $state.params,
                        url: $state.href($state.current.name, $state.params)
                    };
                    return currentStateData;
                }]
            }
        })
        .state('post-edit', {
            parent: 'public',
            url: '/post/{id}/edit',
            data: {
                authorities: []
            },
            views: {
                'public-content': {
                    templateUrl: 'app/entities/post/post-form.html',
                    controller: 'PostFormController',
                    controllerAs: 'vm'
                }
            },
            resolve: {
                translatePartialLoader: ['$translate', '$translatePartialLoader', function ($translate, $translatePartialLoader) {
                    $translatePartialLoader.addPart('post');
                    $translatePartialLoader.addPart('status');
                    return $translate.refresh();
                }],
                entity: ['$stateParams', 'Post', function($stateParams, Post) {
                    return Post.get({id : $stateParams.id}).$promise;
                }]
            }
        })
        .state('post-create', {
            parent: 'public',
            url: '/post-create',
            data: {
                authorities: []
            },
            views: {
                'public-content': {
                    templateUrl: 'app/entities/post/post-form.html',
                    controller: 'PostFormController',
                    controllerAs: 'vm'
                }
            },
            resolve: {
                translatePartialLoader: ['$translate', '$translatePartialLoader', function ($translate, $translatePartialLoader) {
                    $translatePartialLoader.addPart('post');
                    $translatePartialLoader.addPart('status');
                    return $translate.refresh();
                }],
                entity: function() {
                    return {
                        id: null
                    };
                }
            }
        })
        .state('post.delete', {
            parent: 'post',
            url: '/{id}/delete',
            data: {
                authorities: ['ROLE_USER']
            },
            onEnter: ['$stateParams', '$state', '$uibModal', function($stateParams, $state, $uibModal) {
                $uibModal.open({
                    templateUrl: 'app/entities/post/post-delete-dialog.html',
                    controller: 'PostDeleteController',
                    controllerAs: 'vm',
                    size: 'md',
                    resolve: {
                        entity: ['Post', function(Post) {
                            return Post.get({id : $stateParams.id}).$promise;
                        }]
                    }
                }).result.then(function() {
                    $state.go('post', null, { reload: 'post' });
                }, function() {
                    $state.go('^');
                });
            }]
        });
    }

})();
