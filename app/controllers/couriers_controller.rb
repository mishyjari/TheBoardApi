class CouriersController < ApplicationController

  def index
    couriers = Courier.all
    render json: couriers.to_json(methods: [:full_name, :incomplete_tickets, :tickets_today])
  end

  def incomplete
    tickets = Ticket.where({ courier_id: params[:courier_id], is_complete: false })
    render json: tickets.to_json(include: [:courier, :client])
  end

  def show
    courier = Courier.find(params[:id])
    render json: courier.to_json(methods: [:full_name, :incomplete_tickets, :tickets_today])
  end

  def create
    courier = Courier.create!({
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone: params[:phone],
      radio_number: params[:radio_number],
      is_active: params[:is_active],
      is_archived: false
    })
    render json: courier.to_json(include: [:tickets, :clients], methods: [:full_name, :incomplete_tickets, :tickets_today])
  end

  def update
    courier = Courier.find(params[:id])
    courier.update({
      first_name: params[:first_name],
      last_name: params[:last_name],
      phone: params[:phone],
      email: params[:email],
      radio_number: params[:radio_number],
      is_active: params[:is_active],
      is_archived: params[:is_archived]
    })
    render json: courier.to_json(include: [:tickets, :clients], methods: [:full_name, :incomplete_tickets, :tickets_today])
  end

  def destroy
    courier = Courier.find(params[:id]).destroy
    render json: courier.to_json(include: [:tickets, :clients], methods: [:full_name, :incomplete_tickets])
  end
end
