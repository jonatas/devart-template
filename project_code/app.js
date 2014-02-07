// Generated by CoffeeScript 1.6.3
(function() {
  $(document).ready(function() {
    $("#accelerator").on("change", function() {
      var changeRotation, image, _i, _len, _ref, _results;
      $("#turn_on_motor").prop("checked", true);
      _ref = $(".rotate");
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        image = _ref[_i];
        image.style.webkitAnimationPlayState = "paused";
        changeRotation = function() {
          image.style.webkitAnimation = "rotation " + ($('#accelerator').val()) + "s infinite linear";
          return image.style.webkitAnimationPlayState = "running";
        };
        _results.push(setTimeout(changeRotation, 200));
      }
      return _results;
    });
    return $("#turn_on_motor").on("change", function() {
      var image, state, _i, _len, _ref, _results;
      if (this.checked) {
        state = "running";
      } else {
        state = "paused";
      }
      _ref = $(".rotate");
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        image = _ref[_i];
        _results.push(image.style.webkitAnimationPlayState = state);
      }
      return _results;
    });
  });

}).call(this);