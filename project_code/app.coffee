$(document).ready ->
  mandalas = $(".mandala")
  $("#accelerator").css "transform","rotate(180deg)"
  $("#accelerator").on "change",  ->
    $("#turn_on_motor").prop("checked",true)
    rpm = parseInt(60 * ( 1.0 / parseFloat( $('#accelerator').val() )))
    $('#velocimeter').text rpm.toString()
    actualAnimation = "rotation #{ $('#accelerator').val() }s infinite linear"
    console.log(actualAnimation)
    setAnimationState = (image, state) ->
      image.style.webkitAnimationPlayState =
        image.style.mozAnimationPlayState =
          image.style.oAnimationPlayState =
            image.style.animationPlayState =  state

    setAnimation = (image, actualAnimation) ->
      image.style.webkitAnimation =
        image.style.mozAnimation =
          image.style.oAnimation =
            image.style.animation = actualAnimation

    pauseMandalas = ->
      for image in mandalas
        setAnimationState(image, "paused")

    changeRotation = ->
      for image in mandalas
        setAnimation image, actualAnimation

    runAgain = ->
      for image in mandalas
        setAnimationState(image, "running")

    setTimeout(pauseMandalas,1)
    setTimeout(changeRotation,100)
    setTimeout(runAgain,200)

  $("#turn_on_motor").on "change",  ->
    if @checked
      state = "running"
    else
      state = "paused"

    for image in mandalas
      image.style.webkitAnimationPlayState = state

