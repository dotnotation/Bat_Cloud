class Note < ApplicationRecord
  belongs_to :bat_id
  belongs_to :researcher_id
end
