class Pos < ActiveHash::Base
  self.data = [
    { id: 1, name: '名詞' },
    { id: 2, name: '動詞' },
    { id: 3, name: '形容詞' },
    { id: 4, name: '形容動詞' },
    { id: 5, name: '副詞' },
    { id: 6, name: '連体詞' },
    { id: 7, name: '接続詞' },
    { id: 8, name: '感動詞' },
    { id: 9, name: '助詞' },
    { id: 10, name: '助動詞' }
  ]

  include ActiveHash::Associations
  has_many :words

end