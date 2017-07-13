module ApplicationHelper
  def appointment_states_collection
    @appointment_states_collection ||= Appointment.aasm.states
  end

  def service_owners_list
    @service_owners_list ||= begin
      SubCategory.joins(:category)
        .order('categories.name ASC, sub_categories.name ASC')
        .all.map{ |sc| [sc.label, "#{sc.class}::#{sc.id}"] } +
      Category.order('categories.name ASC')
        .all.map{ |c| [c.label, "#{c.class}::#{c.id}"] }
    end
  end
end
