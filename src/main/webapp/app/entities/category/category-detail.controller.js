(function() {
    'use strict';

    angular
        .module('technewApp')
        .controller('CategoryDetailController', CategoryDetailController);

    CategoryDetailController.$inject = ['$scope', 'category', 'Principal'];

    function CategoryDetailController($scope, category, Principal) {
        var vm = this;
        vm.category = category;
        vm.showStatus = false;
        if (Principal.hasAnyAuthority(['ROLE_ADMIN'])) {
        	vm.showStatus = true
        }

    }
})();
