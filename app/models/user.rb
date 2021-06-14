class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  extend ActiveHash::Associations::ActiveRecordExtensions  
  belongs_to :position  
  belongs_to :baseball_history
  has_many   :room_users
  has_many   :rooms, through: :romm_users
  has_many   :messages
  has_many   :posts
  has_one_attached :image

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password,    format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
    with_options format: {with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ } do
      validates :last_name
      validates :first_name
    end
    validates :birthday
    with_options numericality: { other_than: 1 } do
      validates :position_id
      validates :baseball_history_id
    end
  end

end
