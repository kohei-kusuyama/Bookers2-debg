class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # belongs_to :books

  has_many :books, dependent: :destroy
  has_one_attached :profile_image
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }



  def get_profile_image
    (profile_image.attached?) ? profile_image: 'no_image.jpg'
  end
  # def get_profile_image
  #   if profile_image.attached?
  #   profile_image.variant(resize_to_limit: [width, height]).processed
  #   else
  #   'no_image.jpg'
  #   end
    
end
  
  # validates :name,
  #   presence: true,
  #   uniqueness: {case_sensitive: false},
  #   length: {minimum: 2, maximum: 20}

  # validates :introduction,
  #   length: {maximum: 50}

