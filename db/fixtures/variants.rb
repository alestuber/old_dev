Variant.seed(:id,
  {
    id: 1,
    sku: 'Nutry',
    ean: 7891331010508,
    price: 1.99,
    is_master: true,
    cost_price: 0.99,
    supplier_id: 1
  },
  {
    id: 2,
    sku: 'Red Apple',
    ean: 1618419,
    price: 19.99,
    is_master: false,
    cost_price: 9.99,
    supplier_id: 3
  },
  {
    id: 3,
    sku: 'ABF-123',
    ean: 15,
    price: 9.99,
    is_master: false,
    cost_price: 9.99,
    supplier_id: 1,
    deleted_at: '2015-05-14 15:07:46'
  }
)
