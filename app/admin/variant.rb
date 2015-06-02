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

  index do
    selectable_column

    column :id

    column :sku

    column :ean

    column :price

    column :cost_price

    column :is_master

    column :position

    column :images do |variant|
      images = variant.images
      result = []
      images.each do |image|
        result << image.to_s
      end
      result
    end
    actions
  end

  form html: { multipart: true } do |f|
    f.input :images, as: :file, input_html: { multiple: true }
    f.actions
  end
end
