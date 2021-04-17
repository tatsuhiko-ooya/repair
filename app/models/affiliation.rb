class Affiliation < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '製造一課' },
    { id: 3, name: '製造二課' },
    { id: 4, name: '製造三課' },
    { id: 5, name: '製造四課' },
    { id: 6, name: '機械保全課' }
  ]

  include ActiveHash::Associations
  has_many :users
  end