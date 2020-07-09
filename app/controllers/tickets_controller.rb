class TicketsController < ApplicationController

  def index
    tickets = Ticket.all
    render json: tickets.to_json(include: [:courier, :client])
  end

  def paginate
    tickets = Ticket.paginate(:page => params[:page], per_page: 10)
    render json: tickets.to_json(include: [:courier, :client])
  end

  def today
    today = DateTime.now()
    tickets = Ticket.where({:time_due => today.beginning_of_day..today.end_of_day})
      .or(Ticket.where({:time_ready => today.beginning_of_day..today.end_of_day}))
      .or(Ticket.where({:created_at => today.beginning_of_day..today.end_of_day}))
      .or(Ticket.where({:is_complete => false}))
      .or(Ticket.where({:courier_id => nil}))
    render json: tickets.to_json(include: [:courier, :client])
  end

  def incomplete_unassigned
    tickets = Ticket.where({is_complete: false}).or(Ticket.where({ courier_id: nil }))
    render json: tickets.to_json(methods: :total_charge)
  end

  def search
    start_date = DateTime.new(2000,1,1)
    end_date = DateTime.now()

    if params[:start]
      start_date = DateTime.parse(params[:start])
    end
    if params[:end]
      end_date = DateTime.parse(params[:end])
    end

    sql = {
      :time_ready => start_date.beginning_of_day..end_date.end_of_day,
    }

    sql[:client_id] = params[:client_id] if params[:client_id]
    sql[:courier_id] = params[:courier_id] if params[:courier_id]

    page = params[:page] ? params[:page] : 1

    tickets = Ticket.where(sql).order('CREATED_AT DESC').paginate(page: page, per_page: 20)
    render json: {
      'tickets' => tickets.as_json(include: [:courier, :client], methods: :total_charge),
      'count' => tickets.total_entries
    }.to_json
  end

  def active
    tickets = Ticket.where({ is_complete: false })
    render json: tickets.to_json(include: [:courier, :client], methods: :total_charge)
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
      is_complete: params[:is_complete],
      pickup_details: params[:pickup_details],
      pickup_contact: params[:pickup_contact],
      dropoff_details: params[:dropoff_details],
      dropoff_contact: params[:dropoff_contact],
      rush_charge: params[:rush_charge],
      is_roundtrip: params[:is_roundtrip],
      roundtrip_details: params[:roundtrip_details],
      roundtrip_charge: params[:roundtrip_charge],
    })
    render json: ticket.to_json(include: [:courier, :client], methods: :total_charge)
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
      is_complete: params[:is_complete],
      pickup_details: params[:pickup_details],
      pickup_contact: params[:pickup_contact],
      dropoff_details: params[:dropoff_details],
      dropoff_contact: params[:dropoff_contact],
      rush_charge: params[:rush_charge],
      is_roundtrip: params[:is_roundtrip],
      roundtrip_details: params[:roundtrip_details],
      roundtrip_charge: params[:roundtrip_charge],
      pod: params[:pod]
    })
    render json: ticket.to_json(include: [:courier, :client], methods: :total_charge)
  end

  def destroy
    ticket = Ticket.find(params[:id]).destroy
    render json: ticket
  end
  def show
    ticket = Ticket.find(params[:id])
    render json: ticket.to_json(include: [:courier, :client], methods: :total_charge)
  end
end
