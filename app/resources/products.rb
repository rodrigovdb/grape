# frozen_string_literal: true

Dir["#{APPLICATION_PATH}/app/resources/products/*.rb"].each do |file| require file end

module Vdb
  class Products < Grape::API
    resource :products do
      desc 'get all with images'
      get do
        Product.all
      end

      desc 'create it'
      params do
        requires :name, type: String, desc: 'Product name'
      end
      post do
        product = Product.create(name: params[:name])

        product
      end

      route_param :id do
        desc 'Get a single product'
        get do
          Product.find(params.id)
        end

        desc 'Update'
        params do
          requires :name, type: String, desc: 'Product name'
        end
        put do
          product = Product.find(params.id)
          product.update(name: params.name)

          product
        end

        desc 'Delete'
        delete do
          product = Product.find(params.id)
          product.destroy

          product
        end

        mount ProductPictures
      end
    end
  end
end
