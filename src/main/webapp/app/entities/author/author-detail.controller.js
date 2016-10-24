(function() {
    'use strict';

    angular
        .module('technewApp')
        .controller('AuthorDetailController', AuthorDetailController);

    AuthorDetailController.$inject = ['$scope', '$rootScope', '$stateParams', 'previousState', 'entity', 'Author', 'User', 'Post'];

    function AuthorDetailController($scope, $rootScope, $stateParams, previousState, entity, Author, User, Post) {
        var vm = this;

        vm.author = entity;
        vm.previousState = previousState.name;

        var unsubscribe = $rootScope.$on('technewApp:authorUpdate', function(event, result) {
            vm.author = result;
        });
        $scope.$on('$destroy', unsubscribe);
    }
})();
