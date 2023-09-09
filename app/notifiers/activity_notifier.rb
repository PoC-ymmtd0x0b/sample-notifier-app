class ActivityNotifier < AbstractNotifier::Base
  self.driver = ActivityDriver.new
  self.async_adapter = ActivityAsyncAdapter.new

  def first_report(params = {})
    params.merge!(@params)
    report = params[:report]
    receiver = params[:receiver]

    notification(
      body: "#{report.user.name}さんがはじめての日報を書きました！",
      user: receiver,
      sender: report.owner,
      link: Rails.application.routes.url_helpers.polymorphic_path(report)
    )
  end
end
