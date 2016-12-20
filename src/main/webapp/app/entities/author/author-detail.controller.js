(function() {
    'use strict';

    angular
        .module('technewApp')
        .controller('AuthorDetailController', AuthorDetailController);

    AuthorDetailController.$inject = ['$scope','$rootScope', 'entity', 'Author', 'UploadImage'];

    function AuthorDetailController($scope, $rootScope, entity, Author, UploadImage) {
        var vm = this;

        $scope.opened = {};

        $scope.open = function($event, elementOpened) {
            $event.preventDefault();
            $event.stopPropagation();

            $scope.opened[elementOpened] = !$scope.opened[elementOpened];
        };

        vm.author = entity;
        if ($rootScope.currentAuthor && $rootScope.currentAuthor != null) {
            if ($rootScope.currentAuthor.id == vm.author.id)
                vm.edit = true;
        }
        console.log(vm.edit);
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
