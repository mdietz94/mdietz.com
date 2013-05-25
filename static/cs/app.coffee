updatePages = (currentPage) ->
  $("#content-main").css 'left', "#{currentPage*-200}%"
  $("#content-left").css 'left', "#{(1+currentPage)*-200}%"
  $("#content-right").css 'left', "#{(-1+currentPage)*-200}%"
 

$ ->

  currentPage = 0
  updatePages(0)
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
