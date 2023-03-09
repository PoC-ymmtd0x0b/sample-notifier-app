class ReportCallbacks
  def after_save(report)
    notify_first_report(report) if report.first?
  end

  private

  def notify_first_report(report)
    User.all.each do |receiver|
      NotificationFacade.first_report(report, receiver) if report.owner != receiver
    end
  end
end
