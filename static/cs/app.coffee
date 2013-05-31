###
    mdietz.me
    Copyright (C) 2013  Max Dietz

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>. ###

currentPage = 0
locked = false

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
  locked = false
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
  if not locked and currentPage > -1 # otherwise we are already all the way left
    locked = true
    currentPage -= 1
    updatePages()

moveRight = ->
  $("#usage").fadeOut(1000)
  if not locked and currentPage < 1 # otherwise we are already all the way right
    locked = true
    currentPage += 1
    updatePages()

$ ->
  updatePages()
  onPageMoveEnd()
  $("#content-right").on 'webkitTransitionEnd transitionend oTransitionEnd', onPageMoveEnd
  $("#content-left").on 'webkitTransitionEnd transitionend oTransitionEnd', onPageMoveEnd
  $("#content-main").on 'webkitTransitionEnd transitionend oTransitionEnd', onPageMoveEnd

  $('body').keydown (e) ->
    switch e.which
      when 37
        moveLeft()
      when 39
        moveRight()
  $("#page-right").mousedown moveRight
  $("#page-left").mousedown moveLeft


$(document).on 'pageinit', ->
    $(window).on "swipeleft", moveRight
    $(window).on "swiperight", moveLeft
    $(window).on "orientationchange", (e) ->
      if e.orientation == "portrait"
        alert("This webpage is optimized for landscape view.")
    $(window).orientationchange()