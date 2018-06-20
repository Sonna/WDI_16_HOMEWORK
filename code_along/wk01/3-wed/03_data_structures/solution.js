console.log("arrays and objects");

// Arrays vs Objects

// Arrays
// - A List
// - A grouping

//            [    0,       1,      2,  3] index values
var colours = ["red", "green", "blue", 56];

// song - artist - beetles - title - let it be - year released 1969

// var song = "song - artist - beetles - title - let it be - year released 1969";
// var songAttributes = song.split(" ");
// var artist = song.split(" ")[4];

var song = ["beetles", "let it be", 1969];
var song2 = ["frozen", "let it go", 2015];

var artist = song2[0];
var title = song2[1];
var yearReleased = song2[2];

var song = {
  title: "let it be",
  artist: "beetles",
  yearReleased: 1969,
  albums: ["let it be Original Album", "Top 100 Hits"]
}

song // => {title: "let it be", artist: "beetles", yearReleased: 1969, albums: Array(2)}
song.title // => "let it be"
song.artist // => "beetles"
song.yearReleased // => 1969

typeof song // => "object"
typeof colours // => "object"

// var colours = {
//   0: "red",
//   1: "green",
//   2: "blue",
// }

var s2 = {}
var songList = [song, s2]

songList[0].title // => "let it be"
songList[0] // => {title: "let it be", artist: "beetles", yearReleased: 1969, albums: Array(2)}
songList[0].artist // => "beetles"
songList[0].yearReleased // => 1969


// index set of stored variables


// objects
// - A List
// - some sort of a container
