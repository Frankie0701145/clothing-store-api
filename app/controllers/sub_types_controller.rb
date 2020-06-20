class SubTypesController < ApplicationController

    def create
        #add sub_types to a product
        product = Product.find_by_id params[:product_id]
        if product.nil?
            #if there is no product throw error
            raise ActiveRecord::RecordNotFound
        else
            p sub_types_params
            sub_types = product.subtypes.create sub_types_params
            render json: {data: {sub_types: sub_types}}, status: :ok
        end
    end

    def show
        sub_types = SubType.where product_id: param[:product_id]
        render json: {data: sub_types}, status: :ok
    end

    private
        def sub_types_params
            params.permit( sub_types:[])
        end
end
