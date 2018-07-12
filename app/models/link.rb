class Link < ApplicationRecord
  belongs_to :user
  acts_as_votable
  # validates :title, presence: true
  validates :url, presence: true

  def self.to_csv(options = {})
    desired_columns = ["url","user_id"]
    CSV.generate(options) do |csv|
      csv << ["Url", "Created By"]
      all.each do |link|
        array = link.attributes.values_at(*desired_columns)
        csv << [array.first, User.find_by_id(array.second).username]
      end
    end
  end

end
