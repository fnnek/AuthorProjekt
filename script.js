/**
 * Created by Mariusz on 2017-02-05.
 */

var mainApp = angular.module('mainApp',['ngRoute','ngSanitize']);
mainApp.config(function ($routeProvider) {
    $routeProvider
        .when('/',{
            templateUrl: 'views/home/view.html',
            controller: 'homeCtrl'
        })
        .when('/about', {
            templateUrl: 'views/about/view.html',
            controller: 'aboutCtrl'
        })
        .when('/meetings', {
            templateUrl: 'views/meetings/view.html',
            controller: 'meetCtrl'
        })
        .when('/books', {
            templateUrl: 'views/books/view.html',
            controller: 'bookCtrl'
        })
        .when('/novels', {
            templateUrl: 'views/novels/view.html',
            controller: 'novelCtrl'
        })
        .when('/entry/:id', {
            templateUrl: 'views/entry/view.html',
            controller: 'entryCtrl'
        })
        .when('/addEntry', {
            templateUrl: 'views/entry/addView.html',
            controller: 'addEntryCtrl'
        })
        .when('/editEntry/:id', {
            templateUrl: 'views/entry/editView.html',
            controller: 'editEntryCtrl'
        })
});

mainApp.controller('homeCtrl',['$scope','$http','$sce', function ($scope,$http) {
    $http.get("http://localhost/author/rest/controller.php?action=getEntry&id=39").
        then(function (response) {

        $scope.home = response.data.entry.tresc;
        //$scope.home = {html: "<h1>witam</h1>"};
        //$scope.items = [{html:"<span>1</span>"},{html:"<h3>some text</h3>"}];
    })

    $http.get("http://localhost/author/rest/controller.php?action=getMenu").
        then(function (response) {
        $scope.items = response.data;
    })
}]);

mainApp.controller('aboutCtrl',['$scope','$http',function ($scope,$http) {
    $http.get("http://localhost/author/rest/controller.php?action=getEntry&id=1").
        then(function (response) {
            $scope.about = response.data.entry.tresc;
    })
}]);

mainApp.controller('meetCtrl',['$scope','$http','$window','$anchorScroll','$location', function ($scope,$http,$window,$anchorScroll,$location) {
    var entries = [];


    $http.get("http://localhost/author/rest/controller.php?action=getAllEntries").
        then(function (response) {
            entries = response.data;
            $scope.items = entries;
    })

    $scope.goToAddView = function () {
        $window.location = "#/addEntry";
    }

    $scope.editEntry = function (id) {
        $window.location = "#editEntry/"+id;
    }

    $scope.deleteEntry = function (id,index) {
        if(confirm("Czy na pewno chcesz usunąć ten wpis?")){
            $http({
                url: "http://localhost/author/rest/controller.php?action=deleteEntry&id="+id,
                method: 'DELETE'
            })
                .then(function (response) {
                    alert(response.data.message);
                    $scope.items.splice(index,1);
                })
        }
        else {}

    }
}])

mainApp.controller('bookCtrl', ['$scope','$http', function ($scope,$http) {
    $http.get("http://localhost/author/rest/controller.php?action=getAllBooks").
        then(function (response) {
        $scope.items = response.data;
    });
}]);

mainApp.controller('novelCtrl',['$scope','$http', function ($scope,$http) {
    $http.get("http://localhost:8080/books/1").
    then(function (response) {
        $scope.items = response.data;
    });
}]);

mainApp.controller('entryCtrl',['$scope','$http','$routeParams', function ($scope,$http,$routeParams) {
    //$scope.parametr = $routeParams.id;
    var komentarze = [];
    $http.get("http://localhost/author/rest/controller.php?action=getEntry&id="+$routeParams.id).
    then(function (response) {
        komentarze = response.data.comments;
        $scope.tytul = response.data.entry.tytul;
        $scope.data = response.data.entry.data;
        $scope.tresc = response.data.entry.tresc;

        if(komentarze.length === 0) {
            $scope.info = "Nie ma żadnych komentarzy. Bądź pierwszy!";
        } else {
            $scope.comments = komentarze;
        }
    })

    $scope.add = function (){
        var autor = $scope.nick;
        var tresc = $scope.trescKom;
        var id_wpisu = $routeParams.id;
        var currentDate = new Date();
        var data = currentDate.getFullYear() + "-"
            + currentDate.getMonth() + "-"
            + currentDate.getDay();
        var komentarz = {
            id: 0,
            id_wpisu: id_wpisu,
            autor: autor,
            data: data,
            tresc: tresc
        }

        $http({
                method: 'POST',
                url: "http://localhost/author/rest/controller.php?action=addComment",
                data: komentarz,
                headers: {'Content-Type' : 'application/json; charset=UTF-8'}
            }
            ).then(function (response) {
            $scope.wiadomosc = response.message;
            if(response.status != 0) {
                komentarze.push(komentarz);
                $scope.info = " ";
                $scope.comments = komentarze;
            }
        })
    }
    
}]);

mainApp.controller('addEntryCtrl',['$scope','$http','$window',function ($scope,$http,$window) {



    $scope.entry = function () {
        var tytul = $scope.tytulWpisu;
        var tresc = $scope.trescWpisu;
        var data = getCurrentDate();
        var kategoria = 1;

        var entry = {
            id: 0,
            tytul: tytul,
            tresc: tresc,
            data: data,
            kategoria: kategoria
        }
        $http({
                method: 'POST',
                url: "http://localhost/author/rest/controller.php?action=addEntry",
                data: entry,
                headers: {'Content-Type' : 'application/json; charset=UTF-8'}
            }
        ).then(function (response) {
            $window.location = "#/meetings";
        })
    }
}])

mainApp.controller('editEntryCtrl',['$scope','$http','$routeParams','$window',function ($scope,$http,$routeParams,$window) {
    var resp;

    $http.get("http://localhost/author/rest/controller.php?action=getEntry&id="+$routeParams.id).
        then(function (response) {
            $scope.tytulWpisu = response.data.entry.tytul;
            $scope.trescWpisu = response.data.entry.tresc;
            $scope.typeinfo = "Edytuj wpis";
            $scope.textbutton = "Zapisz";
            resp =  response;

    })



    $scope.entry = function () {
        var entry = {
            id: resp.data.entry.id,
            tytul: $scope.tytulWpisu,
            tresc: $scope.trescWpisu
        }

        $http.put("http://localhost/author/rest/controller.php?action=updateEntry",entry).
            then(function (response) {
            alert(response.data.message);
            $window.location = "#meetings";
        })
    }



}])


var getCurrentDate;
getCurrentDate = function () {
    var currentDate = new Date();
    var data = currentDate.getFullYear() + "-"
        + (currentDate.getMonth()+1) + "-"
        + currentDate.getDate();

    return data;
};