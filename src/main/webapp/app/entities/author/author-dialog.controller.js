(function() {
    'use strict';

    angular
        .module('technewApp')
        .controller('AuthorDialogController', AuthorDialogController);

    AuthorDialogController.$inject = ['$timeout', '$scope', '$stateParams', '$uibModalInstance', '$q', 'entity', 'Author', 'User'];

    function AuthorDialogController($timeout, $scope, $stateParams, $uibModalInstance, $q, entity, Author, User) {
        var vm = this;

        vm.author = entity;
        vm.clear = clear;
        vm.datePickerOpenStatus = {};
        vm.openCalendar = openCalendar;
        vm.save = save;
        vm.users = User.query();

        $timeout(function() {
            angular.element('.form-group:eq(1)>input').focus();
        });

        function clear() {
            $uibModalInstance.dismiss('cancel');
        }

        function save() {
            vm.isSaving = true;
            if (vm.author.id !== null) {
                Author.update(vm.author, onSaveSuccess, onSaveError);
            } else {
                Author.save(vm.author, onSaveSuccess, onSaveError);
            }
        }

        function onSaveSuccess(result) {
            $scope.$emit('technewApp:authorUpdate', result);
            $uibModalInstance.close(result);
            vm.isSaving = false;
        }

        function onSaveError() {
            vm.isSaving = false;
        }

        vm.datePickerOpenStatus.birthDay = false;

        function openCalendar(date) {
            vm.datePickerOpenStatus[date] = true;
        }
    }
})();
