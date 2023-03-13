class ReportCallbacks
  def after_save(report)
    notify_first_report(report) if report.first?
  end

  private

  def notify_first_report(report)
    User.all.each do |receiver|
      ActivityDelivery.with(
        report: report,
        receiver: receiver
      ).notify(:first_report) if report.owner != receiver
    end
  end
end
