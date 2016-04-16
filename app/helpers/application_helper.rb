module ApplicationHelper
  def user_has_a_mac?
    !request.env['HTTP_USER_AGENT'].downcase.match("os x").nil?
  end
end
