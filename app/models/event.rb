class Event < ActiveRecord::Base
  has_many :event_users, :foreign_key => :invited_event_id
  has_many :guests, :through => :event_users
  belongs_to :host, :class_name => "User"
  has_many :event_items
  has_many :items, through: :event_items

  def start_time=(start_time)
    super(Chronic.parse(start_time))
  end

  def start_time
    super
  end

  def end_time=(end_time)
    super(Chronic.parse(end_time))
  end

  def end_time
    super
  end

  def host_name
    host.full_name
  end

  def guests_sorted
    guests.sort_by {|guest| guest.full_name}
  end

  def guest_emails
    guests.sort_by {|guest| guest.email}.map {|guest| guest.email}.join(", ")
  end

  def assigned_items
    event_items.where.not(assigned_person: nil)
  end

  def assigned_items_sorted
    assigned_items.sort_by {|event_item| event_item.item.name}
  end

  def unassigned_items
    event_items.where(assigned_person: nil)
  end

  def unassigned_items_sorted
    unassigned_items.sort_by {|event_item| event_item.item.name}
  end

  def items_attributes=(attributes)
    attributes.values.first[:name].split(",").each do |name_qty|
      name, qty = name_qty.split(":")
      name.strip!
      qty = 1 if !qty
      qty = qty.to_i
      item = Item.find_or_create_by(name: name)
      qty.times do
        self.items << item
      end
    end
  end

  def guests_attributes=(attributes)
    attributes.values.first[:email].split(",").each do |email|
      email.strip!
      guest = User.find_by(email: email)
      if guest && !self.guests.include?(guest)
        self.guests << guest
      else
        User.invite!(:email => email)
        guest = User.find_by(email: email)
        self.guests << guest if guest && !self.guests.include?(guest)
      end
    end
  end
end