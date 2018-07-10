// scope ??? inside function or outside
// global or local

var secret = 12;

// var room = function() {
var oneSidedGlassRoom = function() {
  // var magic = 15;
  magic = 15; // global

  var anotherRoom = function() {
    var bam = 1;


  };
};

console.log(magic); // should fail
