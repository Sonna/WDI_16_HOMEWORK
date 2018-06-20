'use strict';

// == Sourced:
// - [node stdout hook with knobs]
//   (https://gist.github.com/stringparser/b539b8cfd5769542037d)
//
function hook(callback) {
  var oldWrite = process.stdout.write;
  var output = { str : '' };

  return {
    restore : function () {
      process.stdout.write = oldWrite;
      return this;
    },
    disable : function () {
      var self = this;
      process.stdout.write = (function () {
        return function(str, enc, fd){
          callback.call(self, output, { str : str, enc : enc, fd : fd });
        };
      })();
      return this;
    },
    enable : function () {
      var self = this;
      process.stdout.write = (function(write){
        return function(str, enc, fd){
          write.apply(process.stdout, arguments);
          callback.call(self, output, { str : str, enc : enc, fd : fd });
        };
      })(oldWrite);
    },
    output : function () {
        return output;
    },
    str : function () {
      // Cleanup surrounding verbose output
      var capturedOutput = this.output().str;
      var firstLineRemovedString =
        capturedOutput.substring(capturedOutput.indexOf("\n") + 1);
      var trimmedString = firstLineRemovedString.trim();
      var lines = trimmedString.split(/\s*[\r\n]+\s*/g);

      return lines.join('\n');
    },
    clean : function () {
      output = { str : '' };
      return this;
    },
    reset : function () {
      return this.disable().clean().enable();
    }
  };
}

var stdout = hook(function (output, obj) {
  output.str += obj.str;
});

if (typeof exports !== 'undefined') {
  if (typeof module !== 'undefined' && module.exports) {
    exports = module.exports = stdout;
  }
  exports.stdout = stdout;
}
