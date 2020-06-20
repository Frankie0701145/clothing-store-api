Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace "api" do
    post "/products", to: "products#create", as: "create_product"
    patch "/products/:id", to: "prdoducts#add_sub_types", as: "add_sub_types_to_product"
    post "/sub_types/:product_id", to: "sub_types#create"
    get "/sub_types/:product_id", to: "sub_types#show"
  end
end
