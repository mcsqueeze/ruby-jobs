class Api::CommunicationsController < ApplicationController


  def create
    practitioner = Practitioner.find_by(first_name: communication_params[:first_name], last_name: communication_params[:last_name])
    communication = Communication.where(practitioner_id: practitioner.id, sent_at: communication_params[:sent_at]).first_or_create
    render json: communication.to_json, status: :created
  end

  def index
    if params[:page].nil?
      @communications = Communication.includes(:practitioner).page(1)
      render json: @communications, status: :ok
    else
      @communications = Communication.includes(:practitioner).page params[:page][:number]
      render json: @communications, status: :ok
    end
  end

  def communication_params
    params.require(:communication).permit(:first_name, :last_name, :sent_at)
  end
end



