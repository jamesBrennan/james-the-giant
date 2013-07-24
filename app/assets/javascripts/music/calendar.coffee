CalendarDirective = ($resource, $window) ->
  link: (scope, el, attr) ->
    Calendar = $resource 'https://api.songkick.com/api/3.0/artists/:artist_id/calendar.json',
      { artist_id: '@id' }
    Calendar.get({artist_id: '6326479', apikey: 'vfT8VCcKnmYdjAN0'}, (result) ->
      scope.events = result.resultsPage.results.event
      console.log scope
    )

    scope.eventInfo = (event) ->
      $window.open event.uri

CalendarDirective.$inject = ['$resource', '$window']
angular.module('music').directive 'jtgCalendar', CalendarDirective
