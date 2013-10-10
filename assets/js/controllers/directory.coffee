directory.controller "DirectoryController", ["$scope", "angularFireCollection", "angularFireAuth", 
  ($scope, angularFireCollection, angularFireAuth) ->
    ref = new Firebase("https://hrdir.firebaseio.com/alumni")
    $scope.alumni = angularFireCollection(new Firebase('https://hrdir.firebaseio.com/alumni'))
    angularFireAuth.initialize ref,
      scope: $scope
      name: "user"

    $scope.login = ()->
      angularFireAuth.login('github')


    $scope.logout = ()->
      angularFireAuth.logout();

    $scope.$on "angularFireAuth:login", (evt, user)->
      $scope.user = user
    

  




      #grab fields

  ]