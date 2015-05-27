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
    selectable_column

    column :id

    column :email

    column :first_name

    column :last_name

    column :telephone do |user|
      phone_formatter user.telephone
    end

    column :date_of_birth do |user|
      date_formatter user.date_of_birth
    end

    column :cpf do |user|
      cpf_formatter user.cpf
    end

    column 'Confirmado?', :confirmed do |user|
      if user.confirmed_at.nil?
        'Não'
      elsif !user.unconfirmed_email.nil?
        'Alteração pendente'
      else
        'Sim'
      end
    end
    actions
  end
end
