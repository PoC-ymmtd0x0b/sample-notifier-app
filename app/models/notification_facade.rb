class NotificationFacade
  class << self
    def first_report(report, receiver)
      ActivityDelivery.with(
        report: report,
        receiver: receiver
      ).notify(:first_report)
    end
  end
end
