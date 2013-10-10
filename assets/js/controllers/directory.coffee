directory.controller "DirectoryController", ["$scope", "angularFireCollection", "angularFireAuth", 
  ($scope, angularFireCollection, angularFireAuth) ->
    ref = new Firebase("https://hrdir.firebaseio.com/alumni")
    $scope.alumni = angularFireCollection(ref, (data)->
      alumniTemp = data.val()
      if $scope.user?
        for name, alumnus of alumniTemp
          if $scope.user.username.toLowerCase() == name.toLowerCase()
            $scope.me =  alumnus     
    )
    angularFireAuth.initialize ref,
      scope: $scope
      name: "user"

    $scope.login = ()->
      angularFireAuth.login('github')
        
    $scope.logout = ()->
      angularFireAuth.logout();

    $scope.$on "angularFireAuth:login", (evt, user)->
      $scope.user = user

    $scope.$watch ((scope)->
      scope.alumni.length
    ),(length)->
      if length > 0
        $scope.findMe(length-1) 
    
    $scope.saveInfo = ()->
      user = $scope.alumni[$scope.myIndex]
      for key, value of $scope.me
          user[key] = value
      $scope.alumni.update(user)

    $scope.findMe = (index)->
      #Go through each alumnus and compare their name to user
        if $scope.user.username.toLowerCase() == $scope.alumni[index].$id.toLowerCase()
          $scope.myIndex = index;

  
  ]