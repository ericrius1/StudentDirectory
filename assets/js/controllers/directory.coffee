directory.controller "DirectoryController", ["$scope", "angularFireCollection", "angularFireAuth", 
  ($scope, angularFireCollection, angularFireAuth) ->
    ref = new Firebase("https://hrdir.firebaseio.com/alumni")
    $scope.alumni = angularFireCollection(ref, (data)->
      $scope.me = data.val()
    )
    $scope.me = {}
    angularFireAuth.initialize ref,
      scope: $scope
      name: "user"

    $scope.login = ()->
      angularFireAuth.login('github')
        
    $scope.logout = ()->
      angularFireAuth.logout();

    $scope.$on "angularFireAuth:login", (evt, user)->
      $scope.user = user
      $scope.findMe()
    
    $scope.saveInfo = ()->
      user = $scope.alumni[$scope.myIndex]
      for key, value of $scope.me
          user[key] = value
      $scope.alumni.update(user)

    $scope.findMe = ()->
      #Go through each alumnus and compare their name to user
      for alumnus in $scope.alumni
        if $scope.user.username.toLowerCase() == alumnus.$id.toLowerCase()
          $scope.myIndex = alumnus.$index

  
  ]