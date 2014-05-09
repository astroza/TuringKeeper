class CheckIn < ActiveRecord::Base
  belongs_to :turing_user
  belongs_to :check_out
end
