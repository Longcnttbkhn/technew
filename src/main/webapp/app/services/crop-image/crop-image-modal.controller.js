(function() {
    'use strict';

    angular
        .module('giasanApp')
        .controller('CropImageModalController1', CropImageModalController1);

    CropImageModalController1.$inject = ['$uibModalInstance', 'file']

    function CropImageModalController1($uibModalInstance, file) {
        var vm = this;
        vm.imageOutput = '';
        var reader = new FileReader();
        reader.onload = function(evt) {
            vm.imageInput = evt.target.result;
        };
        reader.readAsDataURL(file);

        vm.save = function() {
            $uibModalInstance.close(vm.imageOutput);
        }

        vm.clear = function() {
            $uibModalInstance.dismiss('cancel');
        }

    }
})();
