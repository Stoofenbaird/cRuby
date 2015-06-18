class Status < ActiveRecord::Base

  validates :content, presence: true,
                      length: { minimum: 2 }

  validates :user_id, presence: true                    
end
