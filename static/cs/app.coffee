currentPage = 0

updatePages = ->
  switch currentPage
    when -1
      $("#content-left").show()
    when 0
      $("#content-main").show()
    else
      $("#content-right").show()
  $('body').animate( { scrollTop: 0 }, 300 )
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

onPageMoveEnd = ->
  switch currentPage
    when -1
      $("#page").html "Resum&eacute;"
      $("#content-main").hide()
      $("#content-right").hide()
    when 0
      $("#page").html "Projects"
      $("#content-left").hide()
      $("#content-right").hide()
    else
      $("#page").html "Contact Information"
      $("#content-main").hide()
      $("#content-left").hide()

  
moveLeft = ->
  $("#usage").fadeOut(1000)
  if currentPage > -1 # otherwise we are already all the way left
    currentPage -= 1
    updatePages()

moveRight = ->
  $("#usage").fadeOut(1000)
  if currentPage < 1 # otherwise we are already all the way right
    currentPage += 1
    updatePages()

$ ->
  updatePages()
  $("#content-right").on 'webkitTransitionEnd', onPageMoveEnd
  $("#content-left").on 'webkitTransitionEnd', onPageMoveEnd
  $("#content-main").on 'webkitTransitionEnd', onPageMoveEnd
  $('body').keydown (e) ->
    switch e.which
      when 37
        moveLeft()
      when 39
        moveRight()
  $('body').swipeleft = moveRight
  $('body').swiperight = moveLeft
  $("#page-right").mousedown = moveRight()
  $("#page-left").mousedown = moveLeft()