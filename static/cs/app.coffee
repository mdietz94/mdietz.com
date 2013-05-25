updatePages = (currentPage) ->
  $("#content-main").css '-webkit-transform', "translateX(#{currentPage*-200}%)"
  $("#content-left").css '-webkit-transform', "translateX(#{(1+currentPage)*-200}%)"
  $("#content-right").css '-webkit-transform', "translateX(#{(-1+currentPage)*-200}%)"
 

$ ->

  currentPage = 0
  # Really bad hack to eliminate overlapping sections at start (causes glitch on first move)
  $("#content-left").css '-webkit-transform', "translateX(-20000000%)"
  $("#content-right").css '-webkit-transform', "translateX(20000000%)"
  # eliminates the visual glitch (mostly), but still a bad method
  $("#page-left").mouseover ->
    updatePages(currentPage)
  $("#page-right").mouseover ->
    updatePages(currentPage)
  $("#page-left").mousedown ->
    if currentPage > -1 # otherwise we are already all the way left
      currentPage -= 1
      updatePages(currentPage)
  $("#page-right").mousedown ->
    if currentPage < 1 # otherwise we are already all the way right
      currentPage += 1
      updatePages(currentPage)
