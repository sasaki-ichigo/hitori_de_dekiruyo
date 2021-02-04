class Tree < ActiveHash::Base
  self.data = [
    { id: 1, name: 'りんごのき' },
    { id: 2, name: 'ぶどうのき' },
    { id: 3, name: 'ばななのき' }
  ]

  include ActiveHash::Associations
  has_many :children

end