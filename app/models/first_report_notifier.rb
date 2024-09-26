class FirstReportNotifier
  def call(report)
    User.all.each do |receiver|
      ActivityDelivery.with(
        report: report,
        receiver: receiver
      ).notify(:first_report) if report.owner != receiver
    end
  end
end
