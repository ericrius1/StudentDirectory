directory.controller "DirectoryController", ["$scope", "angularFire", "angularFireAuth", 
  ($scope, angularFire, angularFireAuth) ->
    ref = new Firebase("https://hrdir.firebaseio.com/alumni")
    promise = angularFire ref, $scope, "alumni"
    angularFireAuth.initialize ref,
      scope: $scope
      name: "user"

    $scope.login = ()->
      angularFireAuth.login('github')


    $scope.logout = ()->
      angularFireAuth.logout();

    $scope.$on "angularFireAuth:login", (evt, user)->
      $scope.user = user;
    
    promise.then(()->
      for name, alumnus of $scope.alumni
        console.log(alumnus)
        if name.toLowerCase() is $scope.user.username.toLowerCase()
          $scope.me = alumnus
    )





      #grab fields

  ]