<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<script type="text/javascript">
var restModule = angular.module('restModule', []);
restModule.controller("accessData", function($scope, $http) {
	
	$scope.data1 = [
			{"id":"1","name":"parag"},
			{"id":"2","name":"simran"}
	                ];
	
	$scope.getData = function () {
		var serverReqGET = {
				method: 'GET',
				url: 'http://localhost:8081/MMS/getusers',
				headers : {
					'Content-Type' : 'application/json',
					'Access-Control-Allow-Origin' : "*",
					'Access-Control-Allow-Methods' : "POST, GET, OPTIONS, DELETE, PUT",
					'Access-Control-Max-Age' : "1000",
					'Access-Control-Allow-Headers' : "x-requested-with, Content-Type, origin, authorization, accept, client-security-token"
				}
		}
		
		$http(serverReqGET).success(function(data){
			$scope.data = data;
		}).error(function(data){
			alert("error");
		});
			
	}
	
	$scope.add = function (emp) {
		var serverReqPOST = {
				method: 'POST',
				url: 'http://localhost:8081/MMS/adduser',
				headers : {
					'Content-Type' : 'application/json',
					'Access-Control-Allow-Origin' : "*"
				},
				data:emp
		}
		
		$http(serverReqPOST).success(
				function(data){
					$scope.data = data;
				}).error(function(data,status){
					alert("eror")
				});
	}
});
</script>
<body ng-app="restModule" ng-controller="accessData">

User Id :: <input type="text" ng-model="fr.userId"/><br/>
User Name :: <input type="text" ng-model="fr.name"/><br/>
<input type="button" value="Submit" ng-click="add(fr)">

<div align="middle"><a href="#" ng-click="getData()"> Show Data</a></div>
<table>
	<tr><th>ID</th><th>name</th></tr>
	<tr ng-repeat="n in data">
		<td>{{n.userId}}</td>
		<td>{{n.name}}</td>
	</tr>
</table>
</body>
</html>