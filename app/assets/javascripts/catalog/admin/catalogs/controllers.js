angular.module('catalog', ['ngSanitize'])

	.controller('iframeCtrl', ['$scope', '$sce', function($scope, $sce) {


		$scope.iframe_url = function(url) {
			return $sce.trustAsResourceUrl(url);
		}

  }])