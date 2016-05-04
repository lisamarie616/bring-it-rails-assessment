class EventPolicy < ApplicationPolicy
  def show?
    user == record.host || record.guests.include?(user)
  end

  def destroy?
    user == record.host
  end

  def permitted_attributes
    if user == record.host
      [:title, :location, :start_time, :end_time, :item_ids =>[], :items_attributes => [:name], :guests_attributes => [:email]]
    else
      [:items_attributes => [:name]]
    end
  end
end