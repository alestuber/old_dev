# 30 Extra Products
30.times do |v|
  Variant.seed(:sku,
    {
      sku: "EXT-#{Faker::Code.rut}",
      ean: Faker::Code.ean,
      price: Faker::Commerce.price,
      is_master: false,
      cost_price: Faker::Commerce.price,
      supplier_id: 2
    }
  )
end

# 30 Mercado Fresh Products
30.times do |v|
  Variant.seed(:sku,
    {
      sku: "MFR-#{Faker::Code.rut}",
      ean: Faker::Code.ean,
      price: Faker::Commerce.price,
      is_master: true,
      cost_price: Faker::Commerce.price,
      supplier_id: 1
    }
  )
end
