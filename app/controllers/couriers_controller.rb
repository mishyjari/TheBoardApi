class CouriersController < ApplicationController

  def index
    couriers = Courier.all
    render json: couriers.to_json(include: [:tickets, :clients], methods: :full_name)
  end

  def create
    courier = Courier.create!({
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone: params[:phone],
      radio_number: params[:radio_number],
      is_active: params[:is_active]
    })
    render json: courier.to_json(include: [:tickets, :clients], methods: :full_name)
  end

  def update
    courier = Courier.find(params[:id])
    courier.update({
      first_name: params[:first_name],
      last_name: params[:last_name],
      phone: params[:phone],
      email: params[:email],
      radio_number: params[:radio_number],
      is_active: params[:is_active]
    })
    render json: courier.to_json(include: [:tickets, :clients], methods: :full_name)
  end

  def destroy
    courier = Courier.find(params[:id]).destroy
    render json: courier.to_json(include: [:tickets, :clients], methods: :full_name)
  end
end
