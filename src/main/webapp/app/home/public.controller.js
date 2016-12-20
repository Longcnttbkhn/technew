(function() {
    'use strict';

    angular
        .module('technewApp')
        .controller('PublicController', PublicController);

    PublicController.$inject = ['$scope', 'categories', '$state'];

    function PublicController ($scope, categories, $state) {
        var vm = this;
        vm.categories = categories;

    }
})();
