(function() {
    'use strict';

    angular
        .module('technewApp')
        .directive('postList', postList);

    postList.$inject = [];

    function postList() {
        var directive = {
            restrict: 'EA',
            scope: {
                method: '@',
                query: '='
            },
            templateUrl: 'app/entities/post/post-list/post-list.html',
            controller: ['$scope', '$state', 'Post', 'ParseLinks', function postListController($scope, $state, Post, ParseLinks) {
                    $scope.vm = {};
                    var vm = $scope.vm;
                    vm.$state = $state;
                    vm.posts = [];
                    vm.loadPage = loadPage;
                    vm.page = 0;
                    vm.links = {
                        last: 0
                    };
                    vm.predicate = 'id';
                    vm.reset = reset;
                    vm.reverse = true;

                    loadAll();

                    function loadAll() {
                        $scope.query.page = vm.page;
                        $scope.query.size = 20;
                        $scope.query.sort = sort();
                        Post[$scope.method]($scope.query, onSuccess, onError);

                        function sort() {
                            var result = [vm.predicate + ',' + (vm.reverse ? 'asc' : 'desc')];
                            if (vm.predicate !== 'id') {
                                result.push('id');
                            }
                            return result;
                        }

                        function onSuccess(data, headers) {
                            vm.links = ParseLinks.parse(headers('link'));
                            vm.totalItems = headers('X-Total-Count');
                            for (var i = 0; i < data.length; i++) {
                                vm.posts.push(data[i]);
                            }
                        }

                        function onError(error) {
                            AlertService.error(error.data.message);
                        }
                    }

                    function reset() {
                        vm.page = 0;
                        vm.posts = [];
                        loadAll();
                    }

                    function loadPage(page) {
                        vm.page = page;
                        loadAll();
                    }

                    vm.approve = function() {
                        var status = vm.post.status;
                        vm.post.status = 'APPROVED';
                        Post.update(vm.post, function(data) {

                        }, function(error) {
                            vm.post.status = status;
                        })
                    }

                    vm.noApprove = function() {
                        var status = vm.post.status;
                        vm.post.status = 'NO_APPROVE';
                        Post.update(vm.post, function(data) {

                        }, function(error) {
                            vm.post.status = status;
                        })
                    }
                }]
                // link: linkFunc
        };

        return directive;

        // function linkFunc(scope) {

        // }
    }
})();
