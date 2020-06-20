class SubTypesController < ApplicationController

    def create
        #add sub_types to a product
        product = Product.find_by_id params[:product_id]
        if product.nil?
            #if there is no product throw error
            render json: {errors: ["There is no product with that product_id"]}, status: :not_found
        else
            sub_types = product.sub_types.create sub_types_params[:sub_types]
            unless sub_types.empty?
                render json: {data: {sub_types: sub_types}}, status: :ok
            else
                render json: {errors: product.errors.full_messages }, status: :unprocessable_entity
            end       
        end
    end

    def show
        sub_types = SubType.where product_id: params[:product_id]
        render json: {data: sub_types}, status: :ok
    end

    private
        def sub_types_params
          params.permit!
        end
end
