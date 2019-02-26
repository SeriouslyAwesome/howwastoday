class ApplicationController < ActionController::Base
  def browser_time_zone
    browser_tz = ActiveSupport::TimeZone.find_tzinfo(cookies['browser.timezone'])
    ActiveSupport::TimeZone.all.find { |zone| zone.tzinfo == browser_tz } || Time.zone
  rescue TZInfo::UnknownTimezone, TZInfo::InvalidTimezoneIdentifier
    Time.zone
  end
  helper_method :browser_time_zone

  protected

    def current_user
      @current_user ||= user_from_session || new_guest_user
    end

    def user_from_session
      User.find_by(uuid: session[:user_id]) if session[:user_id].present?
    end

    def new_guest_user
      uuid = SecureRandom.uuid
      user = User.create(uuid: uuid)
      session[:user_id] = uuid
      user
    end
end
