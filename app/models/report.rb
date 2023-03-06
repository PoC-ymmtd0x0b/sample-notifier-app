class Report < ApplicationRecord
  belongs_to :user
  validates :title, presence: true

  after_save ReportCallbacks.new

  def first?
    Report.select(:id)
          .where(user: user)
          .order(:created_at)
          .first == self
  end
end
