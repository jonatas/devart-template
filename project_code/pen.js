// thank you http://github.com/drvic10k/rotating-mandala
function Pen(canvasID, radius, posX, posY, speed) {

    var self = this;
    var positionAngle = -Math.PI / 2;
    var increment = 0.005;
    var canvas = document.getElementById(canvasID);
    var context = canvas.getContext("2d");

    var distance = Math.sqrt(Math.pow(posX, 2) + Math.pow(posY, 2));
    var angle = Math.atan2(posY, posX);
    var stop = false;

    context.clearRect(0, 0, canvas.clientWidth, canvas.clientHeight);

    self.Draw = function () {
      var colorStep = parseInt(0xFFFFFF / speed);

      for (var i = 0; i < speed; i++) {
        var color = '#' + (i * colorStep).toString(16).slice(-6);
        positionAngle = rotate(positionAngle, increment);
        angle = rotate(angle, -increment * 250 / radius);
        pos = { x: 150, y: 72}
        self.center = polar(pos, positionAngle, 250 - radius);
        var point = polar(self.center, angle, distance);
        context.fillStyle = color;
        if (!stop) {
          context.fillRect(point.x, point.y, 0.3, 0.3);
        }
        colorStep++;
      }

      if (!stop) {
        requestAnimationFrame(self.Draw);
      }


    };

    self.Stop = function () {
        stop = true;
    };
    requestAnimationFrame(self.Draw);
}
