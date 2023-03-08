require 'swagger_helper'

RSpec.describe 'api/patient', type: :request do
	path '/api/v1/patient/{id}' do
		get 'Show patients under a Doctor' do
			tags :Patients
			produces 'application/json'
			parameter name: :id, in: :path, type: :string

			response '200', 'OK' do
				schema type: :array,
        items: {
						type: :object,
      			properties: {
            	patient_name: {type: :string},
            	phone_number: {type: :string},
						},
						required: %w[patient_name phone_number]
        }
				let(:id) {create(:doctor, name: 'test', specialism: 'xyz', cost: 123).id}
				run_test! do |response|
					response_body = JSON.parse(response.body)
				end
			end
		end
	end
end
