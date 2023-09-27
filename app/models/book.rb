class Book < ApplicationRecord
  belongs_to :user

  has_many :users, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true
  validates :title, length: { maximum: 200 }

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/dog.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
