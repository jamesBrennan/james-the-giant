#= require angular
#= require angular-resource
#= require moment
#= require jquery
#= require turbolinks
#= require twitter/bootstrap
#= require_self
#= require music/module

application = angular.module('jtg', ['ngResource','music'])

application.config ["$httpProvider", ($httpProvider) ->
                    $httpProvider.defaults.withCredentials = true
                    #$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]

application.value 'DATE_FORMATS', {
  full: 'M.DD.YY'
  day_of_month: 'DD | ddd'
  time: 'HH:MM:SS'
  songkick: 'YYYY-MM-DD'
}
