(function() {
    'use strict';

    angular
        .module('technewApp')
        .controller('CropImageModalController1', CropImageModalController1);

    CropImageModalController1.$inject = ['$uibModalInstance', 'image']

    function CropImageModalController1($uibModalInstance, image) {
        var vm = this;
        vm.width = image.width;
        vm.height = image.height;
        console.log(vm.width);
        console.log(vm.height);
        vm.bounds = {};
        vm.bounds.left = 0;
        vm.bounds.right = 0;
        vm.bounds.top = 0;
        vm.bounds.bottom = 0;

        vm.imageOutput = '';
        var reader = new FileReader();
        reader.onload = function(evt) {
            vm.imageInput = evt.target.result;
        };
        reader.readAsDataURL(image.file);

        vm.save = function() {
            $uibModalInstance.close(vm.imageOutput);
        }

        vm.clear = function() {
            $uibModalInstance.dismiss('cancel');
        }

    }
})();
