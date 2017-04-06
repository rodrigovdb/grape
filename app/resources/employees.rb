# frozen_string_literal: true

Dir["#{APPLICATION_PATH}/app/resources/employees/*.rb"].each do |file| require file end

module Vdb
  class Employees < Grape::API
    resource :employees do
      desc 'get all with images'
      get do
        Employee.all
      end

      desc 'create it'
      params do
        requires :name, type: String, desc: 'Employee name'
      end
      post do
        employee = Employee.create(name: params[:name])

        employee
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

        desc 'Delete'
        delete do
          employee = Employee.find(params.id)
          employee.destroy

          employee
        end

        mount EmployeePictures
      end
    end
  end
end
