//= require jquery
//= require jquery_ujs
//= require list
//= require_tree .

$(document).ready(function() {
  var itemOptions = {
    valueNames: [ 'item_name', 'item_description', 'item_business_name' ]
  };

  var newList = new List('item-list', itemOptions);
});
