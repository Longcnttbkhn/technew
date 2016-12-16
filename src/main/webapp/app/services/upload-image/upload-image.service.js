(function() {
    'use strict';

    angular
        .module('technewApp')
        .factory('UploadImage', UploadImage);

    UploadImage.$inject = ['Upload'];

    function UploadImage(Upload) {
        var service = {
            upload: upload
        }
        return service;

        function dataURItoBlob(dataURI) { // console.log(dataURI.split(',')[1]);         
            var binary = atob(dataURI.split(',')[1]);
            var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
            var array = [];
            for (var i = 0; i < binary.length; i++) { array.push(binary.charCodeAt(i)); }
            return new Blob([new Uint8Array(array)], { type: mimeString });
        };

        function blobToFile(theBlob, fileName) {
            var b = theBlob; //A Blob() is almost a File() - it's just missing the two properties below which we will add         
            b.lastModifiedDate = new Date();
            b.name = fileName; //Cast to a File() type         
            return theBlob;
        };

        function fileChange(uri) {
            var blob = dataURItoBlob(uri);
            var fd = new FormData(document.forms[0]);
            fd.append("myFile", blob);
            fd.append("canvasImage", blob);
            var file = blobToFile(blob, 'outputCroped');
            return file;
        }

        function upload(url, method, fileUpload, success, error) {
            Upload.upload({
                url: url,
                method: method,
                data: { file: fileChange(fileUpload) },
            }).then(function(response) {
                success(response);
            }, function() {
                error();
            });
        }
    }
})();
