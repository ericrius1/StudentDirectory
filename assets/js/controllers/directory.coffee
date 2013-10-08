'use strict';

directory.controller "DirectoryController", ["$scope", "angularFire", "angularFireAuth", 
  ($scope, angularFire, angularFireAuth) ->
    ref = new Firebase("https://hrdir.firebaseio.com/alumni")
    angularFire ref, $scope, "alumni"

  ]