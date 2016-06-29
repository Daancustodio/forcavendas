angular.module('starter.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $timeout) {

})

.controller('PalavraCtrl', function($scope, $http, $ionicScrollDelegate, $stateParams, $ionicLoading) {

    $scope.produtos = [];

    $http.get("dados/produtos.json")
        .success(function(data) {
            $scope.produtos = data;
        });


    $scope.scrollTop = function() {
        $ionicScrollDelegate.scrollTop();
    };

    $scope.scrollBottom = function() {
        $ionicScrollDelegate.scrollBottom();
    };

});