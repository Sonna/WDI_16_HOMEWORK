// console.log('flying'); // => flying
// console.log('babies'); // => babies

// 4 != 4;

// console.log(typeof {}); // => object
// console.log(typeof []); // => object
// console.log(typeof function() {}); // => function

// var firstName = 'john';
// var lastName = 'smith';
var firstname = 'john';
var lastname = 'smith';
var title = 'mr';

var fullname = title + ' ' + firstname + ' ' + lastname;

var getFullname = function() {
  // console.log(fullname);
  console.log('dt');
}

console.log(fullname);

// var person = {
//   firstname: 'john',
//   lastname: 'smith',
//   title: 'mr',
//   fullname: function() {
//     return title + ' ' + firstname + ' ' + lastname;
//   }
// }

for (var i = 0; i < 4; i++) {
  console.log("I get knocked down, but I get up again");
  console.log("You are never gonna keep me down");
}

// He drinks a Whiskey drink, he drinks a Vodka drink
// He drinks a Lager drink, he drinks a Cider drink
// He sings the songs that remind him of the good times
// He sings the songs that remind him of the best times
// (Oh Danny Boy, Danny Boy, Danny Boy)
//
// var drinks = ["Whiskey", "Vodka", "Lager", "Cider"]
var drinks = "Whiskey Vodka Lager Cider".split(' ');

// drinks.unshift(drinks.pop());
// drinks.unshift(drinks.pop());
// console.log(drinks.pop());
// console.log(drinks);

// for (var i = 0; i < drinks.length; i++) {
//   console.log('He drinks a ' + drinks[i] + ' drink');
for (var i = 0; i < drinks.length; i+=2) {
  console.log('He drinks a ' + drinks[i] + ' drink, he drinks a ' + drinks[i+1]);
}

console.log('He sings the songs that remind him of the good times');
console.log('He sings the songs that remind him of the best times');
console.log('(Oh ' + 'Danny Boy, '.repeat(3).slice(0, -2) + ')');
