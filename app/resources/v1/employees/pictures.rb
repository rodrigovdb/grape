# frozen_string_literal: true

module Vdb
  class EmployeePictures < Grape::API
    resource :pictures do
      desc 'Employee pictures'
      get do
        employee = Employee.find_by_public_id(params.id)

        employee&.pictures
      end

      desc 'Add image'
      params do
        requires :name,   type: String, desc: 'Employee name'
        requires :image,  type: Rack::Multipart::UploadedFile,
                          desc: 'Image file',
                          documentation: { param_type: 'formData' }
      end
      post do
        employee = Employee.find_by_public_id(params.id)

        employee.pictures << Picture.new(name: params.name, image: params.image.tempfile)
        employee.save

        employee.pictures
      end

      route_param :picture_id do
        desc 'Get a picture'
        get do
          employee = Employee.find_by_public_id(params.id)
          employee.pictures.find_by_public_id(params.picture_id)
        end

        desc 'Update'
        params do
          requires :name, type: String, desc: 'Image name'
        end
        put do
          employee  = Employee.find_by_public_id(params.id)
          picture   = employee.pictures.find_by_public_id(params.picture_id)
          picture.update(name: params.name)

          picture
        end

        delete do
          employee  = Employee.find_by_public_id(params.id)
          picture   = employee.pictures.find_by_public_id(params.picture_id)
          picture.destroy
        end
      end
    end
  end
end
