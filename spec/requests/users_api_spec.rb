# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  context 'Login and Signup' do
    describe 'sign up' do
      it 'returns the user' do
        params = {
          username: "test@test.com",
          password: "some_pass"
        }
        post "/users", params: params
        expect(response).to have_http_status(:success)
        user = JSON.parse(response.body)['user']['username']
        expect(user).to eq('test@test.com')
      end
    end

    describe 'login' do
      it 'returns the user' do
        params = {
          username: "test2@test.com",
          password: "some_pass"
        }
        post "/users", params: params
        post '/login', params: params
        expect(response).to have_http_status(:success)
        user = JSON.parse(response.body)['user']['username']
        expect(user).to eq('test2@test.com')
      end
    end
  end
end
