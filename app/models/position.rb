class Position < ActiveHash::Base
  self.data = [
    { id: 1, name: '---'},
    { id: 2, name: '投手'},
    { id: 3, name: '捕手'},
    { id: 4, name: '内野手'},
    { id: 5, name: '外野手'},
  ]

include ActiveHash::Associations
has_many :users
end
