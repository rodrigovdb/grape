# frozen_string_literal: true

module Vdb
  class ProductPictures < Grape::API
    resource :pictures do
      desc 'Product pictures'
      get do
        product = Product.find(params.id)

        product&.pictures
      end

      desc 'Add image'
      params do
        requires :name,   type: String, desc: 'Product name'
        requires :image,  type: Rack::Multipart::UploadedFile,
                          desc: 'Image file',
                          documentation: { param_type: 'formData' }
      end
      post do
        product = Product.find(params.id)

        product.pictures << Picture.new(name: params.name, image: params.image.tempfile)
        product.save

        product.pictures
      end

      route_param :picture_id do
        desc 'Get a picture'
        get do
          product = Product.find(params.id)
          product.pictures.find(params.picture_id)
        end

        desc 'Update'
        params do
          requires :name, type: String, desc: 'Image name'
        end
        put do
          product = Product.find(params.id)
          picture = product.pictures.find(params.picture_id)
          picture.update(name: params.name)

          picture
        end

        delete do
          product = Product.find(params.id)
          picture = product.pictures.find(params.picture_id)
          picture.destroy
        end
      end
    end
  end
end
