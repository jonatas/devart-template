# Mandala circular

Making a big mandala digital panel rotate!

## Authors

- [Jônatas Davi Paganini](http://github.com/jonatas "Feel free to feedback me at jonatasdp@gmail.com")

## Collaborators

- [Eliége Jachini](http://github.com/eliegejachini "Feel free to feedback me at eliegejachini@gmail.com")
- [Wellington Mitrut](http://github.com/Wmitrut "Feel free to feedback me at wellingtonmitrut@gmail.com")

## Description

From little 3 "mandala coloring books" I enjoy the mandala therapy proccess. Now, I want to mixture these handmade colouring art in a rotative panel.

## Link to Prototype

It's hosted on my own subdomain: http://mandala.ideia.me

## Example Code

The code is hosted with the own project at [github](https://github.com/jonatas/devart-template).

The first example can be found [here](http://jsfiddle.net/kFmY8/1060/ "JSFiddle with my first sketch of code").

The image is unaligned, but covers the concept. The idea is incomplete because I'll crop only the circular part of the image, and combine different directions and speed.

So, with a basic circular image:

```
<img class="rotate" src="http://distilleryimage9.ak.instagram.com/9540a5784a5a11e384640eda85d08e73_8.jpg">
```

And a webkit rotation effect:

```
.rotate {
  -webkit-animation: rotation 0.5s infinite linear;
}

@-webkit-keyframes rotation {
  from {-webkit-transform: rotate(0deg);}
  to   {-webkit-transform: rotate(359deg);}
}
```

Really cool to see the css keyframes working. Soon, I'll adapt it to work with other modern browsers too.

Now, based on these concepts, my idea is allow the user to combine and create a cool panel of mandalas, rotating in different speeds, sizes, positions in the screen.

## External libraries and tools

I'm really enjoy to use less libraries than I'm using:

### http://jquery.org

I really enjoy jquery and I use it just a little, but it allows me think and acts fast. I use it in the last 3 years :)

### http://coffeescript.org

Simple language easy to use and read. I make it's part of the poetry of the code.

### http://gimp.org

I'm not a confident with the images editor, but I'm doing it with GIMP. It's easy and opensource tool. Help me a lot to crop the mandalas and remove the background.

## Images & Videos

Take a look at [my instagram](http://instagram.com/jonatasdp "See some of my mandalas there!")

http://youtu.be/uCbjx_8tQNw

