class ActivityMailer < ApplicationMailer
  before_action do
    @receiver = params[:receiver]
    @report = params[:report]
  end

  def first_report
    @user = @receiver
    mail to: @user.email,
         subject: "#{@report.user.name}さんがはじめての日報を書きました！"
  end
end
