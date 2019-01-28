class Api::CommunicationsController < ApplicationController


  def create
    practitioner = Practitioner.where(first_name: communication_params[:first_name], last_name: communication_params[:last_name]).first

    communication = Communication.new(practitioner_id: practitioner.id, sent_at: communication_params[:sent_at])

    communication.save

    render json: communication.to_json, status: :created
  end

  def index
    if params[:page].nil?
      render json: Communication.page(1), status: :ok
    else
      communications = Communication.page params[:page][:number]
      render json: communications, status: :ok
    end
  end

  def communication_params
    params.require(:communication).permit(:first_name, :last_name, :sent_at)
  end
end

