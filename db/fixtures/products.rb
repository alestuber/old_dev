30.times do |v|
  Product.seed(:name,
    {
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraph(3),
    }
  )
end
