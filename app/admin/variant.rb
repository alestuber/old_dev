ActiveAdmin.register Variant do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params images: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  form html: { multipart: true } do |f|
    f.input :images, as: :file, input_html: { multiple: true }
    f.actions
  end
end
