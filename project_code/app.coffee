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
     pen = new Pen("background_animation", 7.77, 7.77, 242, 1000)

  mandalasToAnimate = mandalas.toArray()
  mandalas.show()
    
  mandala = null
  animateOneMoreMandala = ->
    if mandala isnt null
      mandala.style.webkitAnimationPlayState = "paused"
      $(mandala).hide()
    if mandala = mandalasToAnimate.shift()
      console.log("animating ", mandala)
      mandala.style.webkitAnimationPlayState = "paused"
      mandala.webkitAnimation = "scale 8s linear, rotation #{$("#accelerator").val()}s infinite linear"
      mandala.style.webkitAnimationPlayState = "running"
    else
      console.log("terminou ... mandalas" )
      clearInterval(window.animatingMandalas) 
      delete animatingMandalas
      mandalas.show()

  window.animatingMandalas = setInterval(animateOneMoreMandala,8000)

       
  startAnimation()

