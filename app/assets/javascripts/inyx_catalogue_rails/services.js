angular.module('catalogue').factory('catalogue', [
  '$http', function($http) {
  var catalogue = {};
  var count = 0;

  catalogue.load = function() {
    Model.get(routeCatalague.index_json_path, $http, function(output){
      catalogue.data = output;
    });
  };

  catalogue.find_by_product = function(id) {
    Model.get(routeCatalague.find_message_path(id), $http, function(output){
      catalogue.data = output;
    });
  };

  catalogue.destroy = function(ids, $scope) {    
    Model.destroy(routeCatalague.destroy_path, $http, $scope, ids, function(output){
      Model.get(route.index_json_path, $http, function(output){
        catalogue.data = output;
      });
    });    
  };

  return catalogue;
  }
])

.factory('category', [
  '$http', function($http) {
  var category = {};
  var count = 0;

  category.load = function(){
    Model.get(routeCatalague.all_category_path, $http, function(output){
      category.data = output;
    });
  }

  return category;
  }
]);