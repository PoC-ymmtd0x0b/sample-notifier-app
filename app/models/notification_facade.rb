class NotificationFacade
  class << self
    def first_report(report, receiver)
      NotificationMailer.with(
        report: report,
        receiver: receiver
      ).first_report.deliver_later

      Notification.create!(
        message: "#{report.user.name}さんがはじめての日報を書きました！",
        user: receiver,
        sender: report.owner,
        link: Rails.application.routes.url_helpers.polymorphic_path(report)
      )
    end
  end
end
