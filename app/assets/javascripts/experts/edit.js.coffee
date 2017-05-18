$(document).on 'click', '#edit_expert .simple-calendar .day', (e) ->
  day = $(e.currentTarget)
  expertId = day.closest('fieldset').data('expert-id')
  date = day.find('.hidden').text()
  $.ajax
    method: 'POST'
    url: '/admin/working_days/toggle'
    data: { working_day: { expert_id: expertId, start_time: date }}
    dataType: 'json'
    success: () ->
      day.toggleClass('has-events')
