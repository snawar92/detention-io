class Link < ApplicationRecord
  belongs_to :user
  acts_as_votable
  # validates :title, presence: true
  validates :url, presence: true

  def self.to_csv(options = {})
    desired_columns = ["url"]
    CSV.generate(options) do |csv|
      csv << ["Placements"]
      all.each do |link|
        csv << link.attributes.values_at(*desired_columns)
      end
    end
  end

end
