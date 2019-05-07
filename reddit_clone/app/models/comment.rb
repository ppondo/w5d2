class Comment < ApplicationRecord
    validates :content, presence: true

    belongs_to :post,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :Post

    belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end
