(function() {
    'use strict';

    angular
        .module('technewApp')
        .controller('TagDetailController', TagDetailController);

    TagDetailController.$inject = ['$scope', '$rootScope', '$stateParams', 'previousState', 'entity', 'Tag', 'Post'];

    function TagDetailController($scope, $rootScope, $stateParams, previousState, entity, Tag, Post) {
        var vm = this;

        vm.tag = entity;
        vm.previousState = previousState.name;

        var unsubscribe = $rootScope.$on('technewApp:tagUpdate', function(event, result) {
            vm.tag = result;
        });
        $scope.$on('$destroy', unsubscribe);
    }
})();
