class ProductsController < ApplicationController

    def create
        #instantiate a product
        product = Product.new products_sub_types_params[:product]
        #build a sub_types
        sub_types = product.sub_types.build products_sub_types_params[:sub_types]
        #save
        if product.save
            #convert to json
            product_json = product.to_json(:include=>[:sub_types])     
            render json: product_json  
        else        
            render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
       
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
            type.sub_type_ids = types_params[:sub_type_ids]
            if product.save
                # type_json = type.to_json(:include=>{:types=>
                #                                                     {:include=> :sub_types}
                #                                                 })
                type_json = type.to_json(:include=>:sub_types)
                render json: type_json, status: :ok
            else
                render json: {errors: type.errors.full_messages}, status: :unprocessable_entity
            end
        end
    end

    private

        def products_sub_types_params
            params.permit!
        end

        def types_params
            params.require(:type).permit(:quantity, :price, :product_id, sub_type_ids:[])
        end
end
