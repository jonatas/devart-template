$(document).ready ->
  mandalas = $(".mandala")
  $("#accelerator").css "transform","rotate(90deg)"
  $("#accelerator").on "change",  ->
    $("#turn_on_motor").prop("checked",true)
    rpm = parseInt(60 * ( 1.0 / parseFloat( $('#accelerator').val() )))
    $('#velocimeter').text  "#{rpm} rpm"
    for image in mandalas
      image.style.webkitAnimationPlayState = "paused"
    actualAnimation = "rotation #{ $('#accelerator').val() }s infinite linear"
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

   pen = null

   startAnimation = ->
     pen.Stop() if pen
     pen = new Pen("background_animation", 2, 200, 150, 100, '#e0e0e0')

   startAnimation()

