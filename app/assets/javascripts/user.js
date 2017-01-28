//= require jquery
//= require jquery_ujs
//= require list
//= require_tree .
$(document).ready(function() {
  var options = {
    valueNames: [ 'first_name', 'last_name', 'email' ]
  };

  var name_options = {
    valueNames: [ 'item-name' ]
  };
  var userList = new List('users', options);


  var newList = new List('active-list', name_options);
});
