require 'swagger_helper'

RSpec.describe 'api/post', type: :request do
  path '/api/v1/doctor' do
    post "create a doctor" do
      tags :doctors
      consumes 'application/json'
      parameter name: :doctor, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string},
          specialism: { type: :string},
          cost: {type: :integer}
        },
        required: %w[name specialism cost]
      }

      response '200', 'doctor created' do
        let(:doctor) { { name: "test_doc", specialism: "testing", cost: "000"}}
        run_test!
      end
    end
  end

  path '/api/v1/doctor/{id}' do
    delete 'delete a doctor' do
      tags :doctors
      consumes 'application/json'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'doctor deleted' do
        let(:id) {create(:doctor).id}
        run_test!
      end
    end
  end

  path '/api/v1/doctor/{id}' do
    parameter name: :id, in: :path, type: :integer
    let(:doctor) { create(:doctor) }
  
    put 'Updates a doctor' do
      tags 'doctors'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :doctor, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          specialism: { type: :string },
          cost: { type: :integer }
        },
        required: %w[name specialism cost]
      }
  
      response '302', 'doctor updated' do
        let(:id) {doctor.id}
        run_test!
      end
    end
  end  
end
