# Firt version available

So, I'm happy to announce the first version is online and [available](http://mandala.ideia.me "Uhulll!")!

Now you can access it on: http://mandala.ideia.me/ :)

## The developer life

I'm starting working on the first part of the project doing it rotates and as aways on the developer life, we need to face some bugs and review how the code works.

My bug was around the main feature of the code. Put the accelerator to run the mandalas more fast or more lazy. So, in my dream I want to write the following code:

```coffeescript
$(document).ready ->
  $("#accelerator").on "change",  ->
    for image in $(".rotate")
      image.style.webkitAnimation = "rotation #{ $('#accelerator').val() }s infinite linear"
```

So, it really doesn't work. The animation was changed on the document. But the browser was not rendering the parameters.

I really observe that something was wrong.

The other feature I write was use an "turn on/off" the motor to avoid getting crazy looking it all the time. or even to appreciate each picture. So I implement these feature with the bug above and when my code is like these:


```coffeescript
$(document).ready ->
  $("#turn_on_motor").on "change",  ->
    if @checked
      state = "running"
    else
      state = "paused"

    for image in $(".rotate")
      image.style.webkitAnimationPlayState = state
```

One detail that helps me so much was: when I exchange the animation state it forces the animation to reload. So I rewrote my accelerator to exchange the state.

```coffeescript
$(document).ready ->
  $("#accelerator").on "change",  ->
    $("#turn_on_motor").prop("checked",true)
    for image in $(".rotate")
      image.style.webkitAnimationPlayState = "paused"
      image.style.webkitAnimation = "rotation #{ $('#accelerator').val() }s infinite linear"
      image.style.webkitAnimationPlayState = "running"
```

But for some reason the code doesn't work. But when I did it manually using the console it works. I decide to divide into two steps and work with the timeout and it solves the problem. Look at the last code:


```coffeescript
$(document).ready ->
  $("#accelerator").on "change",  ->
    $("#turn_on_motor").prop("checked",true)
    for image in $(".rotate")
      image.style.webkitAnimationPlayState = "paused"
    changeRotation = ->
      for image in $(".rotate")
        image.style.webkitAnimation = "rotation #{ $('#accelerator').val() }s infinite linear"
        image.style.webkitAnimationPlayState = "running"
    setTimeout(changeRotation,200) # it's not refreshing without timeout :(
```

It was the latest lessons from the developer life. I really need to update my project to work with the browser issues and other problems.

## Next steps

Now I want to try to move my image actions to another class. I think to encapsulate the behaviour into a prototype to allow it to work with the acceleration independently for each mandala.

Other task is combine scale and rotations on the animations. I think it will bring a powerful psychedelic taste to the view.

In other hand I need to improve my code to allow me connect to the main panel that will transfer to the real.

