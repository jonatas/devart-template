$(document).ready ->
  $("#accelerator").css "transform","rotate(90deg)"
  $("#accelerator").on "change",  ->
    $("#turn_on_motor").prop("checked",true)
    $('#velocimeter').text  $('#accelerator').val()
    for image in $(".rotate")
      image.style.webkitAnimationPlayState = "paused"
    actualAnimation = "rotation #{ $('#accelerator').val() }s infinite linear"
    changeRotation = ->
      for image in $(".rotate")
        image.style.webkitAnimation = actualAnimation
        image.style.webkitAnimationPlayState = "running"
    setTimeout(changeRotation,300) # it's not refreshing without timeout :(

  $("#turn_on_motor").on "change",  ->
    if @checked
      state = "running"
    else
      state = "paused"

    for image in $(".rotate")
      image.style.webkitAnimationPlayState = state

