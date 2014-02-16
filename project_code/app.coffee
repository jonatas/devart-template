$(document).ready ->
  $("#accelerator").css "transform","rotate(90deg)"
  $("#accelerator").on "change",  ->
    $("#turn_on_motor").prop("checked",true)
    rpm = parseInt(60 * ( 1.0 / parseFloat( $('#accelerator').val() )))
    $('#velocimeter').text  "#{rpm} rpm"
    for image in $(".rotate")
      image.style.webkitAnimationPlayState = "paused"
    actualAnimation = "rotation #{ $('#accelerator').val() }s infinite linear"
    changeRotation = ->
      for image in $(".rotate")
        image.style.webkitAnimation = actualAnimation
        image.style.webkitAnimationPlayState = "running"
    setTimeout(changeRotation,500)

  $("#turn_on_motor").on "change",  ->
    if @checked
      state = "running"
    else
      state = "paused"

    for image in $(".rotate")
      image.style.webkitAnimationPlayState = state

