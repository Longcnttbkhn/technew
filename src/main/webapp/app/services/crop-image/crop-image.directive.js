(function() {
    'use strict';

    angular
        .module('technewApp')
        .directive('cropImage', cropImage);

    cropImage.$inject = [];

    function cropImage() {
        var directive = {
            restrict: 'E',
            scope: {
                cropedImage: '=',
                class: '@',
                isCroped: '='
            },
            templateUrl: 'app/services/crop-image/crop-image.html',
            controller: ['$scope', '$uibModal', function cropImageController($scope, $uibModal) {
                    var valueId = $scope.idImg;
                    var handleFileSelect = function(evt) {
                        var file = evt.currentTarget.files[0];
                        openCropImage(file);
                    };
                    angular.element(document.querySelector('#inputImage')).on('change', handleFileSelect);

                    function openCropImage(file) {
                        var modalInstance = $uibModal.open({
                            animation: true,
                            templateUrl: 'app/services/crop-image/crop-image-modal.html',
                            controller: 'CropImageModalController1',
                            controllerAs: 'vm',
                            resolve: {
                                file: file
                            }
                        }).result.then(function(file) {
                            $scope.cropedImage = file;
                            $scope.isCroped = true;
                        });
                    }
                }]
                // link: linkFunc
        };

        return directive;

        // function linkFunc(scope) {

        // }
    }
})();
