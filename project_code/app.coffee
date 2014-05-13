$(document).ready ->
  mandalas = $(".mandala")
  $("#accelerator").css "transform","rotate(180deg)"
  $("#accelerator").on "change",  ->
    $("#turn_on_motor").prop("checked",true)
    rpm = parseInt(60 * ( 1.0 / parseFloat( $('#accelerator').val() )))
    $('#velocimeter').text rpm.toString()
    actualAnimation = "rotation #{ $('#accelerator').val() }s infinite linear"
    console.log(actualAnimation)

    for image in mandalas
      image.style.webkitAnimationPlayState = "paused"
    changeRotation = ->
      for image in mandalas
        image.style.webkitAnimation = actualAnimation
        image.style.webkitAnimationPlayState = "running"

    setTimeout(changeRotation,500)

  $("#turn_on_motor").on "change",  ->
    if @checked
      state = "running"
    else
      state = "paused"

    for image in mandalas
      image.style.webkitAnimationPlayState = state

