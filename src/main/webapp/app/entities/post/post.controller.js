(function() {
    'use strict';

    angular
        .module('technewApp')
        .controller('PostController', PostController);

    PostController.$inject = ['$scope', '$state', 'Post', 'ParseLinks', 'AlertService', 'method', 'query'];

    function PostController($scope, $state, Post, ParseLinks, AlertService, method, query) {
        var vm = this;
        console.log(method);

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

        console.log(query);

        function loadAll() {
            query.page = vm.page;
            query.size = 20;
            query.sort = sort();
            Post[method](query, onSuccess, onError);

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
    }
})();
