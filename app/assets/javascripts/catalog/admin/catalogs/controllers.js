angular.module('catalog', ['ngSanitize'])

	.controller('iframeCtrl', ['$scope', '$sce', function($scope, $sce) {


		$scope.iframe_url = function(url) {
			console.log("dfd");
			return $sce.trustAsResourceUrl(url);
		}

  }])