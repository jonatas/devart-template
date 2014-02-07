$(document).ready ->
  $("#accelerator").on "change",  ->
    for image in $(".rotate")
      image.style.webkitAnimationPlayState = "paused"
      changeRotation = ->
        image.style.webkitAnimation = "rotation #{ $('#accelerator').val() }s infinite linear"
        image.style.webkitAnimationPlayState = "running"
      setTimeout(changeRotation,200)

