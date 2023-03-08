class ActivityNotifier < AbstractNotifier::Base
  self.driver = ActivityDriver.new

  def first_report(opts = {})
    opts.merge!(params)
    report = opts[:report]
    receiver = opts[:receiver]

    notification(
      body: "#{report.user.name}さんがはじめての日報を書きました！",
      user: receiver,
      sender: report.owner,
      link: Rails.application.routes.url_helpers.polymorphic_path(report)
    )
  end
end