class GuestUserJob < ApplicationJob
  queue_as :default

  def perform(uuid)
    User.create(uuid: uuid)
  end
end
