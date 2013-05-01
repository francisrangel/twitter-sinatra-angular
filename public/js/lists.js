angular.module('tweetsLists', [])
.directive('resizeAfterRepeat', function() {
  return function(scope, element, attrs) {
    resizeLists();
    setupGoToTopListeners();
  }
});

function setupGoToTopListeners() {
  $('.name').each(function(index, button) {
    $(button).click(function() {
      $('.tweets', $(this).parent().parent()).animate({ scrollTop: 0 }, 500);
    });
  })
}

function ListsCtrl($scope, $http) {
  $http.get("/lists")
      .success(function(data, status, headers, config) {
        $scope.lists = data;
      });
}