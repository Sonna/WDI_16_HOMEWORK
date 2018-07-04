// document.body.children[0]
// document.body.children[1]

// document.body.children[1].setAttribute('style', 'background-color: darkolivegreen;');
// document.body.children[1].style.backgroundColor = 'darkolivegreen';

// document.body.children[1].style.backgroundColor = 'mintgreen';


document.getElementsByClassName('flush-btn')[0].addEventListener('click', function() {
  // event.preventDefault();
  // document.body.children[1].style.backgroundColor = 'darkolivegreen';
  document.body.children[1].style.backgroundColor = 'mintgreen';
});
