---
source:
- title: WDI Caesar Cipher Solution
  url: https://gist.github.com/kasun-maldeni/955eedcbaa5a5a12f228a57c8e47ac01
---

## JS Solution

```javascript

var caesarSalad = function(str, amount) {
  // Wrap the amount
  if (amount < 0)
    return caesarSalad(str, amount + 26);
  // Make an output variable
  var output = '';
  // Go through each character
  for (var i = 0; i < str.length; i ++) {
    // Get the character we'll be appending
    var c = str[i];
    // If it's a letter...
    if (c.match(/[a-z]/i)) {
      // Get its code
      var code = str.charCodeAt(i);
      // Uppercase letters
      if ((code >= 65) && (code <= 90))
        c = String.fromCharCode(((code - 65 + amount) % 26) + 65);
      // Lowercase letters
      else if ((code >= 97) && (code <= 122))
        c = String.fromCharCode(((code - 97 + amount) % 26) + 97);
    }
    // Append
    output += c;
  }
  // All done!
  return output;
};

// caesarSalad("ABCDEFGHIJKLMNOPQRSTUVWXYZ", 3);
// caesarSalad("DEFGHIJKLMNOPQRSTUVWXYZABC", -3);
caesarSalad("FRZDUGV GLH PDQB WLPHV EHIRUH WKHLU GHDWKV, WKH YDOLDQW QHYHU WDVWH RI GHDWK EXW RQFH.", -3);

// caesarSalad("Good Morning, here is your morning warmup. You can choose to do this in Ruby or Javascrip. Have fun... And don't forget to ask questions...", 3);

```

## Ruby Solution
```ruby
class CesarCipher

  ALPHABET = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

  def self.decode(string, shift=3)

    decoded = []
    shift = shift.to_i
    string.downcase!

    string.each_char do |char|
      if char == ' '
        decoded << ' '
      elsif ALPHABET.include?(char)
        index = ALPHABET.index(char)
        new_index = index - shift
        decoded << ALPHABET[new_index]
      else
        decoded << char
      end

    end
    decoded.join
  end

  def self.encode(string, shift=3)

    coded = []
    shift = shift.to_i
    string.downcase!

    string.each_char do |char|
      if char == ' '
        coded << ' '
      elsif ALPHABET.include?(char)
        index = ALPHABET.index(char)
        new_index = index + shift
        coded << ALPHABET[new_index]
      else
        coded << char
      end

    end
    coded.join
  end
end

p CesarCipher.encode(' ')

p CesarCipher.decode("QEXKHP JXQQ! VBP F ZXK ABJL! ")

```
