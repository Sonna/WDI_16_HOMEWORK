// ---
// source:
// - title: wdi_palindrome_warmup.md
//   url: https://gist.github.com/kasun-maldeni/d567e18549569f399b30f421f8330e49
// ---

// # Check for Palindromes

// Return true if the given string is a palindrome. Otherwise, return false.

// A palindrome is a word or sentence that's spelled the same way both forward
// and backward, ignoring punctuation, case, and spacing.

// function reverse(str) {
//   return str && reverse(str.substr(1)) + str[0];
// }

var isPalindrome = function(pharse) {
  var noPunctuation = pharse.replace(/[^a-z]/gi, '').toLowerCase();
  return noPunctuation === noPunctuation.split('').reverse().join('');
}

// [Some Palindromes to test against](http://www.palindromelist.net/)

// Good Luck!

var pharse;
pharse = 'A but tuba.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'A car, a man, a maraca.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'A dog, a plan, a canal: pagoda.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'A dog! A panic in a pagoda!';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'A lad named E. Mandala';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'A man, a plan, a canal: Panama.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'A man, a plan, a cat, a ham, a yak, a yam, a hat, a canal-Panama!';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'A new order began, a more Roman age bred Rowena.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'A nut for a jar of tuna.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'A Santa at Nasa.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'A Santa dog lived as a devil God at NASA.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'A slut nixes sex in Tulsa.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'A tin mug for a jar of gum, Nita.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'A Toyota! Race fast, safe car! A Toyota!';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'A Toyota’s a Toyota.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'Able was I ere I saw Elba.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'Acrobats stab orca.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'Aerate pet area.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'Ah, Satan sees Natasha!';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'Aibohphobia'; // (fear of palindromes)
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'Air an aria.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'Al lets Della call Ed Stella.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'alula';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'Amen icy cinema.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'Amore, Roma.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'Amy, must I jujitsu my ma?';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'Ana';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'Animal loots foliated detail of stool lamina.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'Anna';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'Anne, I vote more cars race Rome to Vienna.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'Are Mac ‘n’ Oliver ever evil on camera?';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'Are we not drawn onward to new era?';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'Are we not drawn onward, we few, drawn onward to new era?';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'Are we not pure? “No sir!” Panama’s moody Noriega brags. “It is garbage!” Irony dooms a man; a prisoner up to new era.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'Art, name no tub time. Emit but one mantra.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'As I pee, sir, I see Pisa!';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
pharse = 'Avid diva.';
console.log('"' + pharse + '" isPalindrome? ' + isPalindrome(pharse));
