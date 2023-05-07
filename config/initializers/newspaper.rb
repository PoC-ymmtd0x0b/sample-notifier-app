Rails.configuration.to_prepare do
  Newspaper.subscribe(:notify_first_report, FirstReportNotifier.new)
end
