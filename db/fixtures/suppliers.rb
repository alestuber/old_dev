Supplier.seed(:id,
  {
    id: 1,
    name: :'Mercado Fresh'
  },
  {
    id: 2,
    name: :'Extra'
  },

  {
    id: 3,
    name: :'Pão de Açúcar'
  }
)

30.times do |n|
  Supplier.seed(:id,
    {
      id: n+4,
      name: Faker::Company.name
    }
  )
end
