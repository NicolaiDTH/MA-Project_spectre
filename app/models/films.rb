class Films < ActiveRecord::Base
 has_many :selections
 has_many :user, through: :selections
end