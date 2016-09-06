app = angular.module('app');

app.controller("AuthController", [ '$scope', '$auth', '$state','Flash'
  ($scope, $auth, $state, Flash)->
    $scope.$on('auth:login-success', (ev, user) ->
      $auth.validateUser();
      $state.go('home')
    );
    $scope.$on('auth:login-error', (ev, user) ->
      Flash.create('danger', user.errors[0]);
    );
    $scope.$on('auth:registration-email-success', (ev, user) ->
      $auth.validateUser();
      $state.go('home')
    );
    $scope.$on('auth:registration-email-error', (ev, reason) ->
      for fieldname, message of reason.errors
        field = $(".form-group.#{fieldname}")
        field.addClass('has-error')
        field.find('.help-block').html("#{_.capitalize(fieldname)} #{message}")
    );
])