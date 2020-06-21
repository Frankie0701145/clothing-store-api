class ProductsController < ApplicationController

    def create
     
        #find_or_create
        p products_sub_types_params
        product = Product.new products_sub_types_params[:product]
        
        sub_types = product.sub_types.build products_sub_types_params[:sub_types]

        if product.save
            product_json = product.to_json(:include=>[:sub_types])     
            render json: product_json  
        else        
            render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        #retrieve products with types and subtypes
        products = Product.includes(types: :sub_types).all;
        products_json = products.to_json(:include=>{:types=>
                                                        {:include=> :sub_types}
                                                   })
        render json: products_json, status: :ok                                       
    end

    def create_types
        product = Product.find_by_id params[:product_id]
        if product.nil?
            render json: {errors: ["There is no product with that product_id"]}, status: :not_found
        else
            type = product.types.new({quantity: types_params[:quantity], price: types_params[:price]});
            type.sub_type_ids = types_params[:sub_types_ids]
            if product.save
                product_json = product.to_json(:include=>{:types=>
                                                                 {:include=> :sub_types}
                                                             })
                render json: product_json, status: :ok
            else
                render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
            end
        end
    end

    private

        def products_sub_types_params
            # params.permit(sub_types:[{name: :String, value: :String}], product:{})
            params.permit!
        end

        def types_params
            # params.permit(sub_types_ids:[], quantity: :Numeric , price: :Numeric )
            # params.permit([:quantity, :price, sub_types_ids: []])
            params.permit!
            # subtypesIds: []
            # quantity: integer
            #price: integer
        end
end
