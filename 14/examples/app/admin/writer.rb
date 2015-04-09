ActiveAdmin.register Writer do


  index as: :grid do |writer|
    resource_selection_cell writer
    h2 link_to("#{writer.first_name} #{writer.last_name}", edit_admin_writer_path(writer))
  end


  permit_params :first_name, :last_name, :id, :_destroy, :email


end
