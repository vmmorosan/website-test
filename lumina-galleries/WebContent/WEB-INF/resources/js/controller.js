
var cartApp = angular.module("cartApp", []);

cartApp.controller("cartCtrl", function($scope, $http){
	
	//refresh the cart functionality
	$scope.refreshCart = function (){
		//get a cart in a json format
		$http.get('/lumina/rest/cart/' + $scope.cartId).success(function(data){
			$scope.cart = data;
		});
	};
	
	//clear the cart functionality
	$scope.clearCart = function (){
		$http.delete('/lumina/rest/cart/' + $scope.cartId).success($scope.refreshCart());
	};
	
	//init cart
	$scope.initCartId = function(cartId){
		$scope.cartId = cartId;
		$scope.refreshCart(cartId);
	};
	
	//add product to cart
	$scope.addToCart = function(productId){
		$http.put('/lumina/rest/cart/add/' + productId).success(function(){
			
			alert("Product successfully added to the cart");
		});
	};
	
	$scope.removeFromCart = function(productId){
		$http.put('/lumina/rest/cart/remove/' + productId).success(function(data){
			$scope.refreshCart();
		});
	};
	
	$scope.calGrandTotal = function(){
		var grandTotal = 0;
		
		for(var i = 0; i < $scope.cart.cartItems.length; i++){
			grandTotal += $scope.cart.cartItems[i].totalPrice;
		}
		
		return grandTotal;
	};
	
});