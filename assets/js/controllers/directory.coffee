directory.controller "DirectoryController", ["$scope", "angularFireCollection", "angularFireAuth", 
  ($scope, angularFireCollection, angularFireAuth) ->
    ref = new Firebase("https://hrdir.firebaseio.com/alumni")
    $scope.alumni = angularFireCollection(new Firebase('https://hrdir.firebaseio.com/alumni'), $scope, 'alumni')
    angularFireAuth.initialize ref,
      scope: $scope
      name: "user"

    $scope.login = ()->
      angularFireAuth.login('github')


    $scope.logout = ()->
      angularFireAuth.logout();

    $scope.$on "angularFireAuth:login", (evt, user)->
      $scope.me = {}
    
    $scope.saveInfo = ()->
      user = $scope.alumni[2];
      for key, value of $scope.me
          user[key] = value


      $scope.alumni.update(user)
  




      #grab fields

  ]