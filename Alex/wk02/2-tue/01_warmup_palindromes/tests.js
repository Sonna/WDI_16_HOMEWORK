var module = QUnit.module;
var test = QUnit.test;

QUnit.test('hello test', function(assert) {
  assert.ok( 1 == '1', 'Passed!' );
});

// == References:
// - [Palindrome List – Palindromes, Palindrome Words, Examples]
//   (http://www.palindromelist.net/)

module('isPalindrome', function(hooks) {
  // A
  test('"A but tuba."', function(assert) {
    assert.ok(isPalindrome('A but tuba.'));
  });

  test('"A but tuba."', function(assert) {
    assert.ok(isPalindrome('A but tuba.'));
  });

  test('"A car, a man, a maraca."', function(assert) {
    assert.ok(isPalindrome('A car, a man, a maraca.'));
  });

  test('"A dog, a plan, a canal: pagoda."', function(assert) {
    assert.ok(isPalindrome('A dog, a plan, a canal: pagoda.'));
  });

  test('"A dog! A panic in a pagoda!"', function(assert) {
    assert.ok(isPalindrome('A dog! A panic in a pagoda!'));
  });

  test('"A lad named E. Mandala"', function(assert) {
    assert.ok(isPalindrome('A lad named E. Mandala'));
  });

  test('"A man, a plan, a canal: Panama."', function(assert) {
    assert.ok(isPalindrome('A man, a plan, a canal: Panama.'));
  });

  test('"A man, a plan, a cat, a ham, a yak, a yam, a hat, a canal-Panama!"', function(assert) {
    assert.ok(isPalindrome('A man, a plan, a cat, a ham, a yak, a yam, a hat, a canal-Panama!'));
  });

  test('"A new order began, a more Roman age bred Rowena."', function(assert) {
    assert.ok(isPalindrome('A new order began, a more Roman age bred Rowena.'));
  });

  test('"A nut for a jar of tuna."', function(assert) {
    assert.ok(isPalindrome('A nut for a jar of tuna.'));
  });

  test('"A Santa at Nasa."', function(assert) {
    assert.ok(isPalindrome('A Santa at Nasa.'));
  });

  test('"A Santa dog lived as a devil God at NASA."', function(assert) {
    assert.ok(isPalindrome('A Santa dog lived as a devil God at NASA.'));
  });

  test('"A slut nixes sex in Tulsa."', function(assert) {
    assert.ok(isPalindrome('A slut nixes sex in Tulsa.'));
  });

  test('"A tin mug for a jar of gum, Nita."', function(assert) {
    assert.ok(isPalindrome('A tin mug for a jar of gum, Nita.'));
  });

  test('"A Toyota! Race fast, safe car! A Toyota!"', function(assert) {
    assert.ok(isPalindrome('A Toyota! Race fast, safe car! A Toyota!'));
  });

  test('"A Toyota’s a Toyota."', function(assert) {
    assert.ok(isPalindrome('A Toyota’s a Toyota.'));
  });

  test('"Able was I ere I saw Elba."', function(assert) {
    assert.ok(isPalindrome('Able was I ere I saw Elba.'));
  });

  test('"Acrobats stab orca."', function(assert) {
    assert.ok(isPalindrome('Acrobats stab orca.'));
  });

  test('"Aerate pet area."', function(assert) {
    assert.ok(isPalindrome('Aerate pet area.'));
  });

  test('"Ah, Satan sees Natasha!"', function(assert) {
    assert.ok(isPalindrome('Ah, Satan sees Natasha!'));
  });

  test('"Aibohphobia"', function(assert) {
    assert.ok(isPalindrome('Aibohphobia')); // (fear of palindromes)
  });

  test('"Air an aria."', function(assert) {
    assert.ok(isPalindrome('Air an aria.'));
  });

  test('"Al lets Della call Ed Stella."', function(assert) {
    assert.ok(isPalindrome('Al lets Della call Ed Stella.'));
  });

  test('"alula"', function(assert) {
    assert.ok(isPalindrome('alula'));
  });

  test('"Amen icy cinema."', function(assert) {
    assert.ok(isPalindrome('Amen icy cinema.'));
  });

  test('"Amore, Roma."', function(assert) {
    assert.ok(isPalindrome('Amore, Roma.'));
  });

  test('"Amy, must I jujitsu my ma?"', function(assert) {
    assert.ok(isPalindrome('Amy, must I jujitsu my ma?'));
  });

  test('"Ana"', function(assert) {
    assert.ok(isPalindrome('Ana'));
  });

  test('"Animal loots foliated detail of stool lamina."', function(assert) {
    assert.ok(isPalindrome('Animal loots foliated detail of stool lamina.'));
  });

  test('"Anna"', function(assert) {
    assert.ok(isPalindrome('Anna'));
  });

  test('"Anne, I vote more cars race Rome to Vienna."', function(assert) {
    assert.ok(isPalindrome('Anne, I vote more cars race Rome to Vienna.'));
  });

  test('"Are Mac ‘n’ Oliver ever evil on camera?"', function(assert) {
    assert.ok(isPalindrome('Are Mac ‘n’ Oliver ever evil on camera?'));
  });

  test('"Are we not drawn onward to new era?"', function(assert) {
    assert.ok(isPalindrome('Are we not drawn onward to new era?'));
  });

  test('"Are we not drawn onward, we few, drawn onward to new era?"', function(assert) {
    assert.ok(isPalindrome('Are we not drawn onward, we few, drawn onward to new era?'));
  });

  test('"Are we not pure? “No sir!” Panama’s moody Noriega brags. “It is garbage!” Irony dooms a man; a prisoner up to new era."', function(assert) {
    assert.ok(isPalindrome('Are we not pure? “No sir!” Panama’s moody Noriega brags. “It is garbage!” Irony dooms a man; a prisoner up to new era.'));
  });

  test('"Art, name no tub time. Emit but one mantra."', function(assert) {
    assert.ok(isPalindrome('Art, name no tub time. Emit but one mantra.'));
  });

  test('"As I pee, sir, I see Pisa!"', function(assert) {
    assert.ok(isPalindrome('As I pee, sir, I see Pisa!'));
  });

  test('"Avid diva."', function(assert) {
    assert.ok(isPalindrome('Avid diva.'));
  });

  // B
  test('"Baby Bab"', function(assert) {
    assert.ok(isPalindrome('Baby Bab'));
  });

  test('"Bar an arab."', function(assert) {
    assert.ok(isPalindrome('Bar an arab.'));
  });

  test('"Barge in! Relate mere war of 1991 for a were-metal Ernie grab!"', function(assert) {
    assert.ok(isPalindrome('Barge in! Relate mere war of 1991 for a were-metal Ernie grab!'));
  });

  test('"Bird rib."', function(assert) {
    assert.ok(isPalindrome('Bird rib.'));
  });

  test('"Bombard a drab mob."', function(assert) {
    assert.ok(isPalindrome('Bombard a drab mob.'));
  });

  test('"boob"', function(assert) {
    assert.ok(isPalindrome('boob'));
  });

  test('"Borrow or rob?"', function(assert) {
    assert.ok(isPalindrome('Borrow or rob?'));
  });

  test('"Bursitis Rub"', function(assert) {
    assert.ok(isPalindrome('Bursitis Rub'));
  });

  test('"Bush saw Sununu swash sub."', function(assert) {
    assert.ok(isPalindrome('Bush saw Sununu swash sub.'));
  });

// C
  test('Cain: a maniac.', function(assert) {
    assert.ok(isPalindrome('Cain: a maniac.'));
  });

  test('“Cain, a motor erotomaniac was Eve,” said I as Eve saw Cain, “a motor erotomaniac!”', function(assert) {
    assert.ok(isPalindrome('“Cain, a motor erotomaniac was Eve,” said I as Eve saw Cain, “a motor erotomaniac!”'));
  });

  test('cammac', function(assert) {
    assert.ok(isPalindrome('cammac'));
  });

  test('Camp Mac', function(assert) {
    assert.ok(isPalindrome('Camp Mac'));
  });

  test('Campus motto: Bottoms up Mac.', function(assert) {
    assert.ok(isPalindrome('Campus motto: Bottoms up Mac.'));
  });

  test('Capac (Michigan)', function(assert) {
    assert.ok(isPalindrome('Capac')); // (Michigan)
  });

  test('Cigar? Toss it in a can. It is so tragic.', function(assert) {
    assert.ok(isPalindrome('Cigar? Toss it in a can. It is so tragic.'));
  });

  test('civic', function(assert) {
    assert.ok(isPalindrome('civic'));
  });

  // D
  test('Daedalus: nine. Peninsula: dead.', function(assert) {
    assert.ok(isPalindrome('Daedalus: nine. Peninsula: dead.'));
  });

  test('Dammit, I’m mad!', function(assert) {
    assert.ok(isPalindrome('Dammit, I’m mad!'));
  });

  test('Decaf and DNA faced.', function(assert) {
    assert.ok(isPalindrome('Decaf and DNA faced.'));
  });

  test('Dee saw a seed.', function(assert) {
    assert.ok(isPalindrome('Dee saw a seed.'));
  });

  test('deified', function(assert) {
    assert.ok(isPalindrome('deified'));
  });

  test('Degas, are we not drawn onward, no? In union, drawn onward to new eras aged?', function(assert) {
    assert.ok(isPalindrome('Degas, are we not drawn onward, no? In union, drawn onward to new eras aged?'));
  });

  test('deleveled', function(assert) {
    assert.ok(isPalindrome('deleveled'));
  });

  test('Delia saw I was ailed.', function(assert) {
    assert.ok(isPalindrome('Delia saw I was ailed.'));
  });

  test('Denim axes examined.', function(assert) {
    assert.ok(isPalindrome('Denim axes examined.'));
  });

  test('“Dennis and Edna dine,” said I, as Enid and Edna sinned.', function(assert) {
    assert.ok(isPalindrome('“Dennis and Edna dine,” said I, as Enid and Edna sinned.'));
  });

  test('Dennis and Edna sinned.', function(assert) {
    assert.ok(isPalindrome('Dennis and Edna sinned.'));
  });

  test('Dennis sinned.', function(assert) {
    assert.ok(isPalindrome('Dennis sinned.'));
  });

  test('Dennis, Eve saw Eden if as a fine dew, as Eve sinned.', function(assert) {
    assert.ok(isPalindrome('Dennis, Eve saw Eden if as a fine dew, as Eve sinned.'));
  });

  test('Dennis, Nell, Edna, Leon, Nedra, Anita, Rolf, Nora, Alice, Carol, Leo, Jane, Reed, Dena, Dale, Basil, Rae, Penny, Lana, Dave, Denny, Lena, Ida, Bernadette, Ben, Ray, Lila, Nina, Jo, Ira, Mara, Sara, Mario, Jan, Ina, Lily, Arne, Bette, Dan, Reba, Diane, Lynn, Ed, Eva, Dana, Lynne, Pearl, Isabel, Ada, Ned, Dee, Rena, Joel, Lora, Cecil, Aaron, Flora, Tina, Arden, Noel, and Ellen sinned.', function(assert) {
    assert.ok(isPalindrome('Dennis, Nell, Edna, Leon, Nedra, Anita, Rolf, Nora, Alice, Carol, Leo, Jane, Reed, Dena, Dale, Basil, Rae, Penny, Lana, Dave, Denny, Lena, Ida, Bernadette, Ben, Ray, Lila, Nina, Jo, Ira, Mara, Sara, Mario, Jan, Ina, Lily, Arne, Bette, Dan, Reba, Diane, Lynn, Ed, Eva, Dana, Lynne, Pearl, Isabel, Ada, Ned, Dee, Rena, Joel, Lora, Cecil, Aaron, Flora, Tina, Arden, Noel, and Ellen sinned.'));
  });

  test('Dentist? Sit Ned.', function(assert) {
    assert.ok(isPalindrome('Dentist? Sit Ned.'));
  });

  test('Depardieu, go razz a rogue I draped.', function(assert) {
    assert.ok(isPalindrome('Depardieu, go razz a rogue I draped.'));
  });

  test('Desserts I desire not, so long no lost one rise distressed.', function(assert) {
    assert.ok(isPalindrome('Desserts I desire not, so long no lost one rise distressed.'));
  });

  test('Desserts, I stressed!', function(assert) {
    assert.ok(isPalindrome('Desserts, I stressed!'));
  });

  test('“Desserts, sis?” (Sensuousness is stressed).', function(assert) {
    assert.ok(isPalindrome('“Desserts, sis?” (Sensuousness is stressed).'));
  });

  test('detartrated', function(assert) {
    assert.ok(isPalindrome('detartrated'));
  });

  test('Devil never even lived.', function(assert) {
    assert.ok(isPalindrome('Devil never even lived.'));
  });

  test('devoved', function(assert) {
    assert.ok(isPalindrome('devoved'));
  });

  test('dewed', function(assert) {
    assert.ok(isPalindrome('dewed'));
  });

  test('Dial Laid', function(assert) {
    assert.ok(isPalindrome('Dial Laid'));
  });

  test('Did Hannah see bees? Hannah did.', function(assert) {
    assert.ok(isPalindrome('Did Hannah see bees? Hannah did.'));
  });

  test('Did I cite Operas Are Poetic? I did.', function(assert) {
    assert.ok(isPalindrome('Did I cite Operas Are Poetic? I did.'));
  });

  test('Did I do, O God, did I as I said I’d do? Good! I did.', function(assert) {
    assert.ok(isPalindrome('Did I do, O God, did I as I said I’d do? Good! I did.'));
  });

  test('Did I draw Della too tall, Edward? I did?', function(assert) {
    assert.ok(isPalindrome('Did I draw Della too tall, Edward? I did?'));
  });

  test('Did mom pop? Mom did.', function(assert) {
    assert.ok(isPalindrome('Did mom pop? Mom did.'));
  });

  test('Didi won straw warts. Now I did.', function(assert) {
    assert.ok(isPalindrome('Didi won straw warts. Now I did.'));
  });

  test('Do geese see God?', function(assert) {
    assert.ok(isPalindrome('Do geese see God?'));
  });

  test('Do good? I? No! Evil anon I deliver. I maim nine more hero-men in Saginaw, sanitary sword a-tuck, Carol, I — lo! — rack, cut a drowsy rat in Aswan. I gas nine more hero-men in Miami. Reviled, I (Nona) live on. I do, O God!', function(assert) {
    assert.ok(isPalindrome('Do good? I? No! Evil anon I deliver. I maim nine more hero-men in Saginaw, sanitary sword a-tuck, Carol, I — lo! — rack, cut a drowsy rat in Aswan. I gas nine more hero-men in Miami. Reviled, I (Nona) live on. I do, O God!'));
  });

  test('Do nine men interpret? Nine men. I nod.', function(assert) {
    assert.ok(isPalindrome('Do nine men interpret? Nine men. I nod.'));
  });

  test('Do not bob to nod.', function(assert) {
    assert.ok(isPalindrome('Do not bob to nod.'));
  });

  test('Do offer ref food.', function(assert) {
    assert.ok(isPalindrome('Do offer ref food.'));
  });

  test('Do, O God, no evil deed! Live on! Do good!', function(assert) {
    assert.ok(isPalindrome('Do, O God, no evil deed! Live on! Do good!'));
  });

  test('Doc, note, I Dissent. A fast never prevents a fatness. I diet on cod.', function(assert) {
    assert.ok(isPalindrome('Doc, note, I Dissent. A fast never prevents a fatness. I diet on cod.'));
  });

  test('Dog doo? Good God!', function(assert) {
    assert.ok(isPalindrome('Dog doo? Good God!'));
  });

  test('Dog! No poop on God!', function(assert) {
    assert.ok(isPalindrome('Dog! No poop on God!'));
  });

  test('Dogma in my hymn: I am God.', function(assert) {
    assert.ok(isPalindrome('Dogma in my hymn: I am God.'));
  });

  test('Dogma: I am God', function(assert) {
    assert.ok(isPalindrome('Dogma: I am God'));
  });

  test('Don’t nod.', function(assert) {
    assert.ok(isPalindrome('Don’t nod.'));
  });

  test('Doom mood', function(assert) {
    assert.ok(isPalindrome('Doom mood'));
  });

  test('Dr. Awkward', function(assert) {
    assert.ok(isPalindrome('Dr. Awkward'));
  });

  test('Drab as a fool, aloof as a bard.', function(assert) {
    assert.ok(isPalindrome('Drab as a fool, aloof as a bard.'));
  });

  test('Drat Saddam! Mad dastard!', function(assert) {
    assert.ok(isPalindrome('Drat Saddam! Mad dastard!'));
  });

  test('Drat such custard!', function(assert) {
    assert.ok(isPalindrome('Drat such custard!'));
  });

  test('Draw Kwan awkward.', function(assert) {
    assert.ok(isPalindrome('Draw Kwan awkward.'));
  });

  test('Draw nine men inward.', function(assert) {
    assert.ok(isPalindrome('Draw nine men inward.'));
  });

  test('Draw O Caesar. Erase a coward.', function(assert) {
    assert.ok(isPalindrome('Draw O Caesar. Erase a coward.'));
  });

  test('Draw pupil’s lip upward.', function(assert) {
    assert.ok(isPalindrome('Draw pupil’s lip upward.'));
  });

  test('Draw Ward', function(assert) {
    assert.ok(isPalindrome('Draw Ward'));
  });

  test('Draw, O coward!', function(assert) {
    assert.ok(isPalindrome('Draw, O coward!'));
  });

  test('Drawer’s reward.', function(assert) {
    assert.ok(isPalindrome('Drawer’s reward.'));
  });

  test('Drawn onward.', function(assert) {
    assert.ok(isPalindrome('Drawn onward.'));
  });

  test('Drawn, I sit; serene rest is inward.', function(assert) {
    assert.ok(isPalindrome('Drawn, I sit; serene rest is inward.'));
  });

  test('Dubya won? No way, bud.', function(assert) {
    assert.ok(isPalindrome('Dubya won? No way, bud.'));
  });

  test('Dumb mud.', function(assert) {
    assert.ok(isPalindrome('Dumb mud.'));
  });

  // E
  test('Ed, I hung a gnu hide!', function(assert) {
    assert.ok(isPalindrome('Ed, I hung a gnu hide!'));
  });

  test('Ed, I saw Harpo Marx ram Oprah W. aside.', function(assert) {
    assert.ok(isPalindrome('Ed, I saw Harpo Marx ram Oprah W. aside.'));
  });

  test('Egad! A base life defiles a bad age.', function(assert) {
    assert.ok(isPalindrome('Egad! A base life defiles a bad age.'));
  });

  test('Egad! A base tone denotes a bad age.', function(assert) {
    assert.ok(isPalindrome('Egad! A base tone denotes a bad age.'));
  });

  test('Egad! An adage!', function(assert) {
    assert.ok(isPalindrome('Egad! An adage!'));
  });

  test('Egad! Loretta has Adams as mad as a hatter. Old age!', function(assert) {
    assert.ok(isPalindrome('Egad! Loretta has Adams as mad as a hatter. Old age!'));
  });

  test('Egad! No bondage?', function(assert) {
    assert.ok(isPalindrome('Egad! No bondage?'));
  });

  test('Elba Kramer saw I was remarkable.', function(assert) {
    assert.ok(isPalindrome('Elba Kramer saw I was remarkable.'));
  });

  test('Elite tile.', function(assert) {
    assert.ok(isPalindrome('Elite tile.'));
  });

  test('Elk rap song? No sparkle.', function(assert) {
    assert.ok(isPalindrome('Elk rap song? No sparkle.'));
  });

  test('Elle', function(assert) {
    assert.ok(isPalindrome('Elle'));
  });

  test('Em to Greg: Gad! A dagger got me!', function(assert) {
    assert.ok(isPalindrome('Em to Greg: Gad! A dagger got me!'));
  });

  test('Emily’s sassy lime', function(assert) {
    assert.ok(isPalindrome('Emily’s sassy lime'));
  });

  test('Emu love volume.', function(assert) {
    assert.ok(isPalindrome('Emu love volume.'));
  });

  test('Enid and Edna dine.', function(assert) {
    assert.ok(isPalindrome('Enid and Edna dine.'));
  });

  test('Ere I saw Elba, able was I ere.', function(assert) {
    assert.ok(isPalindrome('Ere I saw Elba, able was I ere.'));
  });

  test('Ergo, a ogre', function(assert) {
    assert.ok(isPalindrome('Ergo, a ogre'));
  });

  test('Erupt on Naomi? I moan, “Not pure!”', function(assert) {
    assert.ok(isPalindrome('Erupt on Naomi? I moan, “Not pure!”'));
  });

  test('Eva use Suave.', function(assert) {
    assert.ok(isPalindrome('Eva use Suave.'));
  });

  test('Eva, can I stab bats in a cave?', function(assert) {
    assert.ok(isPalindrome('Eva, can I stab bats in a cave?'));
  });

  test('Eve', function(assert) {
    assert.ok(isPalindrome('Eve'));
  });

  test('Eve damned Eden. Mad Eve!', function(assert) {
    assert.ok(isPalindrome('Eve damned Eden. Mad Eve!'));
  });

  test('Eve saw Diamond, erred. No maid was Eve!', function(assert) {
    assert.ok(isPalindrome('Eve saw Diamond, erred. No maid was Eve!'));
  });

  test('“Evil axis”, sides reversed, is “six alive”.', function(assert) {
    assert.ok(isPalindrome('“Evil axis”, sides reversed, is “six alive”.'));
  });

  test('Evi saves God dogs (evasive).', function(assert) {
    assert.ok(isPalindrome('Evi saves God dogs (evasive).'));
  });

  test('Evil did I dwell, lewd I did live.', function(assert) {
    assert.ok(isPalindrome('Evil did I dwell, lewd I did live.'));
  });

  test('Evil olive', function(assert) {
    assert.ok(isPalindrome('Evil olive'));
  });

  test('Evil rats on no star live.', function(assert) {
    assert.ok(isPalindrome('Evil rats on no star live.'));
  });

  test('Evil, a sin, is alive.', function(assert) {
    assert.ok(isPalindrome('Evil, a sin, is alive.'));
  });

  test('evitative', function(assert) {
    assert.ok(isPalindrome('evitative'));
  });

  test('Ew! Eat a ewe?', function(assert) {
    assert.ok(isPalindrome('Ew! Eat a ewe?'));
  });

  // F
  test('Flee to me, remote elf.', function(assert) {
    assert.ok(isPalindrome('Flee to me, remote elf.'));
  });

  // G
  test('Gabe’s on a nosebag.', function(assert) {
    assert.ok(isPalindrome('Gabe’s on a nosebag.'));
  });

  test('Gaby H.’s art saved Eva’s trashy bag.', function(assert) {
    assert.ok(isPalindrome('Gaby H.’s art saved Eva’s trashy bag.'));
  });

  test('Galoots, too, lag.', function(assert) {
    assert.ok(isPalindrome('Galoots, too, lag.'));
  });

  test('Gate man sees name, garage man sees name tag.', function(assert) {
    assert.ok(isPalindrome('Gate man sees name, garage man sees name tag.'));
  });

  test('Glenelg (cities in Ontario, Maryland, and Austrailia)', function(assert) {
    assert.ok(isPalindrome('Glenelg')); // (cities in Ontario, Maryland, and Austrailia)
  });

  test('Gnu dung.', function(assert) {
    assert.ok(isPalindrome('Gnu dung.'));
  });

  test('Go deliver a dare, vile dog!', function(assert) {
    assert.ok(isPalindrome('Go deliver a dare, vile dog!'));
  });

  test('Go dog.', function(assert) {
    assert.ok(isPalindrome('Go dog.'));
  });

  test('Go hang a salami, I’m a lasagna hog.', function(assert) {
    assert.ok(isPalindrome('Go hang a salami, I’m a lasagna hog.'));
  });

  test('God lived as a devil dog.', function(assert) {
    assert.ok(isPalindrome('God lived as a devil dog.'));
  });

  test('God lives, evil dog.', function(assert) {
    assert.ok(isPalindrome('God lives, evil dog.'));
  });

  test('God saw I was dog.', function(assert) {
    assert.ok(isPalindrome('God saw I was dog.'));
  });

  test('God, Art! Name no pup “One Mantra Dog.”', function(assert) {
    assert.ok(isPalindrome('God, Art! Name no pup “One Mantra Dog.”'));
  });

  test('God! A red nugget! A fat egg under a dog!', function(assert) {
    assert.ok(isPalindrome('God! A red nugget! A fat egg under a dog!'));
  });

  test('God’s dog.', function(assert) {
    assert.ok(isPalindrome('God’s dog.'));
  });

  test('Goddamn mad dog!', function(assert) {
    assert.ok(isPalindrome('Goddamn mad dog!'));
  });

  test('Goldenrod-adorned log.', function(assert) {
    assert.ok(isPalindrome('Goldenrod-adorned log.'));
  });

  test('Golf? No sir, prefer prison-flog.', function(assert) {
    assert.ok(isPalindrome('Golf? No sir, prefer prison-flog.'));
  });

  // H
  test('Hanah', function(assert) {
    assert.ok(isPalindrome('Hanah'));
  });

  test('Hannah', function(assert) {
    assert.ok(isPalindrome('Hannah'));
  });

  test('Harass Sarah.', function(assert) {
    assert.ok(isPalindrome('Harass Sarah.'));
  });

  test('Harass sensuousness, Sarah.', function(assert) {
    assert.ok(isPalindrome('Harass sensuousness, Sarah.'));
  });

  test('Harpo: not on Oprah.', function(assert) {
    assert.ok(isPalindrome('Harpo: not on Oprah.'));
  });

  test('He did, eh?', function(assert) {
    assert.ok(isPalindrome('He did, eh?'));
  });

  test('He nips; send a man Anan! A madness pin eh?', function(assert) {
    assert.ok(isPalindrome('He nips; send a man Anan! A madness pin eh?'));
  });

  test('He won snow, eh?', function(assert) {
    assert.ok(isPalindrome('He won snow, eh?'));
  });

  test('He won! Killer! Rad Darrell I know, eh?', function(assert) {
    assert.ok(isPalindrome('He won! Killer! Rad Darrell I know, eh?'));
  });

  test('Hey, Roy! Am I mayor? Yeh!', function(assert) {
    assert.ok(isPalindrome('Hey, Roy! Am I mayor? Yeh!'));
  });

  test('Hon? I see bees in – OH!', function(assert) {
    assert.ok(isPalindrome('Hon? I see bees in – OH!'));
  });

  // I
  test('I did, did I?', function(assert) {
    assert.ok(isPalindrome('I did, did I?'));
  });

  test('I made border bard’s drowsy swords; drab, red robed am I.', function(assert) {
    assert.ok(isPalindrome('I made border bard’s drowsy swords; drab, red robed am I.'));
  });

  test('I prefer pi.', function(assert) {
    assert.ok(isPalindrome('I prefer pi.'));
  });

  test('I roamed under it as a tired, nude Maori.', function(assert) {
    assert.ok(isPalindrome('I roamed under it as a tired, nude Maori.'));
  });

  test('I saw a crow, orca was I.', function(assert) {
    assert.ok(isPalindrome('I saw a crow, orca was I.'));
  });

  test('I saw desserts; I’d no lemons, alas no melon! Distressed was I.', function(assert) {
    assert.ok(isPalindrome('I saw desserts; I’d no lemons, alas no melon! Distressed was I.'));
  });

  test('I saw Ed under Deb’s bed; red, nude was I.', function(assert) {
    assert.ok(isPalindrome('I saw Ed under Deb’s bed; red, nude was I.'));
  });

  test('I, man, am regal; a German am I.', function(assert) {
    assert.ok(isPalindrome('I, man, am regal; a German am I.'));
  });

  test('I’m a lasagna hog, go hang a salami.', function(assert) {
    assert.ok(isPalindrome('I’m a lasagna hog, go hang a salami.'));
  });

  test('I’m a lasagna, bang a salami.', function(assert) {
    assert.ok(isPalindrome('I’m a lasagna, bang a salami.'));
  });

  test('I’m a pup, am I?', function(assert) {
    assert.ok(isPalindrome('I’m a pup, am I?'));
  });

  test('I’m a tune nut, am I?', function(assert) {
    assert.ok(isPalindrome('I’m a tune nut, am I?'));
  });

  test('I’m a fool; aloof am I.', function(assert) {
    assert.ok(isPalindrome('I’m a fool; aloof am I.'));
  });

  test('If I fret, fasten nets after Fifi.', function(assert) {
    assert.ok(isPalindrome('If I fret, fasten nets after Fifi.'));
  });

  test('If I had a hi-fi…', function(assert) {
    assert.ok(isPalindrome('If I had a hi-fi…'));
  });

  test('In a regal age ran I.', function(assert) {
    assert.ok(isPalindrome('In a regal age ran I.'));
  });

  test('In word salad, alas, drown I.', function(assert) {
    assert.ok(isPalindrome('In word salad, alas, drown I.'));
  });

  test('In words, alas, drown I.', function(assert) {
    assert.ok(isPalindrome('In words, alas, drown I.'));
  });

  test('In words, drown I.', function(assert) {
    assert.ok(isPalindrome('In words, drown I.'));
  });

  test('Is it I? It is I!', function(assert) {
    assert.ok(isPalindrome('Is it I? It is I!'));
  });

  // K
  test('Kanakanak (Alaska)', function(assert) {
    assert.ok(isPalindrome('Kanakanak')); // (Alaska)
  });

  test('Kay, a red nude, peeped under a yak.', function(assert) {
    assert.ok(isPalindrome('Kay, a red nude, peeped under a yak.'));
  });

  test('kayak', function(assert) {
    assert.ok(isPalindrome('kayak'));
  });

  test('Kinikinik (Colorado)', function(assert) {
    assert.ok(isPalindrome('Kinikinik')); // (Colorado)
  });

  // L
  test('Lag not, Eno! No gong! Get up! Put eggnog on one-ton gal!', function(assert) {
    assert.ok(isPalindrome('Lag not, Eno! No gong! Get up! Put eggnog on one-ton gal!'));
  });

  test('Lager, sir, is regal.', function(assert) {
    assert.ok(isPalindrome('Lager, sir, is regal.'));
  });

  test('Laid at a dial.', function(assert) {
    assert.ok(isPalindrome('Laid at a dial.'));
  });

  test('Laminated E.T. animal.', function(assert) {
    assert.ok(isPalindrome('Laminated E.T. animal.'));
  });

  test('Late metal.', function(assert) {
    assert.ok(isPalindrome('Late metal.'));
  });

  test('Lay a wallaby baby ball away, Al.', function(assert) {
    assert.ok(isPalindrome('Lay a wallaby baby ball away, Al.'));
  });

  test('lemel', function(assert) {
    assert.ok(isPalindrome('lemel'));
  });

  test('Leon’s noel.', function(assert) {
    assert.ok(isPalindrome('Leon’s noel.'));
  });

  test('Lepers repel.', function(assert) {
    assert.ok(isPalindrome('Lepers repel.'));
  });

  test('Let O’Hara gain an inn in a Niagara hotel.', function(assert) {
    assert.ok(isPalindrome('Let O’Hara gain an inn in a Niagara hotel.'));
  });

  test('Let Omro open one poor motel.', function(assert) {
    assert.ok(isPalindrome('Let Omro open one poor motel.'));
  });

  test('level', function(assert) {
    assert.ok(isPalindrome('level'));
  });

  test('Liam’s mail.', function(assert) {
    assert.ok(isPalindrome('Liam’s mail.'));
  });

  test('Lid off a daffodil.', function(assert) {
    assert.ok(isPalindrome('Lid off a daffodil.'));
  });

  test('Lion oil.', function(assert) {
    assert.ok(isPalindrome('Lion oil.'));
  });

  test('Lisa Bonet ate no basil.', function(assert) {
    assert.ok(isPalindrome('Lisa Bonet ate no basil.'));
  });

  test('Live dirt up a side track carted is a putrid evil.', function(assert) {
    assert.ok(isPalindrome('Live dirt up a side track carted is a putrid evil.'));
  });

  test('Live evil.', function(assert) {
    assert.ok(isPalindrome('Live evil.'));
  });

  test('Live no evil! Live on evil!', function(assert) {
    assert.ok(isPalindrome('Live no evil! Live on evil!'));
  });

  test('Live not on evil.', function(assert) {
    assert.ok(isPalindrome('Live not on evil.'));
  });

  test('Live, O Devil, revel ever! Live! Do evil!', function(assert) {
    assert.ok(isPalindrome('Live, O Devil, revel ever! Live! Do evil!'));
  });

  test('Lived on Decaf; faced no Devil.', function(assert) {
    assert.ok(isPalindrome('Lived on Decaf; faced no Devil.'));
  });

  test('Llama mall.', function(assert) {
    assert.ok(isPalindrome('Llama mall.'));
  });

  test('Lon Nol (Vietnam)', function(assert) {
    assert.ok(isPalindrome('Lon Nol')); // (Vietnam)
  });

  test('Lonely Tylenol.', function(assert) {
    assert.ok(isPalindrome('Lonely Tylenol.'));
  });

  test('Loops at a spool.', function(assert) {
    assert.ok(isPalindrome('Loops at a spool.'));
  });

  // M
  test('Ma has a ham.', function(assert) {
    assert.ok(isPalindrome('Ma has a ham.'));
  });

  test('Ma is a madam, as I am.', function(assert) {
    assert.ok(isPalindrome('Ma is a madam, as I am.'));
  });

  test('Ma is a nun, as I am.', function(assert) {
    assert.ok(isPalindrome('Ma is a nun, as I am.'));
  });

  test('Ma is as selfless as I am.', function(assert) {
    assert.ok(isPalindrome('Ma is as selfless as I am.'));
  });

  test('“Ma,” Jerome raps pot top, “Spare more jam!”', function(assert) {
    assert.ok(isPalindrome('“Ma,” Jerome raps pot top, “Spare more jam!”'));
  });

  test('Mad as Adam.', function(assert) {
    assert.ok(isPalindrome('Mad as Adam.'));
  });

  test('madam', function(assert) {
    assert.ok(isPalindrome('madam'));
  });

  test('Madam in Eden, I’m Adam.', function(assert) {
    assert.ok(isPalindrome('Madam in Eden, I’m Adam.'));
  });

  test('Madam, I’m Adam.', function(assert) {
    assert.ok(isPalindrome('Madam, I’m Adam.'));
  });

  test('Madam, in Eden I’m Adam', function(assert) {
    assert.ok(isPalindrome('Madam, in Eden I’m Adam'));
  });

  test('Madame, not one man is selfless; I name not one, madam.', function(assert) {
    assert.ok(isPalindrome('Madame, not one man is selfless; I name not one, madam.'));
  });

  test('Mail Liam', function(assert) {
    assert.ok(isPalindrome('Mail Liam'));
  });

  test('Malayalam (language)', function(assert) {
    assert.ok(isPalindrome('Malayalam')); // (language)
  });

  test('Maps, DNA, and spam.', function(assert) {
    assert.ok(isPalindrome('Maps, DNA, and spam.'));
  });

  test('Marge lets Norah see Sharon’s telegram.', function(assert) {
    assert.ok(isPalindrome('Marge lets Norah see Sharon’s telegram.'));
  });

  test('Marge, lets send a sadness telegram.', function(assert) {
    assert.ok(isPalindrome('Marge, lets send a sadness telegram.'));
  });

  test('Margot trades used art to gram.', function(assert) {
    assert.ok(isPalindrome('Margot trades used art to gram.'));
  });

  test('Max exam.', function(assert) {
    assert.ok(isPalindrome('Max exam.'));
  });

  test('May a moody baby doom a yam?', function(assert) {
    assert.ok(isPalindrome('May a moody baby doom a yam?'));
  });

  test('Meet animals; laminate ’em.', function(assert) {
    assert.ok(isPalindrome('Meet animals; laminate ’em.'));
  });

  test('Mega gem.', function(assert) {
    assert.ok(isPalindrome('Mega gem.'));
  });

  test('minim', function(assert) {
    assert.ok(isPalindrome('minim'));
  });

  test('Mirror rim', function(assert) {
    assert.ok(isPalindrome('Mirror rim'));
  });

  test('mom', function(assert) {
    assert.ok(isPalindrome('mom'));
  });

  test('Mother Eve’s noose we soon sever, eh Tom?', function(assert) {
    assert.ok(isPalindrome('Mother Eve’s noose we soon sever, eh Tom?'));
  });

  test('Mr. Owl ate my metal worm.', function(assert) {
    assert.ok(isPalindrome('Mr. Owl ate my metal worm.'));
  });

  test('Murder for a jar of red rum.', function(assert) {
    assert.ok(isPalindrome('Murder for a jar of red rum.'));
  });

  test('murdrum', function(assert) {
    assert.ok(isPalindrome('murdrum'));
  });

  test('Must sell at tallest sum.', function(assert) {
    assert.ok(isPalindrome('Must sell at tallest sum.'));
  });

  test('My gay rub won, Star. Rats now bury a gym.', function(assert) {
    assert.ok(isPalindrome('My gay rub won, Star. Rats now bury a gym.'));
  });

  test('My gym.', function(assert) {
    assert.ok(isPalindrome('My gym.'));
  });

  // N
  test('Nail a tired rotini in it, order Italian!', function(assert) {
    assert.ok(isPalindrome('Nail a tired rotini in it, order Italian!'));
  });

  test('Naive Evian', function(assert) {
    assert.ok(isPalindrome('Naive Evian'));
  });

  test('Name no one man.', function(assert) {
    assert.ok(isPalindrome('Name no one man.'));
  });

  test('Name no side in Eden, I’m mad! A maid I am, Adam mine; denied is one man.', function(assert) {
    assert.ok(isPalindrome('Name no side in Eden, I’m mad! A maid I am, Adam mine; denied is one man.'));
  });

  test('Name not one man.', function(assert) {
    assert.ok(isPalindrome('Name not one man.'));
  });

  test('Name now one man.', function(assert) {
    assert.ok(isPalindrome('Name now one man.'));
  });

  test('Name tarts? No, medieval slave, I demonstrate man!', function(assert) {
    assert.ok(isPalindrome('Name tarts? No, medieval slave, I demonstrate man!'));
  });

  test('Name’s Abel, a male, base man.', function(assert) {
    assert.ok(isPalindrome('Name’s Abel, a male, base man.'));
  });

  test('Naomi, did I moan?', function(assert) {
    assert.ok(isPalindrome('Naomi, did I moan?'));
  });

  test('Nat tan', function(assert) {
    assert.ok(isPalindrome('Nat tan'));
  });

  test('Nate bit a tibetan.', function(assert) {
    assert.ok(isPalindrome('Nate bit a tibetan.'));
  });

  test('Navan (Meath, Ireland)', function(assert) {
    assert.ok(isPalindrome('Navan')); // (Meath, Ireland)
  });

  test('Ned, I am a maiden.', function(assert) {
    assert.ok(isPalindrome('Ned, I am a maiden.'));
  });

  test('Ned! go gag Ogden!', function(assert) {
    assert.ok(isPalindrome('Ned! go gag Ogden!'));
  });

  test('Neil, an alien.', function(assert) {
    assert.ok(isPalindrome('Neil, an alien.'));
  });

  test('Nella risks all: “I will ask Sir Allen!”', function(assert) {
    assert.ok(isPalindrome('Nella risks all: “I will ask Sir Allen!”'));
  });

  test('Nemo’s omen.', function(assert) {
    assert.ok(isPalindrome('Nemo’s omen.'));
  });

  test('Neuquen (Argentina)', function(assert) {
    assert.ok(isPalindrome('Neuquen')); // (Argentina)
  });

  test('Never odd or even.', function(assert) {
    assert.ok(isPalindrome('Never odd or even.'));
  });

  test('Niagara, eh? I hear again!', function(assert) {
    assert.ok(isPalindrome('Niagara, eh? I hear again!'));
  });

  test('Niagara, O roar again!', function(assert) {
    assert.ok(isPalindrome('Niagara, O roar again!'));
  });

  test('No “x” in “Nixon.”', function(assert) {
    assert.ok(isPalindrome('No “x” in “Nixon.”'));
  });

  test('No cab, no tuna nut on bacon.', function(assert) {
    assert.ok(isPalindrome('No cab, no tuna nut on bacon.'));
  });

  test('No demerits tire me, Don.', function(assert) {
    assert.ok(isPalindrome('No demerits tire me, Don.'));
  });

  test('No devil lived on.', function(assert) {
    assert.ok(isPalindrome('No devil lived on.'));
  });

  test('No evil shahs live on.', function(assert) {
    assert.ok(isPalindrome('No evil shahs live on.'));
  });

  test('No lemon, no melon.', function(assert) {
    assert.ok(isPalindrome('No lemon, no melon.'));
  });

  test('No lemons, no melon.', function(assert) {
    assert.ok(isPalindrome('No lemons, no melon.'));
  });

  test('No sir! Away! A papaya war is on.', function(assert) {
    assert.ok(isPalindrome('No sir! Away! A papaya war is on.'));
  });

  test('No trace, not one carton.', function(assert) {
    assert.ok(isPalindrome('No trace, not one carton.'));
  });

  test('No, I save on final perusal – a sure plan if no evasion.', function(assert) {
    assert.ok(isPalindrome('No, I save on final perusal – a sure plan if no evasion.'));
  });

  test('No, I tan at a nation.', function(assert) {
    assert.ok(isPalindrome('No, I tan at a nation.'));
  });

  test('No, I told Ed “lotion.”', function(assert) {
    assert.ok(isPalindrome('No, I told Ed “lotion.”'));
  });

  test('No, it can assess an action.', function(assert) {
    assert.ok(isPalindrome('No, it can assess an action.'));
  });

  test('No, it is open on one position.', function(assert) {
    assert.ok(isPalindrome('No, it is open on one position.'));
  });

  test('No, it is opposed: art sees trade’s opposition.', function(assert) {
    assert.ok(isPalindrome('No, it is opposed: art sees trade’s opposition.'));
  });

  test('No, it is opposition.', function(assert) {
    assert.ok(isPalindrome('No, it is opposition.'));
  });

  test('No, it never propagates if I set a gap or prevention', function(assert) {
    assert.ok(isPalindrome('No, it never propagates if I set a gap or prevention'));
  });

  test('No, it’s Abe Sebastion.', function(assert) {
    assert.ok(isPalindrome('No, it’s Abe Sebastion.'));
  });

  test('No, it’s a bar of gold – a bad log for a bastion.', function(assert) {
    assert.ok(isPalindrome('No, it’s a bar of gold – a bad log for a bastion.'));
  });

  test('No, Mel Gibson is a casino’s big lemon.', function(assert) {
    assert.ok(isPalindrome('No, Mel Gibson is a casino’s big lemon.'));
  });

  test('No, Miss Lianne draws as Warden nails Simon.', function(assert) {
    assert.ok(isPalindrome('No, Miss Lianne draws as Warden nails Simon.'));
  });

  test('No, sir, away! A papaya war is on!', function(assert) {
    assert.ok(isPalindrome('No, sir, away! A papaya war is on!'));
  });

  test('No, Sir, panic is a basic in a prison.', function(assert) {
    assert.ok(isPalindrome('No, Sir, panic is a basic in a prison.'));
  });

  test('No, son! Onanism’s a gross orgasm sin – a no-no, son!', function(assert) {
    assert.ok(isPalindrome('No, son! Onanism’s a gross orgasm sin – a no-no, son!'));
  });

  test('No, tie it on.', function(assert) {
    assert.ok(isPalindrome('No, tie it on.'));
  });

  test('Nod off, obese boffo don.', function(assert) {
    assert.ok(isPalindrome('Nod off, obese boffo don.'));
  });

  test('Nola’s salon.', function(assert) {
    assert.ok(isPalindrome('Nola’s salon.'));
  });

  test('noon', function(assert) {
    assert.ok(isPalindrome('noon'));
  });

  test('Norma is as selfless as I am, Ron.', function(assert) {
    assert.ok(isPalindrome('Norma is as selfless as I am, Ron.'));
  });

  test('Not a banana baton.', function(assert) {
    assert.ok(isPalindrome('Not a banana baton.'));
  });

  test('Now do I repay a period won.', function(assert) {
    assert.ok(isPalindrome('Now do I repay a period won.'));
  });

  test('Now ere we nine were held idle here, we nine were won.', function(assert) {
    assert.ok(isPalindrome('Now ere we nine were held idle here, we nine were won.'));
  });

  test('Now I draw an award. I won!', function(assert) {
    assert.ok(isPalindrome('Now I draw an award. I won!'));
  });

  test('Now I see bees I won.', function(assert) {
    assert.ok(isPalindrome('Now I see bees I won.'));
  });

  test('Now I won.', function(assert) {
    assert.ok(isPalindrome('Now I won.'));
  });

  // test('NOW NO SWIMS ON MON (Upside down).', function(assert) {
  //   assert.ok(isPalindrome('NOW NO SWIMS ON MON.')); // (Upside down)
  // });

  test('Nurse, I spy gypsies. Run!', function(assert) {
    assert.ok(isPalindrome('Nurse, I spy gypsies. Run!'));
  });

  test('Nurses run.', function(assert) {
    assert.ok(isPalindrome('Nurses run.'));
  });

  // O
  test('O Geronimo, no minor ego.', function(assert) {
    assert.ok(isPalindrome('O Geronimo, no minor ego.'));
  });

  test('O, stone, be not so.', function(assert) {
    assert.ok(isPalindrome('O, stone, be not so.'));
  });

  test('Ogopogo (lake monster)', function(assert) {
    assert.ok(isPalindrome('Ogopogo')); // (lake monster)
  });

  test('Oh no! Don Ho!', function(assert) {
    assert.ok(isPalindrome('Oh no! Don Ho!'));
  });

  test('Oh, cameras are macho.', function(assert) {
    assert.ok(isPalindrome('Oh, cameras are macho.'));
  });

  test('Olson is in Oslo.', function(assert) {
    assert.ok(isPalindrome('Olson is in Oslo.'));
  });

  test('On a clover, if alive, erupts a vast, pure evil; a fire volcano.', function(assert) {
    assert.ok(isPalindrome('On a clover, if alive, erupts a vast, pure evil; a fire volcano.'));
  });

  test('Oozy rat in a sanitary zoo.', function(assert) {
    assert.ok(isPalindrome('Oozy rat in a sanitary zoo.'));
  });

  test('Oprah deified Harpo.', function(assert) {
    assert.ok(isPalindrome('Oprah deified Harpo.'));
  });

  test('Otto made Ned a motto.', function(assert) {
    assert.ok(isPalindrome('Otto made Ned a motto.'));
  });

  test('Otto sees Otto.', function(assert) {
    assert.ok(isPalindrome('Otto sees Otto.'));
  });

  // P
  test('Pa’s a sap.', function(assert) {
    assert.ok(isPalindrome('Pa’s a sap.'));
  });

  test('Party boobytrap.', function(assert) {
    assert.ok(isPalindrome('Party boobytrap.'));
  });

  test('party-trap', function(assert) {
    assert.ok(isPalindrome('party-trap'));
  });

  // ?
  test('peeweepPass mom’s sap.', function(assert) {
    assert.ok(isPalindrome('Pass mom’s sap.'));
  });

  test('Pets tell Abe ballet step.', function(assert) {
    assert.ok(isPalindrome('Pets tell Abe ballet step.'));
  });

  test('Pooh animals slam in a hoop.', function(assert) {
    assert.ok(isPalindrome('Pooh animals slam in a hoop.'));
  });

  test('Pool loop.', function(assert) {
    assert.ok(isPalindrome('Pool loop.'));
  });

  test('Poor Dan is in a droop.', function(assert) {
    assert.ok(isPalindrome('Poor Dan is in a droop.'));
  });

  test('Pot top.', function(assert) {
    assert.ok(isPalindrome('Pot top.'));
  });

  test('POW, ami! O’ Gad, ami! Go hang a salami, doc! Note; I dissent. A fast never prevents a fatness. I diet on cod. I’m a lasagna hog. I’m a dago! I’m a wop!', function(assert) {
    assert.ok(isPalindrome('POW, ami! O’ Gad, ami! Go hang a salami, doc! Note; I dissent. A fast never prevents a fatness. I diet on cod. I’m a lasagna hog. I’m a dago! I’m a wop!'));
  });

  test('Pull up if I pull up.', function(assert) {
    assert.ok(isPalindrome('Pull up if I pull up.'));
  });

  test('Pull up, Eva, we’re here! Wave! Pull up!', function(assert) {
    assert.ok(isPalindrome('Pull up, Eva, we’re here! Wave! Pull up!'));
  });

  test('Pusillanimity obsesses Boy Tim in All Is Up.', function(assert) {
    assert.ok(isPalindrome('Pusillanimity obsesses Boy Tim in All Is Up.'));
  });

  test('Put Eliot’s toilet up.', function(assert) {
    assert.ok(isPalindrome('Put Eliot’s toilet up.'));
  });

  // R
  test('Race fast, safe car!', function(assert) {
    assert.ok(isPalindrome('Race fast, safe car!'));
  });

  test('racecar', function(assert) {
    assert.ok(isPalindrome('racecar'));
  });

  test('radar', function(assert) {
    assert.ok(isPalindrome('radar'));
  });

  test('Rae hired Leif as a fielder, I hear…', function(assert) {
    assert.ok(isPalindrome('Rae hired Leif as a fielder, I hear…'));
  });

  test('Rail delivers reviled liar', function(assert) {
    assert.ok(isPalindrome('Rail delivers reviled liar'));
  });

  test('Rats at a bar grab at a star.', function(assert) {
    assert.ok(isPalindrome('Rats at a bar grab at a star.'));
  });

  test('Rats live on no evil star.', function(assert) {
    assert.ok(isPalindrome('Rats live on no evil star.'));
  });

  test('Rats paraded a rapstar.', function(assert) {
    assert.ok(isPalindrome('Rats paraded a rapstar.'));
  });

  test('Raw Novel? Lev on War.', function(assert) {
    assert.ok(isPalindrome('Raw Novel? Lev on War.'));
  });

  test('Red I.V.? I derail Ali, a redivider.', function(assert) {
    assert.ok(isPalindrome('Red I.V.? I derail Ali, a redivider.'));
  });

  test('Red root put up to order.', function(assert) {
    assert.ok(isPalindrome('Red root put up to order.'));
  });

  test('Red rum, sir, is murder.', function(assert) {
    assert.ok(isPalindrome('Red rum, sir, is murder.'));
  });

  test('redder', function(assert) {
    assert.ok(isPalindrome('redder'));
  });

  test('refer', function(assert) {
    assert.ok(isPalindrome('refer'));
  });

  test('reifier', function(assert) {
    assert.ok(isPalindrome('reifier'));
  });

  test('Renner (South Dakota)', function(assert) {
    assert.ok(isPalindrome('Renner')); // (South Dakota)
  });

  test('repaper', function(assert) {
    assert.ok(isPalindrome('repaper'));
  });

  test('Repel a leper.', function(assert) {
    assert.ok(isPalindrome('Repel a leper.'));
  });

  test('Retracting, I sign it, Carter.', function(assert) {
    assert.ok(isPalindrome('Retracting, I sign it, Carter.'));
  });

  test('Revered now, I live on. O did I do no evil, I wonder, ever?', function(assert) {
    assert.ok(isPalindrome('Revered now, I live on. O did I do no evil, I wonder, ever?'));
  });

  test('“Reviled did I live,” said I, “as evil I did deliver!”', function(assert) {
    assert.ok(isPalindrome('“Reviled did I live,” said I, “as evil I did deliver!”'));
  });

  test('reviverReward drawer.', function(assert) {
    assert.ok(isPalindrome('Reward drawer.'));
  });

  test('Rise to vote sir.', function(assert) {
    assert.ok(isPalindrome('Rise to vote sir.'));
  });

  test('Ron! OH! Sex in a Toyota nixes honor!', function(assert) {
    assert.ok(isPalindrome('Ron! OH! Sex in a Toyota nixes honor!'));
  });

  test('Rot a renegade, wed a generator.', function(assert) {
    assert.ok(isPalindrome('Rot a renegade, wed a generator.'));
  });

  test('rotator', function(assert) {
    assert.ok(isPalindrome('rotator'));
  });

  test('rotavator', function(assert) {
    assert.ok(isPalindrome('rotavator'));
  });

  test('“Rum… rum…” I murmur.', function(assert) {
    assert.ok(isPalindrome('“Rum… rum…” I murmur.'));
  });

  test('rotor', function(assert) {
    assert.ok(isPalindrome('rotor'));
  });

  // S
  test('sagas', function(assert) {
    assert.ok(isPalindrome('sagas'));
  });

  test('Salt an atlas.', function(assert) {
    assert.ok(isPalindrome('Salt an atlas.'));
  });

  test('Satan, oscillate my metallic sonatas!', function(assert) {
    assert.ok(isPalindrome('Satan, oscillate my metallic sonatas!'));
  });

  test('Saw tide rose? So red it was.', function(assert) {
    assert.ok(isPalindrome('Saw tide rose? So red it was.'));
  });

  test('See, slave, I demonstrate yet arts no medieval sees.', function(assert) {
    assert.ok(isPalindrome('See, slave, I demonstrate yet arts no medieval sees.'));
  });

  test('Sega? Millions! Alas, no ill images!', function(assert) {
    assert.ok(isPalindrome('Sega? Millions! Alas, no ill images!'));
  });

  test('Selim’s tired – no wonder, it’s miles!', function(assert) {
    assert.ok(isPalindrome('Selim’s tired – no wonder, it’s miles!'));
  });

  test('Semmes (Alabama)', function(assert) {
    assert.ok(isPalindrome('Semmes')); // (Alabama)
  });

  test('Semite times.', function(assert) {
    assert.ok(isPalindrome('Semite times.'));
  });

  test('Senile felines.', function(assert) {
    assert.ok(isPalindrome('Senile felines.'));
  });

  test('Seven eves.', function(assert) {
    assert.ok(isPalindrome('Seven eves.'));
  });

  test('Sex at noon taxes.', function(assert) {
    assert.ok(isPalindrome('Sex at noon taxes.'));
  });

  test('Sex-aware era waxes.', function(assert) {
    assert.ok(isPalindrome('Sex-aware era waxes.'));
  });

  test('sexes', function(assert) {
    assert.ok(isPalindrome('sexes'));
  });

  test('Sh…Tom sees moths.', function(assert) {
    assert.ok(isPalindrome('Sh…Tom sees moths.'));
  });

  test('Sir, I eye Iris.', function(assert) {
    assert.ok(isPalindrome('Sir, I eye Iris.'));
  });

  test('Sir, I’m Iris.', function(assert) {
    assert.ok(isPalindrome('Sir, I’m Iris.'));
  });

  test('“Sissy as a nana” says sis.', function(assert) {
    assert.ok(isPalindrome('“Sissy as a nana” says sis.'));
  });

  test('Sit on a potato pan Otis!', function(assert) {
    assert.ok(isPalindrome('Sit on a potato pan Otis!'));
  });

  test('Slap a ham on Omaha, pals.', function(assert) {
    assert.ok(isPalindrome('Slap a ham on Omaha, pals.'));
  });

  test('Smart rams.', function(assert) {
    assert.ok(isPalindrome('Smart rams.'));
  });

  test('So Ida, adios.', function(assert) {
    assert.ok(isPalindrome('So Ida, adios.'));
  });

  test('So many dynamos!', function(assert) {
    assert.ok(isPalindrome('So many dynamos!'));
  });

  test('So, cat tacos!', function(assert) {
    assert.ok(isPalindrome('So, cat tacos!'));
  });

  test('Solo gigolos.', function(assert) {
    assert.ok(isPalindrome('Solo gigolos.'));
  });

  test('solos', function(assert) {
    assert.ok(isPalindrome('solos'));
  });

  test('Some emos', function(assert) {
    assert.ok(isPalindrome('Some emos'));
  });

  test('Some men interpret nine memos.', function(assert) {
    assert.ok(isPalindrome('Some men interpret nine memos.'));
  });

  test('Soreya, say eros.', function(assert) {
    assert.ok(isPalindrome('Soreya, say eros.'));
  });

  test('spacecaps', function(assert) {
    assert.ok(isPalindrome('spacecaps'));
  });

  test('Stab nail at ill Italian bats.', function(assert) {
    assert.ok(isPalindrome('Stab nail at ill Italian bats.'));
  });

  test('Stack cats.', function(assert) {
    assert.ok(isPalindrome('Stack cats.'));
  });

  test('Star comedy by Democrats.', function(assert) {
    assert.ok(isPalindrome('Star comedy by Democrats.'));
  });

  test('Star rats.', function(assert) {
    assert.ok(isPalindrome('Star rats.'));
  });

  test('Star? Come, Donna Melba, I’m an amiable man – no Democrats!', function(assert) {
    assert.ok(isPalindrome('Star? Come, Donna Melba, I’m an amiable man – no Democrats!'));
  });

  test('stats', function(assert) {
    assert.ok(isPalindrome('stats'));
  });

  test('Stella won no wallets.', function(assert) {
    assert.ok(isPalindrome('Stella won no wallets.'));
  });

  test('Step on no pets.', function(assert) {
    assert.ok(isPalindrome('Step on no pets.'));
  });

  test('Step pals never even slap pets.', function(assert) {
    assert.ok(isPalindrome('Step pals never even slap pets.'));
  });

  test('Steven, I left an oily lion at feline vets.', function(assert) {
    assert.ok(isPalindrome('Steven, I left an oily lion at feline vets.'));
  });

  test('Stop on no pots.', function(assert) {
    assert.ok(isPalindrome('Stop on no pots.'));
  });

  test('Stop pots.', function(assert) {
    assert.ok(isPalindrome('Stop pots.'));
  });

  test('Stop! Murder us not, tonsured rumpots!', function(assert) {
    assert.ok(isPalindrome('Stop! Murder us not, tonsured rumpots!'));
  });

  test('Strap on no parts.', function(assert) {
    assert.ok(isPalindrome('Strap on no parts.'));
  });

  test('Straw warts', function(assert) {
    assert.ok(isPalindrome('Straw warts'));
  });

  test('Straw? No, too stupid a fad; I put soot on warts.', function(assert) {
    assert.ok(isPalindrome('Straw? No, too stupid a fad; I put soot on warts.'));
  });

  test('Stressed desserts', function(assert) {
    assert.ok(isPalindrome('Stressed desserts'));
  });

  test('Stressed was I ere I saw desserts.', function(assert) {
    assert.ok(isPalindrome('Stressed was I ere I saw desserts.'));
  });

  test('Stressed? No tips? Spit on desserts.', function(assert) {
    assert.ok(isPalindrome('Stressed? No tips? Spit on desserts.'));
  });

  test('Stunt nuts.', function(assert) {
    assert.ok(isPalindrome('Stunt nuts.'));
  });

  test('Sums are not set as a test on Erasmus.', function(assert) {
    assert.ok(isPalindrome('Sums are not set as a test on Erasmus.'));
  });

  test('Swap God for a janitor; rot in a jar of dog paws.', function(assert) {
    assert.ok(isPalindrome('Swap God for a janitor; rot in a jar of dog paws.'));
  });

  // T
  test('T. Eliot, top bard, notes putrid tang emanating, is sad. I’d assign it a name: gnat dirt upset on drab pot-toilet.', function(assert) {
    assert.ok(isPalindrome('T. Eliot, top bard, notes putrid tang emanating, is sad. I’d assign it a name: gnat dirt upset on drab pot-toilet.'));
  });

  test('Tahitti hat.', function(assert) {
    assert.ok(isPalindrome('Tahitti hat.'));
  });

  test('Tangy gnat.', function(assert) {
    assert.ok(isPalindrome('Tangy gnat.'));
  });

  test('Tarzan raised Desi Arnaz’ rat.', function(assert) {
    assert.ok(isPalindrome('Tarzan raised Desi Arnaz’ rat.'));
  });

  test('Tell a ballet.', function(assert) {
    assert.ok(isPalindrome('Tell a ballet.'));
  });

  test('Ten animals I slam in a net.', function(assert) {
    assert.ok(isPalindrome('Ten animals I slam in a net.'));
  });

  test('tenet', function(assert) {
    assert.ok(isPalindrome('tenet'));
  });

  test('terret', function(assert) {
    assert.ok(isPalindrome('terret'));
  });

  test('Test tube butt set.', function(assert) {
    assert.ok(isPalindrome('Test tube butt set.'));
  });

  test('testset', function(assert) {
    assert.ok(isPalindrome('testset'));
  });

  test('Tide net safe soon; a noose fastened it.', function(assert) {
    assert.ok(isPalindrome('Tide net safe soon; a noose fastened it.'));
  });

  test('“Tie Mandie,” I’d name it.', function(assert) {
    assert.ok(isPalindrome('“Tie Mandie,” I’d name it.'));
  });

  test('Tino dump mud on it.', function(assert) {
    assert.ok(isPalindrome('Tino dump mud on it.'));
  });

  test('Tips spill, lips spit.', function(assert) {
    assert.ok(isPalindrome('Tips spill, lips spit.'));
  });

  test('Tis but a tub. Sit.', function(assert) {
    assert.ok(isPalindrome('Tis but a tub. Sit.'));
  });

  test('To idiot.', function(assert) {
    assert.ok(isPalindrome('To idiot.'));
  });

  test('Todd erases a red dot.', function(assert) {
    assert.ok(isPalindrome('Todd erases a red dot.'));
  });

  test('Tons I tore his kayaks – I, hero, ’tis not.', function(assert) {
    assert.ok(isPalindrome('Tons I tore his kayaks – I, hero, ’tis not.'));
  });

  test('Tons o’ snot.', function(assert) {
    assert.ok(isPalindrome('Tons o’ snot.'));
  });

  test('Too bad I hid a boot.', function(assert) {
    assert.ok(isPalindrome('Too bad I hid a boot.'));
  });

  test('Too far, Edna, we wander afoot.', function(assert) {
    assert.ok(isPalindrome('Too far, Edna, we wander afoot.'));
  });

  test('Too hot to hoot.', function(assert) {
    assert.ok(isPalindrome('Too hot to hoot.'));
  });

  test('Top spot.', function(assert) {
    assert.ok(isPalindrome('Top spot.'));
  });

  test('Top step’s pup’s pet spot.', function(assert) {
    assert.ok(isPalindrome('Top step’s pup’s pet spot.'));
  });

  test('Trays simple help, missy art!', function(assert) {
    assert.ok(isPalindrome('Trays simple help, missy art!'));
  });

  test('Tsetse’s test.', function(assert) {
    assert.ok(isPalindrome('Tsetse’s test.'));
  });

  test('Tube debut.', function(assert) {
    assert.ok(isPalindrome('Tube debut.'));
  });

  test('Tulsa night life: filth, gin, a slut.', function(assert) {
    assert.ok(isPalindrome('Tulsa night life: filth, gin, a slut.'));
  });

  test('Tumut (Australia)', function(assert) {
    assert.ok(isPalindrome('Tumut')); // (Australia)
  });

  test('Tuna nut.', function(assert) {
    assert.ok(isPalindrome('Tuna nut.'));
  });

  test('Tuna roll or a nut?', function(assert) {
    assert.ok(isPalindrome('Tuna roll or a nut?'));
  });

  // U
  test('UFO tofu.', function(assert) {
    assert.ok(isPalindrome('UFO tofu.'));
  });

  // W
  test('Walmart’s tram law.', function(assert) {
    assert.ok(isPalindrome('Walmart’s tram law.'));
  });

  test('Wanna tan? Naw.', function(assert) {
    assert.ok(isPalindrome('Wanna tan? Naw.'));
  });

  test('Ward Draw (South Dakota)', function(assert) {
    assert.ok(isPalindrome('Ward Draw')); // (South Dakota)
  });

  test('Warsaw was raw.', function(assert) {
    assert.ok(isPalindrome('Warsaw was raw.'));
  });

  test('Was it a bar or a bat I saw?', function(assert) {
    assert.ok(isPalindrome('Was it a bar or a bat I saw?'));
  });

  test('Was it a bat I saw?', function(assert) {
    assert.ok(isPalindrome('Was it a bat I saw?'));
  });

  test('Was it a car or a cat I saw?', function(assert) {
    assert.ok(isPalindrome('Was it a car or a cat I saw?'));
  });

  test('Was it a cat I saw?', function(assert) {
    assert.ok(isPalindrome('Was it a cat I saw?'));
  });

  test('Was it a rat I saw?', function(assert) {
    assert.ok(isPalindrome('Was it a rat I saw?'));
  });

  test('Was it Eliot’s toilet I saw?', function(assert) {
    assert.ok(isPalindrome('Was it Eliot’s toilet I saw?'));
  });

  test('Wassamassaw (South Carolina)', function(assert) {
    assert.ok(isPalindrome('Wassamassaw')); // (South Carolina)
  });

  test('Waste Pa, pet saw.', function(assert) {
    assert.ok(isPalindrome('Waste Pa, pet saw.'));
  });

  test('We few.', function(assert) {
    assert.ok(isPalindrome('We few.'));
  });

  test('We panic in a pew.', function(assert) {
    assert.ok(isPalindrome('We panic in a pew.'));
  });

  test('We sew, ewe sew.', function(assert) {
    assert.ok(isPalindrome('We sew, ewe sew.'));
  });

  test('We sew.', function(assert) {
    assert.ok(isPalindrome('We sew.'));
  });

  test('Wet sanitary rat in a stew.', function(assert) {
    assert.ok(isPalindrome('Wet sanitary rat in a stew.'));
  });

  test('Wet stew.', function(assert) {
    assert.ok(isPalindrome('Wet stew.'));
  });

  test('Wo Nemo toss a lasso to me now!', function(assert) {
    assert.ok(isPalindrome('Wo Nemo toss a lasso to me now!'));
  });

  test('Won kiosk. So, I know.', function(assert) {
    assert.ok(isPalindrome('Won kiosk. So, I know.'));
  });

  test('Won tons? Not now.', function(assert) {
    assert.ok(isPalindrome('Won tons? Not now.'));
  });

  test('Won’t I panic in a pit now?', function(assert) {
    assert.ok(isPalindrome('Won’t I panic in a pit now?'));
  });

  test('Won’t it now?', function(assert) {
    assert.ok(isPalindrome('Won’t it now?'));
  });

  test('Won’t lovers revolt now?', function(assert) {
    assert.ok(isPalindrome('Won’t lovers revolt now?'));
  });

  test('Wonder if Sununu’s fired now.', function(assert) {
    assert.ok(isPalindrome('Wonder if Sununu’s fired now.'));
  });

  test('Wonders in Italy, Latin is red now.', function(assert) {
    assert.ok(isPalindrome('Wonders in Italy, Latin is red now.'));
  });

  test('Wonton? Not now.', function(assert) {
    assert.ok(isPalindrome('Wonton? Not now.'));
  });

  // Y
  test('Ya, Decaf. FACE DAY!!', function(assert) {
    assert.ok(isPalindrome('Ya, Decaf. FACE DAY!!'));
  });

  test('Ya! Pizza zip pizazz! I pay.', function(assert) {
    assert.ok(isPalindrome('Ya! Pizza zip pizazz! I pay.'));
  });

  test('Yawn a more Roman way.', function(assert) {
    assert.ok(isPalindrome('Yawn a more Roman way.'));
  });

  test('Yawn…Madonna fan? No damn way!!', function(assert) {
    assert.ok(isPalindrome('Yawn…Madonna fan? No damn way!!'));
  });

  test('Ye boil! I obey!', function(assert) {
    assert.ok(isPalindrome('Ye boil! I obey!'));
  });

  test('Yen o’ money.', function(assert) {
    assert.ok(isPalindrome('Yen o’ money.'));
  });

  test('Yo banana boy!', function(assert) {
    assert.ok(isPalindrome('Yo banana boy!'));
  });

  test('Yo bozo boy!', function(assert) {
    assert.ok(isPalindrome('Yo bozo boy!'));
  });

  test('Yo bro! Free beer for boy!', function(assert) {
    assert.ok(isPalindrome('Yo bro! Free beer for boy!'));
  });

  test('Yo, banana boy!', function(assert) {
    assert.ok(isPalindrome('Yo, banana boy!'));
  });

  test('Yo, Bob! Mug o’ gumbo, boy!', function(assert) {
    assert.ok(isPalindrome('Yo, Bob! Mug o’ gumbo, boy!'));
  });

  test('Yo, bottoms up! (U.S. motto, boy.)', function(assert) {
    assert.ok(isPalindrome('Yo, bottoms up! (U.S. motto, boy.)'));
  });

  test('Yreka Bakery (Yreka, California)', function(assert) {
    assert.ok(isPalindrome('Yreka Bakery')); // (Yreka, California)
  });

  // Z
  test('Zerimar Ramirez (actual person)', function(assert) {
    assert.ok(isPalindrome('Zerimar Ramirez')); // (actual person)
  });

  test('Zerorez (A carpet cleaning company)', function(assert) {
    assert.ok(isPalindrome('Zerorez')); // (A carpet cleaning company)
  });

  test('Zeus was deified, saw Suez.', function(assert) {
    assert.ok(isPalindrome('Zeus was deified, saw Suez.'));
  });

});
