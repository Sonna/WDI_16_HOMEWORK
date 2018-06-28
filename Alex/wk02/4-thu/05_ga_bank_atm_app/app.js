// ---
// source:
// - title: WDI GA Bank Lab
//   url: https://gist.github.com/kasun-maldeni/050cbc9fb8196581bc9e76d0b9d25168
// ---

// # GA Bank ATM App

// ### Summary

// This lab will help you practice JavaScript functions and manipulating the
// DOM. You'll be selecting elements, manipulating HTML, and manipulating style
// along with building out the logic using JavaScript.

// ### Specification:

// * Keep track of the checking and savings balances somewhere
var checking = { balance: 0 };
var savings = { balance: 0 };

// * Add functionality so that a user can deposit money into one of the bank
//   accounts.
var deposit = function(amount, account) {
  account.balance += amount;
  return account.balance;
};

// * Make sure you are updating the display and manipulating the HTML of the
//   page so a user can see the change.
var checkingEl = document.querySelector('#checking');
var savingsEl = document.querySelector('#savings');

var checkingBalanceEl = document.querySelector('#checking .balance');
var savingsBalanceEl = document.querySelector('#savings .balance');

var checkingAmountInputEl = document.querySelector('#checking input');
var savingsAmountInputEl = document.querySelector('#savings input');

var checkingDepositButtonEl = document.querySelector('#checking button.deposit');
var savingsDepositButtonEl = document.querySelector('#savings button.deposit');
var checkingWithdrawButtonEl = document.querySelector('#checking button.withdraw');
var savingsWithdrawButtonEl = document.querySelector('#savings button.withdraw');

checkingBalanceEl.textContent = '$' + checking.balance.toFixed(2).padStart(5, '0');
savingsBalanceEl.textContent = '$' + savings.balance.toFixed(2).padStart(5, '0');

// * Add functionality so that a user can withdraw money from one of the bank
//   accounts.
var withdraw = function(amount, account) {
  if (account.balance - amount >= 0.00) {
    account.balance -= amount;
  }
  return account.balance;
};

// * Make sure you are updating the display and manipulating the HTML of the
//   page so a user can see the change.
// * Make sure the balance in an account can't go negative. If a user tries to
//   withdraw more money than exists in the account, ignore the transaction.
// * When the balance of the bank account is $0 the background of that bank
//   account should be red. It should be gray when there is money in the account
var updateAccountBackground = function(account, el) {
  if (account.balance === 0.00) {
    el.style.backgroundColor = 'red';
  } else {
    el.style.backgroundColor = 'gray';
  }
}
// updateAccountBackground(checking, checkingEl);
// updateAccountBackground(savings, savingsEl);

checkingDepositButtonEl.addEventListener('click', function() {
  var amount = Number(checkingAmountInputEl.value);
  checkingBalanceEl.textContent = '$' + deposit(amount, checking).toFixed(2).padStart(5, '0');
  updateAccountBackground(checking, checkingEl);
});

savingsDepositButtonEl.addEventListener('click', function() {
  var amount = Number(savingsAmountInputEl.value);
  savingsBalanceEl.textContent = '$' + deposit(amount, savings).toFixed(2).padStart(5, '0');
  updateAccountBackground(savings, savingsEl);
});

checkingWithdrawButtonEl.addEventListener('click', function() {
  var amount = Number(checkingAmountInputEl.value);
  checkingBalanceEl.textContent = '$' + withdraw(amount, checking).toFixed(2).padStart(5, '0');
  updateAccountBackground(checking, checkingEl);
});

savingsWithdrawButtonEl.addEventListener('click', function() {
  var amount = Number(savingsAmountInputEl.value);
  savingsBalanceEl.textContent = '$' + withdraw(amount, savings).toFixed(2).padStart(5, '0');
  updateAccountBackground(savings, savingsEl);
});

// == References:
// - [JavaScript toFixed Method]
//   (https://www.w3schools.com/jsref/jsref_tofixed.asp)
