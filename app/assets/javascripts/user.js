//= require jquery
//= require jquery_ujs
//= require list
//= require_tree .
$(document).ready(function() {
  var options = {
    valueNames: [ 'first_name', 'last_name', 'email' ]
  };

  var userList = new List('users', options);

  var itemOptions = {
    valueNames: [ 'item_name', 'item_description', 'item_business_name' ]
  };

  var newList = new List('items', itemOptions);
});
