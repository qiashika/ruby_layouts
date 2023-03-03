require 'swagger_helper'

RSpec.describe 'api/my', type: :request do
  path '/api/v1/doctor' do
    get 'List of doctors' do
			before do
				create(:doctor, name: 'test', specialism: 'xyz', cost: 123)
				create(:doctor, name: 'test2', specialism: 'abc', cost: 456)
			end
			
			tags :doctors
      produces 'application/json'
			
			response '200', 'OK' do
      	schema type: :array,
					items: {
						type: :object,
      			properties: {
            	name: {type: :string},
            	specialism: {type: :string},
            	cost: {type: :integer}
						},
          	required: %w[id name cost]
					}
      	run_test! do |response|
      		response_body = JSON.parse(response.body)
        	expect(response_body.length).to eq(2)
					expect(response_body.first['name']).to eq('test')
				end
			end
		end
	end
		
	path '/api/v1/doctor/{id}' do
		get 'A Doctor' do
			tags :doctors
			produces 'application/json'
			parameter name: :id, in: :path, type: :string

			response '200', 'OK' do
				schema type: :object,
      			properties: {
							id: {type: :integer},
            	name: {type: :string},
            	specialism: {type: :string},
            	cost: {type: :integer},
							created_at: {type: :string},
							updated_at: {type: :string},
						},
						required: %w[id name specialism cost created_at updated_at]
				let(:id) {create(:doctor, name: 'test', specialism: 'xyz', cost: 123).id}
				run_test! do |response|
					response_body = JSON.parse(response.body)
					expect(response_body['name']).to eq('test')
				end
			end
		end
	end
end
