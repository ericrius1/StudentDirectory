angular.module("directory", ["firebase"]).controller "DirectoryController", ["$scope", "angularFire", 
  ($scope, angularFire) ->
    ref = new Firebase("https://hrdir.firebaseio.com/alumni")
    angularFire ref, $scope, "alumni"
  ]