currentPage = 0
updatePages = ->
  $('body').animate( { scrollTop: 0 }, 500 )
  if currentPage == -1
    $("#page").html "Resum&eacute;"
    $('body').css('overflow-y', 'scroll')
  else if currentPage == 0
    $("#page").html "Projects"
    $('body').css('overflow-y', 'hidden')
  else
    $("#page").html "Contact Information"
    $('body').css('overflow-y', 'hidden')
  $("#content-main").css 'left', "#{currentPage*-110}%"
  $("#content-left").css 'left', "#{(1+currentPage)*-110}%"
  $("#content-right").css 'left', "#{(-1+currentPage)*-110}%"
  if currentPage == -1
    $("#page-left").addClass("disabled")
  else if currentPage == 1
    $("#page-right").addClass("disabled")
  else
    $("#page-right").removeClass("disabled")
    $("#page-left").removeClass("disabled")
  
moveLeft = ->
  $("#page-right").removeClass("disabled")
  if currentPage > -1 # otherwise we are already all the way left
    currentPage -= 1
    updatePages()

moveRight = ->
  $("#page-left").removeClass("disabled")
  if currentPage < 1 # otherwise we are already all the way right
    currentPage += 1
    updatePages()

$ ->
  updatePages()
  $("#page-right").mousedown ->
    $("#usage").fadeOut(1000)
    moveRight()
  $("#page-left").mousedown ->
    $("#usage").fadeOut(1000)
    moveLeft()
  $('body').keydown (e) ->
    code = e.which
    if code == 37
      $("#usage").fadeOut(1000)
      moveLeft()
    else if code == 39
      $("#usage").fadeOut(1000)
      moveRight()
  $('body').swipeleft -> 
    $("#usage").fadeOut(1000)
    moveRight()
  $('body').swiperight -> 
    $("#usage").fadeOut(1000)
    moveLeft()
  