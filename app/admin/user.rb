include UserHelper # should include the helper in all active admin resources that will use it!

ActiveAdmin.register User do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  permit_params :email, :first_name, :last_name, :cpf, :telephone, :date_of_birth

  index do
    column :id
    column :email
    column :first_name
    column :last_name
    column :telephone
    column :date_of_birth do |user|
      date_formatter user.date_of_birth
    end
    column :cpf do |user|
      cpf_formatter user.cpf
    end
    actions
  end

end
