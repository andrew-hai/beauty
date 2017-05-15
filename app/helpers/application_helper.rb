module ApplicationHelper
  def appointment_states_collection
    @appointment_states_collection ||= Appointment.aasm.states
  end

  def sub_category_collection
    @sub_category_collection ||= SubCategory.joins(:category)
      .order('categories.name ASC, sub_categories.name ASC')
      .all.map{ |sc| [sc.label, sc.id] }
  end
end
