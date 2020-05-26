class CalculationsController < ApplicationController
  skip_before_action :require_login
  # GET /calculations
  def index
    calculations = Calculation.where(user_id: params[:user_id])
    render json: calculations
  end
  
  # DELETE /calculations/1
  def destroy
    calculation = Calculation.find(params[:id])
    calculation.destroy
  end
end
