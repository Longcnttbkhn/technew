(function() {
    'use strict';

    angular
        .module('technewApp')
        .controller('ProfileController', ProfileController);

    ProfileController.$inject = ['$scope', 'entity', 'Author', 'UploadImage'];

    function ProfileController($scope, entity, Author, UploadImage) {
        var vm = this;

        $scope.opened = {};

        $scope.open = function($event, elementOpened) {
            $event.preventDefault();
            $event.stopPropagation();

            $scope.opened[elementOpened] = !$scope.opened[elementOpened];
        };

        vm.author = entity;

        // Upload image 
        $scope.isCroped = false;
        if (vm.author.avatar)
            vm.imgAvatar = vm.author.avatar + 'md';

        $scope.$watch('isCroped', function() {
            if ($scope.isCroped) {
                UploadImage.upload('/api/authors/' + vm.author.id + '/avatar', 'PUT', vm.imgAvatar, function(response) {
                    vm.author.avatar = response.data.avatar;
                    vm.imgAvatar = response.data.avatar + 'md';
                }, function() {
                    vm.imgAvatar = vm.author.avatar + 'md';
                })
            }
        });

        // Goi phuong thuc nay khi upload thong tin cho author
        vm.updateauthor = function() {
            Author.update(vm.author, function(result) {
                // success
            }, function() {
                // error
            });
        }

    }
})();
