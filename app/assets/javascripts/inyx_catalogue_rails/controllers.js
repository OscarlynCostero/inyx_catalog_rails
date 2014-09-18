angular.module('catalogue', [])
	.controller('indexCatalogueCrtl', ['$scope','catalogue', function($scope, catalogue ) {			

		$scope.init = function(){
			ctrl.pages = {};
			catalogue.load();
			$scope.products = catalogue;
			$scope.count = 0;
			$scope.interval_a = ctrl.interval_a;
			$scope.interval_b = ctrl.interval_b;
			$scope.page = ctrl.page;
			$scope.btnDelete = false;
			$scope.btnAllSelect = false;
			//Alerts
			$scope.alert = false;
			$scope.msnAlert = "Exitosamente!";
			$scope.statusAlert="success";
		}

		$scope.destroy = function() {
			if (confirm("¿Deseas eliminar los mensajes seleccionados?") == true) {
				ctrl.removeItemTable($scope.products);				
			 	catalogue.destroy(ctrl.selected, $scope);	 	
			 	ctrl.pageInit($scope);			 		 	
			 	ctrl.selected = [];
			}
		};

		$scope.selected = function(id){
			ctrl.itemSelected(id, $scope);
		};	

		$scope.allSelected = function(){
			ctrl.allItemsSelected($scope, $scope.products);
		};

		$scope.refresh = function(){
			catalogue.load();
			$scope.products = catalogue;	
			catalogue.count_reads($scope);
		}

		$scope.show = function(id){	
			route.show_path(id);
		}

		$scope.nextList = function(){
			ctrl.paginateControl($scope, $scope.products.data.length,"next");
		}

		$scope.lastList = function(){
			ctrl.paginateControl($scope, "last");			
		}
		$scope.alertClose = function(){
			$scope.alert = false;
		}
	}]);

