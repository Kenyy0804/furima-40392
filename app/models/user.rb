class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/ }
         with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
         validates :family_name
         validates :first_name
         end
         with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/ } do
         validates :family_name_kana
         validates :first_name_kana
         end
         validates :birth_day, presence: true

end
