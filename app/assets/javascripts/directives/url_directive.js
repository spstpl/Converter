var app = angular.module('articleApp', []);

// Controller for Article

app.controller('articleController', ['$scope', function($scope) {
  // Regular Expression for URL
  $scope.urlRegex = new RegExp("^(http[s]?:\\/\\/(www\\.)?|ftp:\\/\\/(www\\.)?|www\\.){1}([0-9A-Za-z-\\.@:%_\+~#=]+)+((\\.[a-zA-Z]{2,3})+)(/(.)*)?(\\?(.)*)?");

  // This will dispatch API call for fetching HTML
  $scope.dispatchConverterCall = function ($event) {
    var url = $event.target.value;
    $.ajax({
      type: 'GET',
      url: '/api/v1/converter/url_to_html',
      dataType: 'json',
      data: { url: url },
      success: function (data) {
        console.log('Success..!');
        if (data.error) {
          $('#url_error').html('<p>' + data.message + '</p>');
        } else {
          $('#article_body').val(data.html);
          $('#url_error').html('');
        }
      },
      error: function (error) {
        console.log('Something went wrong.' + error);
      }
    });
  };
}])

// Directive of Article's body
app.directive('articleBody', function () {
  return {
      restrict: 'E',
      replace: true,
      scope: true,
      template: "<input id='article_body' type='text' name='article[body]' ng-blur='dispatchConverterCall($event);'>"
  }
});
