class Post < ApplicationRecord
    validates :title, presence: true

    belongs_to :author, 
    primary_key: :id, 
    foreign_key: :user_id, 
    class_name: :User

    has_many :post_subs, dependent: :destroy, inverse_of: :post
    has_many :subs, through: :post_subs
    has_many :comments
end
