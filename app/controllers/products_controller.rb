class ProductsController < ApplicationController

    def create
        #find_or_create
        product = Product.create param[:product]
        if product
            sub_types = product.sub_types.create param[:sub_types]
            render json: {data: {product: new_product, sub_types: sub_types}}, status: :ok
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
                type = product.types.create!({quantity: types_params[:quantity], price: types_params[price:]});
                type.sub_types_ids = types_params[:sub_types_ids]
                type.save!
            end
        rescue => exception
            raise exception
        end
    end

    private
        def products_sub_types_params
            params.permit(sub_types: [], product: {})
        end
        def types_params
            params.permit(sub_types_ids:[], :quantity , :price )
            # subtypesIds: []
            # quantity: integer
            #price: integer
        end
end
