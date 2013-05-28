currentPage = 0
currentProject = 0
updatePages = ->
  if currentPage == -1
    $("#page").html "Resum&eacute;"
  else if currentPage == 0
    $("#page").html "Projects"
  else
    $("#page").html "Contact Information"
  $("#content-main").css 'left', "#{currentPage*-110}%"
  $("#content-left").css 'left', "#{(1+currentPage)*-110}%"
  $("#content-right").css 'left', "#{(-1+currentPage)*-110}%"
  # resets in any scrolling occurred
  $("#content-main").css 'top', "#{currentProject*-200 + 10}"
  $("#content-left").css 'top', "#{currentProject*-200 + 10}"
  $("#content-right").css 'top', "#{currentProject*-200 + 10}"
  if currentPage == -1
    $("#page-left").addClass("disabled")
  else if currentPage == 1
    $("#page-right").addClass("disabled")
  else
    $("#page-right").removeClass("disabled")
    $("#page-left").removeClass("disabled")
  if currentProject == 0
    $("#page-up").addClass("disabled")
  else
    $("#page-up").removeClass("disabled")

  
moveLeft = ->
  $("#page-up").removeClass("disabled")
  $("#page-right").removeClass("disabled")
  if currentPage > -1 # otherwise we are already all the way left
    currentProject = 0
    currentPage -= 1
    updatePages()

moveRight = ->
  $("#page-up").removeClass("disabled")
  $("#page-left").removeClass("disabled")
  if currentPage < 1 # otherwise we are already all the way right
    currentProject = 0
    currentPage += 1
    updatePages()

moveUp = ->
  if currentProject > 0
    currentProject -= 1
    updatePages()

moveDown = ->
  $("#page-up").removeClass("disabled")
  currentProject += 1
  updatePages()

$ ->
  updatePages()
  $("#page-right").mousedown ->
    $("#usage").fadeOut(1000)
    moveRight()
  $("#page-left").mousedown ->
    $("#usage").fadeOut(1000)
    moveLeft()
  $("#page-up").mousedown ->
    $("#usage").fadeOut(1000)
    moveUp()
  $("#page-down").mousedown ->
    $("#usage").fadeOut(1000)
    moveDown()
  $('body').keydown (e) ->
    code = e.which
    if code == 37
      $("#usage").fadeOut(1000)
      moveLeft()
    else if code == 38
      $("#usage").fadeOut(1000)
      moveUp()
    else if code == 39
      $("#usage").fadeOut(1000)
      moveRight()
    else if code == 40
      $("#usage").fadeOut(1000)
      moveDown()