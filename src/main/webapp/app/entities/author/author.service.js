(function() {
    'use strict';
    angular
        .module('technewApp')
        .factory('Author', Author);

    Author.$inject = ['$resource', 'DateUtils'];

    function Author ($resource, DateUtils) {
        var resourceUrl =  'api/authors/:id';

        return $resource(resourceUrl, {}, {
            'query': { method: 'GET', isArray: true},
            'get': {
                method: 'GET',
                transformResponse: function (data) {
                    if (data) {
                        data = angular.fromJson(data);
                        data.birthDay = DateUtils.convertLocalDateFromServer(data.birthDay);
                    }
                    return data;
                }
            },
            'update': {
                method: 'PUT',
                transformRequest: function (data) {
                    data.birthDay = DateUtils.convertLocalDateToServer(data.birthDay);
                    return angular.toJson(data);
                }
            },
            'save': {
                method: 'POST',
                transformRequest: function (data) {
                    data.birthDay = DateUtils.convertLocalDateToServer(data.birthDay);
                    return angular.toJson(data);
                }
            }
        });
    }
})();
