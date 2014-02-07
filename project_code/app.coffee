$(document).ready ->
  $("#accelerator").on "change",  ->
    $("#turn_on_motor").prop("checked",true)
    for image in $(".rotate")
      image.style.webkitAnimationPlayState = "paused"
      changeRotation = ->
        image.style.webkitAnimation = "rotation #{ $('#accelerator').val() }s infinite linear"
        image.style.webkitAnimationPlayState = "running"

      setTimeout(changeRotation,200) # it's not refreshing without timeout :(
  $("#turn_on_motor").on "change",  ->
    if @checked
      state = "running"
    else
      state = "paused"

    for image in $(".rotate")
      image.style.webkitAnimationPlayState = state

