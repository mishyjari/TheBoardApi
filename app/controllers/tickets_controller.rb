class TicketsController < ApplicationController
  def index
    tickets = Ticket.all.limit(500)
    render json: tickets.to_json(include: [:courier, :client])
  end

  def search
    tickets = Ticket.where({
      courier_id: params[:courier_id],
      client_id: params[:client_id],
      is_complete: params[:complete],
      is_rush: params[:rush],
    })
    render json: tickets.to_json(include: [:courier, :client])
  end

  def active
    tickets = Ticket.where({ is_complete: false })
    render json: tickets.to_json(include: [:courier, :client])
  end

  def create
    ticket = Ticket.create!({
      time_ready: params[:time_ready],
      time_due: params[:time_due],
      client_id: params[:client_id],
      courier_id: params[:courier_id],
      pickup: params[:pickup],
      dropoff: params[:dropoff],
      is_rush: params[:is_rush],
      rush_details: params[:rush_details],
      is_oversize: params[:is_oversize],
      oversize_details: params[:oversize_details],
      oversize_charge: params[:oversize_charge],
      notes: params[:notes],
      additional_charge: params[:additional_charge],
      base_charge: params[:base_charge],
      is_complete: params[:is_complete]
    })
    render json: ticket.to_json(include: [:courier, :client])
  end

  def update
    ticket = Ticket.find(params[:id])
    ticket.update({
      time_ready: params[:time_ready],
      time_due: params[:time_due],
      client_id: params[:client_id],
      courier_id: params[:courier_id],
      pickup: params[:pickup],
      dropoff: params[:dropoff],
      is_rush: params[:is_rush],
      rush_details: params[:rush_details],
      is_oversize: params[:is_oversize],
      oversize_details: params[:oversize_details],
      oversize_charge: params[:oversize_charge],
      notes: params[:notes],
      additional_charge: params[:additional_charge],
      base_charge: params[:base_charge],
      is_complete: params[:is_complete]
    })
    render json: ticket.to_json(include: [:courier, :client])
  end

  def destroy
    ticket = Ticket.find(params[:id]).destroy
    render json: ticket
  end
end
