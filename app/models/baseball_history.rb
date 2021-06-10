class BaseballHistory < ActiveHash::Base
  self.data = [
    { id: 1, name: '---'},
    { id: 2, name: 'メジャー'},
    { id: 3, name: 'NPB'},
    { id: 4, name: '社会人'},
    { id: 5, name: '大学'},
    { id: 6, name: '高校'},
    { id: 7, name: '中学校'},
    { id: 8, name: '小学校'},
    { id: 9, name: '未経験'},
  ]
include ActiveHash::Associations
has_many :users 
end
 
