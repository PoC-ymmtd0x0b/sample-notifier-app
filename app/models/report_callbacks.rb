class ReportCallbacks
  def after_save(report)
    notify_first_report(report) if report.first?
  end

  private

  def notify_first_report(report)
    User.all.each do |receiver|
      NotificationMailer.with(
        report: report,
        receiver: receiver
      ).first_report.deliver_later if receiver != report.user
    end
  end
end
