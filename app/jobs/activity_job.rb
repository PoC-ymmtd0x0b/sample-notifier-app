class ActivityJob < ApplicationJob
  queue_as :default

  def perform(params)
    ActivityDriver.new.call(params)
  end
end
