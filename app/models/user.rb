class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :affiliation

  with_options presence: true do
    validates :name
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: '平仮名、全角カタカナ、漢字のみ使用可能です。' } do
      validates :last_name
      validates :first_name
    end
    validates :affiliation_id, numericality: { other_than: 1 }
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '英数字を混合させてください' }

end


