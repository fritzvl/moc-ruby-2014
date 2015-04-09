ActiveAdmin.register Article do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :description, :body, writers_attributes: [:first_name, :last_name, :email, :_destroy, :id]
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  form do |f|

    f.inputs 'Article' do
      f.input :title
      f.input :description
      f.input :body, label: 'Articles body'
    end
    f.inputs do
      f.has_many :writers, heading: 'Authors', allow_destroy: true, new_record: true do |a|
        a.input :first_name
        a.input :last_name
        a.input :email
      end
    end
    f.actions
  end

end
