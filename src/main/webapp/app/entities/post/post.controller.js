(function() {
    'use strict';

    angular
        .module('technewApp')
        .controller('PostController', PostController);

    PostController.$inject = ['$scope'];

    function PostController($scope) {
        var vm = this;
        vm.query = {};
    }
})();
