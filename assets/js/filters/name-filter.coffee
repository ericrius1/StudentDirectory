
compareStr = (stra, strb) ->
  stra = ("" + stra).toLowerCase()
  strb = ("" + strb).toLowerCase()
  stra.indexOf(strb) isnt -1


window.directory.filter "alumnusfilter", () ->
  (input, query) ->
    return input  unless query
    result = []
    angular.forEach input, (alumnus) ->
      result.push alumnus if compareStr(alumnus.firstname, query) or compareStr(alumnus.lastname, query)


    result
