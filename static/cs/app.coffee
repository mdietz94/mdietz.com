currentPage = 0
currentProject = 0
updatePages = ->
  $("#content-main").css 'left', "#{currentPage*-200}%"
  $("#content-left").css 'left', "#{(1+currentPage)*-200}%"
  $("#content-right").css 'left', "#{(-1+currentPage)*-200}%"
  # resets in any scrolling occurred
  $("#content-main").css 'top', "#{currentProject*200 + 10}"
  
moveLeft = ->
  if currentPage > -1 # otherwise we are already all the way left
    currentProject = 0
    currentPage -= 1
    updatePages()

moveRight = ->
  if currentPage < 1 # otherwise we are already all the way right
    currentProject = 0
    currentPage += 1
    updatePages()

moveUp = ->
  if currentPage == 0 # only main page scrolls
    currentProject += 1
    updatePages()

moveDown = ->
  if currentPage == 0
    currentProject -= 1
    updatePages()

$ ->
  updatePages()
  $("#page-right").mousedown moveRight
  $("#page-left").mousedown moveLeft
  $("#page-up").mousedown moveUp
  $("#page-down").mousedown moveDown
  $('body').keyup (e) ->
    code = e.which
    if code == 37
      moveLeft()
    else if code == 38
      moveUp()
    else if code == 39
      moveRight()
    else if code == 40
      moveDown()
