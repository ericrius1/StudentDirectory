directory.controller "DirectoryController", ["$scope", "angularFire", "angularFireAuth", 
  ($scope, angularFire, angularFireAuth) ->
    ref = new Firebase("https://hrdir.firebaseio.com/alumni")
    angularFireAuth.initialize ref,
      scope: $scope
      name: "user"
    angularFire ref, $scope, "alumni"
    $scope.login = ()->
      angularFireAuth.login('github')

    $scope.logout = ()->
      angularFireAuth.logout();

    $scope.$on "angularFireAuth:login", (evt, user)->
      $scope.user = user.username;

  ]