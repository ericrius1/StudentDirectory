window.directory.factory "utils", ->
  compareStr: (stra, strb) ->
    stra = ("" + stra).toLowerCase()
    strb = ("" + strb).toLowerCase()
    stra.indexOf(strb) isnt -1
