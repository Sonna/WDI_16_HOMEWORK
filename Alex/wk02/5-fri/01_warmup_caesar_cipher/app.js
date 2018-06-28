// ---
// source:
// - title: wdi_caesar_cipher_warmup.md
//   url: https://gist.github.com/kasun-maldeni/7994ec117ee7617d88983f9c4b1fbcd9
// ---

// # Quiz - Decode this message!

// Write a program to decode this message:

// **FRZDUGV GLH PDQB WLPHV EHIRUH WKHLU GHDWKV, WKH YDOLDQW QHYHU WDVWH RI GHDWK
// EXW RQFH.**
var secretMessage = 'FRZDUGV GLH PDQB WLPHV EHIRUH WKHLU GHDWKV,' +
                    ' WKH YDOLDQW QHYHU WDVWH RI GHDWK EXW RQFH.';

// This is a form of cryptography known as the Caesar Cipher. It has a **shift
// parameter** of **3**.
// var shift = 3;

// The alphabet is normally:

// ABCDEFGHIJKLMNOPQRSTUVWXYZ
// var aToZ = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
var alphabetString = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
var alphabet = alphabetString.split('');

// The alphabet with the shift parameter of 3 is now as follows:

// DEFGHIJKLMNOPQRSTUVWXYZABC
// var shiftedAlphabet = 'DEFGHIJKLMNOPQRSTUVWXYZABC';
var shiftedAlphabet = function(shift, alphabet) {
  shift = (typeof shift !== 'undefined') ? shift : 3;
  alphabet = (typeof alphabet !== 'undefined') ? alphabet : 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');

  return alphabet.concat(alphabet.splice(0, shift));
};

var decrypt = function(encrypted, cipher, alphabet) {
  alphabet = (typeof alphabet !== 'undefined') ? alphabet : 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
  cipher = (typeof cipher !== 'undefined') ? cipher : shiftedAlphabet(3, alphabet);

  return encrypted.split('').map(function(char, index) {
    if (char.match(/[a-z]/i)) {
      return alphabet[cipher.indexOf(char)];
    }
    return char;
  }).join('');
}

cipher = shiftedAlphabet(3, alphabet);
console.log(decrypt(secretMessage, cipher));

// ---
// ### Extension:

// Write the program to encode plain text into messages.
// ```
// CaesarCipher.encode('TWO SYMBOLS KISSING EACH OTHER')
// ```

// ### Extension 2:

// Write the program to encode it with any shift parameter.

// Send each other secret messages.
