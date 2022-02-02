class Todo < ApplicationRecord      ## will be ActiveRecord::Base in older Rails versions
  validates :name, presence: true, length: { maximum: 200 }
end
