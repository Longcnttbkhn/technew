(function() {
    'use strict';

    angular
        .module('technewApp')
        .controller('CategoryDetailController', CategoryDetailController);

    CategoryDetailController.$inject = ['$scope', 'category'];

    function CategoryDetailController($scope, category) {
        var vm = this;
        vm.category = category;
    }
})();
