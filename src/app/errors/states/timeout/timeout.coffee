angular.module("doubtfire.errors.states.timeout", [])

#
# Define the timeout state
#
.config(($stateProvider) ->
  stateData =
    url: "/timeout?dest&params"
    views:
      main:
        controller: "TimeoutCtrl"
        templateUrl: "errors/states/timeout/timeout.tpl.html"
    data:
      pageTitle: "_Timeout_"
  $stateProvider.state "timeout", stateData, 'TimeoutCtrl'
)
.controller("TimeoutCtrl", ($state, $timeout, DoubtfireConstants, GlobalStateService, authenticationService) ->
  GlobalStateService.setView("OTHER")
  authenticationService.signOut()

  $timeout (-> $state.go "sign_in"), 500
)
