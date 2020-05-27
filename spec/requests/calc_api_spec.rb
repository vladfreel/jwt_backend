# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Calculations API', type: :request do

  before :each do
    params = {
      username: "test@test.com",
      password: "some_pass"
    }
    post "/users", params: params
  end

  context 'Calculations' do
    describe 'create calc' do
      it 'calc with Yes' do
        params = {
          firstString: "abcadebabdeb",
          secondString: "baabd",
          user_id: User.last.id
        }
        post "/string_calculation", params: params
        expect(response).to have_http_status(:success)
        calc = JSON.parse(response.body)
        expect(calc.to_json).to eq(
          {
            cond: 'Yes',
            res: 'a<u>b</u>c<u>a</u>deb<u>a</u><u>b</u><u>d</u>eb'
          }.to_json
        )
      end

      it 'calc with No' do
        params = {
          firstString: "abcadebabdeb",
          secondString: "baabbd",
          user_id: User.last.id
        }
        post "/string_calculation", params: params
        expect(response).to have_http_status(:success)
        calc = JSON.parse(response.body)
        expect(calc.to_json).to eq(
          {
            cond: 'No'
          }.to_json
        )
      end

      it 'Calculation score save check' do
        params = {
          firstString: "abcadebabdeb",
          secondString: "baabd",
          user_id: User.last.id
        }
        expect {
          post "/string_calculation", params: params
        }.to change { Calculation.count }.by(1)
      end

      it 'Calculation delete' do
        params = {
          firstString: "abcadebabdeb",
          secondString: "baabd",
          user_id: User.last.id
        }
        post "/string_calculation", params: params
        expect {
          delete "/calculations/#{User.last.calculations.first.id}"
        }.to change { Calculation.count }.by(-1)
      end
    end
  end
end
