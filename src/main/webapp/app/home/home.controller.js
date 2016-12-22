(function() {
    'use strict';

    angular
        .module('technewApp')
        .controller('HomeController', HomeController);

    HomeController.$inject = ['$scope'];

    function HomeController ($scope) {
        var vm = this;
        vm.query = {};
        vm.showStatus = false;
    }
})();
