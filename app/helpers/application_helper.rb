# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def show_flashes
    return '' unless flash.length > 0
    output = "<div id=\"flashes\" style=\"display:inherit;\">\n"
    flash.each do |key, value|
      output += content_tag('div', value.to_s, :class => "flash_#{key.to_s}")
    end
    output += "</div>\n"
    output
  end

  def when_logged_in(&block)
    if logged_in?
      concat(capture(&block))
    end
  end

  def when_not_logged_in(&block)
    unless logged_in?
      concat(capture(&block))
    end
  end

  def user_avatar(user)
    image_tag(user.avatar.url(:thumb),
              :alt_tag => user.name_for_view)
  end

  def current_user_attendance
    rsvp = 'Your RSVP: <b>'
    status = @current_user_attendance && @current_user_attendance.status
    if status == UserEventAttendance::SURE_STATUS
      rsvp += 'definitely'
    elsif status == UserEventAttendance::MAYBE_STATUS
      rsvp += 'maybe'
    else
      rsvp += 'not'
    end
    rsvp += " attending</b>\n"

    update_options = ''
    unless status == UserEventAttendance::SURE_STATUS
      update_options += '<option value="%s">%s</option>' % [UserEventAttendance::SURE_STATUS, UserEventAttendance::SURE_STATUS]
    end
    unless status == UserEventAttendance::MAYBE_STATUS
      update_options += '<option value="%s">%s</option>' % [UserEventAttendance::MAYBE_STATUS, UserEventAttendance::MAYBE_STATUS]
    end
    if status == UserEventAttendance::SURE_STATUS || status == UserEventAttendance::MAYBE_STATUS
      update_options += '<option value="not">not</option>'
    end
    rsvp

    update_form =
      form_tag(@current_user_attendance) +
      select_tag('user_event_attendance[:status]', update_options) +
      submit_tag("Update your RSVP") +
      '</form>'

    rsvp + update_form
  end
end
