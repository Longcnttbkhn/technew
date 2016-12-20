(function() {
    'use strict';

    angular
        .module('technewApp')
        .controller('PostDetailController', PostDetailController);

    PostDetailController.$inject = ['$scope', 'entity', 'Comment', 'Post'];

    function PostDetailController($scope, entity, Comment, Post) {
        var vm = this;
        vm.post = entity;

        vm.comment = function(content) {
            Comment.save({
                content: content,
                postId: vm.post.id
            }, function(data) {
                vm.post.comments.push(data);
            }, function (error) {

            })
        }

        vm.approve = function() {
            var status = vm.post.status;
            vm.post.status = 'APPROVED';
            Post.update(vm.post, function(data) {

            }, function(error) {
                vm.post.status = status;
            })
        }

        vm.noApprove = function() {
            var status = vm.post.status;
            vm.post.status = 'NO_APPROVE';
            Post.update(vm.post, function(data) {

            }, function(error) {
                vm.post.status = status;
            })
        }

    }
})();
