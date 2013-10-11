directory.controller "DirectoryController", ["$scope", "angularFireCollection", "angularFireAuth", 
  ($scope, angularFireCollection, angularFireAuth) ->
    ref = new Firebase("https://hrdir.firebaseio.com/alumni")
    $scope.alumni = angularFireCollection(ref, (data)->
      $scope.alumniTemp = data.val()
      if $scope.user?
        createMe()
    )
    angularFireAuth.initialize ref,
      scope: $scope
      name: "user"

    $scope.login = ()->
      angularFireAuth.login('github')
        
    $scope.logout = ()->
      angularFireAuth.logout('github');

    $scope.$on "angularFireAuth:login", (evt, user)->
      $scope.user = user
      if $scope.alumni.length > 0
        $scope.findAll()
      else
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
          createMe()

    $scope.findAll = ()->
      #Go through each alumnus and compare their name to user
      for alumnus in $scope.alumni
        if $scope.user.username.toLowerCase() == alumnus.$id.toLowerCase()
          $scope.myIndex = alumnus.$index
          createMe()

    createMe = ()->
      for name, alumnus of $scope.alumniTemp
          if $scope.user.username.toLowerCase() == name.toLowerCase()
            $scope.me =  alumnus   
            $scope.me.username = $scope.user.username
    

  ]
  