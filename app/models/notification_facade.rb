class NotificationFacade
  class << self
    def first_report(report, receiver)
      ActivityNotifier.with(
        report: report,
        receiver: receiver
      ).first_report.notify_now

      NotificationMailer.with(
        report: report,
        receiver: receiver
      ).first_report.deliver_later
    end
  end
end
