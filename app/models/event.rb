class Event < ActiveRecord::Base
  has_many :event_users, :foreign_key => :invited_event_id
  has_many :guests, :through => :event_users
  belongs_to :host, :class_name => "User"
  has_many :event_items
  has_many :items, through: :event_items

  def assigned_items
    event_items.where.not(assigned_person: nil)
  end

  def unassigned_items
    event_items.where(assigned_person: nil)
  end

  def items_attributes=(attributes)
  end

  def guests_attributes=(attributes)
    attributes.values.first[:email].split(",").each do |email|
      email.strip!
      guest = User.find_by(email: email)
      if guest
        self.guests << guest
      else
        User.invite!(:email => email)
        guest = User.find_by(email: email)
        self.guests << guest
      end
    end
  end
end