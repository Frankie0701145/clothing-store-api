Rails.application.routes.draw do
  # For details on the DSL 

    post "/products", to: "products#create", as: "create_product_with_sub_types"
    get "/products/types/sub_types", to: "products#show", as: "retrieve_products"
    post "/products/:product_id", to: "products#create_types", as: "create_types"

    post "/sub_types/:product_id", to: "sub_types#create", as: "add_sub_types_to_product"
    get "/sub_types/:product_id", to: "sub_types#show"
  
end
