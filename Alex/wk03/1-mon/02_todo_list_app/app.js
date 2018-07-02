console.log('task manager');

var todoItems = document.querySelectorAll('li'); // find all todo items
var completedCount = document.querySelector('.completed-count');

var updateCompleteCount = function() {
  completedCount.innerText = document.querySelectorAll('.completed').length;
  completedCount.parentNode.replaceChild(completedCount, completedCount);
}

var markComplete = function(event) {
  // event.target
  // debugger

  // todoItems[0].style.textDecoration = 'line-through';
  // event.target.style.textDecoration = 'line-through';
  // event.target.className = 'completed';
  // event.target.classList.add('completed');

  // if (event.target.classList.contains('completed')) {
  //   event.target.classList.remove('completed');
  // } else {
  //   event.target.classList.add('completed');
  // }
  event.target.classList.toggle('completed');
  updateCompleteCount();
};

// todoItems[0].addEventListener('click', function() {});
// todoItems[0].addEventListener('click', markComplete);

// // todoItems[0].addEventListener('click', markComplete);
// // todoItems[1].addEventListener('click', markComplete);
// // todoItems[2].addEventListener('click', markComplete);
// // todoItems[3].addEventListener('click', markComplete);
// // todoItems[4].addEventListener('click', markComplete);
// for (var i = 0; i < todoItems.length; i++) {
//   todoItems[i].addEventListener('click', markComplete);
// }

todoItems.forEach(function(item) {
  item.addEventListener('click', markComplete);
});

