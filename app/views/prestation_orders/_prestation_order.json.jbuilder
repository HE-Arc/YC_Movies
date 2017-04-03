json.extract! prestation_order, :id, :name, :firstname, :entreprise, :email, :tel, :availabilities, :typeofproduct, :product, :length, :interview, :other, :created_at, :updated_at
json.url prestation_order_url(prestation_order, format: :json)
