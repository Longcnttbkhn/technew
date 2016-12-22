(function() {
    'use strict';

    angular
        .module('technewApp')
        .controller('PostFormController', PostFormController);

    PostFormController.$inject = ['$scope','$state', 'entity', 'Post', 'Category', 'UploadImage'];

    function PostFormController($scope, $state, entity, Post, Category, UploadImage) {
        var vm = this;

        vm.post = entity;
        vm.save = save;
        vm.categories = Category.query();
        vm.isChangeAvatar = false;

        if (vm.post.avatar)
            vm.avatar = vm.post.avatar + 'md';

        function save () {
            vm.isSaving = true;
            if (vm.isChangeAvatar)
                vm.post.avatar = null;
            if (vm.post.id !== null) {
                Post.update(vm.post, onSaveSuccess, onSaveError);
            } else {
                Post.save(vm.post, onSaveSuccess, onSaveError);
            }
        }

        function onSaveSuccess (result) {
            $scope.$emit('technewApp:postUpdate', result);
            vm.isSaving = false;
            vm.post.id = result.id;
            console.log(vm.isChangeAvatar)
            if (vm.isChangeAvatar) {
                UploadImage.upload('/api/posts/' + vm.post.id + '/avatar', 'POST', vm.avatar, function(response) {
                    $state.go('post-detail', { id: vm.post.id });
                }, function() {
                    $state.go('post-detail', { id: vm.post.id });
                    vm.post.id = null;
                });
            } else {
                $state.go('post-detail', { id: vm.post.id });
            }
        }

        function onSaveError () {
            vm.isSaving = false;
        }
    }
})();
