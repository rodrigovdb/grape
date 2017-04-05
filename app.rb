module My
  class API < Grape::API
    version 'v1', using: :header, vendor: 'twitter'
    format :json
    prefix :api

    resource :employees do
      desc 'create it'
      params do
        requires :name, type: String, desc: 'Employee name'
      end
      post do
        Employee.create(name: params[:name])
      end

      desc 'get all with images'
      get do
        Employee.all.map(&:to_json)
      end

      route_param :id do
        desc 'Get a single employee'
        get do
          Employee.find(params.id)
        end

        desc 'Update'
        params do
          requires :name, type: String, desc: 'Employee name'
        end
        put do
          employee = Employee.find(params.id)
          employee.update(name: params.name)

          employee
        end

        resource :pictures do
          desc 'Employee pictures'
          get do
            employee = Employee.find(params.id)

            employee.pictures unless employee.nil?
          end

          desc 'Add image'
          params do
            requires :name,   type: String, desc: 'Employee name'
            requires :image,  type: Rack::Multipart::UploadedFile,
                              desc: 'Image file',
                              documentation: { param_type: 'formData' }
          end
          post do
            employee  = Employee.find(params.id)

            employee.pictures << Picture.new(name: params.name, image: params.image.tempfile)
            employee.save

            employee.pictures
          end

          route_param :id do
            desc 'Update'
            params do
              requires :name, type: String, desc: 'Image name'
            end
            put do
              { foo: :bar, id: params.id }
            end
          end
        end
      end
    end
  end
end
