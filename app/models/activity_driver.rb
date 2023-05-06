class ActivityDriver
  def call(params)
    Notification.create!(
      message: params[:body],
      user: params[:user],
      sender: params[:sender],
      link: params[:link]
    )
  end
end
