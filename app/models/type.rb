class Pos < ActiveHash::Base
  self.data = [
    { id: 1, name: '単語テスト' },
    { id: 2, name: '和訳テスト' }
  ]

  include ActiveHash::Associations
  has_many :tests

end