class Invitation < ActiveRecord::Base
  belongs_to :invited_event
  belongs_to :guest
end
