class Article < ActiveRecord::Base

  has_many :writers
  accepts_nested_attributes_for :writers, :reject_if => :all_blank, :allow_destroy => true

end
