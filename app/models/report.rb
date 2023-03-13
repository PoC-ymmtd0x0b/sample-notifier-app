class Report < ApplicationRecord
  belongs_to :user
  alias owner user
  validates :title, presence: true

  after_save ReportCallbacks.new

  def first?
    Report.select(:id)
          .where(user: user)
          .order(:created_at)
          .first == self
  end
end
