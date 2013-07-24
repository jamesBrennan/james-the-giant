MomentFilter = (DATE_FORMATS) ->
  (date_string, formats) ->
    {input, output} = formats
    moment(date_string, DATE_FORMATS[input]).
      format(DATE_FORMATS[output])

MomentFilter.$inject = ['DATE_FORMATS']
angular.module('music').filter 'moment', MomentFilter
