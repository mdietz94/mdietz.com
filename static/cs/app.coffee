currentPage = 0
updatePages = ->
  $("#content-main").css 'left', "#{currentPage*-200}%"
  $("#content-left").css 'left', "#{(1+currentPage)*-200}%"
  $("#content-right").css 'left', "#{(-1+currentPage)*-200}%"
 

$ ->
  updatePages()
  $("#page-left").mousedown ->
    if currentPage > -1 # otherwise we are already all the way left
      currentPage -= 1
      updatePages()
  $("#page-right").mousedown ->
    if currentPage < 1 # otherwise we are already all the way right
      currentPage += 1
      updatePages()
