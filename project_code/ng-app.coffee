window.app = angular.module("mandala-app", [])
window.main = ($scope) ->
  $scope.setAnimationState = (image, state) ->
    image.style.webkitAnimationPlayState =
      image.style.mozAnimationPlayState =
        image.style.oAnimationPlayState =
          image.style.animationPlayState = state

  $scope.setAnimation = (image, actualAnimation) ->
    setAnimationFor = (image, actualAnimation) ->
      image.style.webkitAnimation =
        image.style.mozAnimation =
          image.style.oAnimation =
            image.style.animation = actualAnimation

    pauseAnimation = -> $scope.setAnimationState(image, "paused")
    setAcceleration = -> setAnimationFor(image, actualAnimation)
    continueAnimation = -> $scope.setAnimationState(image, "running")
    setTimeout(pauseAnimation, 10)
    setTimeout(setAcceleration, 500)
    setTimeout(continueAnimation, 1000)

  $scope.livros_a = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]
  $scope.livros_b = [1,2,3,4,5,6,7,8,9]
  $scope.turn_on_motor = true
  $scope.accelerator =  0.05
  $scope.rpm = -> parseInt(60 * ( 1.0 / parseFloat( $scope.accelerator ) ))
  $scope.mandalas =[]
  for livro in $scope.livros_a
    $scope.mandalas.push("mandalas/1/500x500/0#{livro}b.png")
  for livro in $scope.livros_b
    $scope.mandalas.push("mandalas/2/500x500/0#{livro}b.png")

  $scope.img_mandalas = ->
    document.querySelector("img[src='#{mandala}']") for mandala in $scope.mandalas

  $scope.velocimeter = ->
    $scope.rpm()
  $scope.accelerate = ->
    actualAnimation = "rotation #{ $scope.accelerator }s infinite linear"
    $scope.turn_on_motor = true
    for mandala in $scope.img_mandalas()
      $scope.setAnimation(mandala, actualAnimation)

  $scope.switch_on_off = ->
    if $scope.turn_on_motor
      state = "running"
    else
      state = "paused"

    for image in $scope.img_mandalas()
      $scope.setAnimationState(image, state)

