class PostSub < ApplicationRecord
  validates :sub_id, uniqueness: { scope: :post_id }

  belongs_to :post,
  primary_key: :id,
  foreign_key: :post_id,
  class_name: :Post

  belongs_to :sub,
  primary_key: :id,
  foreign_key: :sub_id,
  class_name: :Sub
end

