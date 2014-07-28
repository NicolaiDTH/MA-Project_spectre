class Films < ActiveRecord::Base
 belongs_to :user
end


# id | title | user_id | status
# 1    Memento  1        shelved
# 2    Titanic  2        shelved
# 3    Memento  2        rejected