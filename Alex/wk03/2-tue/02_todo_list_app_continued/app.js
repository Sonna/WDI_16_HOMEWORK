console.log('task manager');

var footer = document.querySelector('footer');
var completedCount = document.querySelector('.completed-count');
var todoItems = document.querySelectorAll('li'); // find all todo items
var resetBtn = document.querySelector('button.reset');

var updateCompleteCount = function() {
  completedCount.textContent = document.querySelectorAll('.completed').length;

  if (Number(completedCount.textContent) === todoItems.length) {
    footer.classList.remove('hidden');
  } else {
    footer.classList.add('hidden');
  }
}

var markComplete = function(event) {
  event.target.classList.toggle('completed');
  updateCompleteCount();
};

todoItems.forEach(function(item) {
  item.addEventListener('click', markComplete);
});

var resetTodos = function() {
  todoItems.forEach(function(item) {
    item.classList.remove('completed');
  });
}

resetBtn.addEventListener('click', resetTodos);
