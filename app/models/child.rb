class Child < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tree

  belongs_to :user
  has_many :tasks

end
