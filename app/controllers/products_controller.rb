class ProductsController < ApplicationController

    def create
     
        #find_or_create
        p products_sub_types_params
        product = Product.new products_sub_types_params[:product]
        
        sub_types = product.sub_types.build products_sub_types_params[:sub_types]

        if product.save
            render json: {data: {product: product, sub_types: sub_types}}, status: :ok       
        else
            
            render json: {data: {errors: product.errors.full_messages}}, status: :unprocessable_entity
        end
    end

    def show
        #retrieve products with types with subtypes
        product = Product.includes(type: :sub_types).all;
        render json: {data: product}, status: :ok  
    end

    def create_types
        begin
            product = Product.find_by_id params[:product_id]
            if product.nil?
                raise ActiveRecord::RecordNotFound
            else
                type = product.types.create!({quantity: types_params[:quantity], price: types_params[:price]});
                type.sub_types_ids = types_params[:sub_types_ids]
                type.save!
            end
        rescue => exception
            raise exception
        end
    end

    private

        def products_sub_types_params
            # params.permit(sub_types:[{name: :String, value: :String}], product:{})
            params.permit!
        end

        def types_params
            params.permit(sub_types_ids:[], quantity: :Numeric , price: :Numeric )
            # subtypesIds: []
            # quantity: integer
            #price: integer
        end
end
