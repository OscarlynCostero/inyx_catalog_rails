var routeCatalague = {};
(function(){

	/*Rutas App*/
	this.index_path = function(){
		document.location ='/admin/admin/catalogues';
	}

	this.show_path = function(id){
		document.location ='/admin/messages/'+id;
	}
	/*end*/

	/*Rutas Ajax*/
  	this.index_json_path = '/admin/catalogues/all_products.json';
  
  	this.destroy_path = "/admin/catalogues/delete/";

  	this.all_category_path = "/admin/category_catalogues/all_category.json";

  	this.one_category_path = function(id){
  		return "/admin/category_catalogues/one_category/"+id+".json"
  	} 	
  	/*end*/

}).apply(routeCatalague);