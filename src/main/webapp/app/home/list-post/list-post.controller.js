(function() {
    'use strict';

    angular
        .module('technewApp')
        .controller('ListPostController', ListPostController);

    ListPostController.$inject = ['$scope', '$state'];

    function ListPostController ($scope, $state) {
        var vm = this;

        vm.name = "new";
    }
})();
