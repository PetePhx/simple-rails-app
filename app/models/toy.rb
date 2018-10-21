class Toy < ActiveRecord::Base
  TOYTYPES = [
    'string',
    'yarnball',
    'mouse'
  ]

  validates :name, :cat_id, :toytype, presence: true
  validates :toytype, inclusion: TOYTYPES

  belongs_to :cat
end
