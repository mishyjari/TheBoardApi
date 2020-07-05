class ClientsController < ApplicationController

  def index
    clients = Client.all
    render json: clients.to_json(include: :invoices, methods: [:incomplete_tickets, :tickets_today])
  end

  def create
    client = Client.create({
      name: params[:name],
      address: params[:address],
      contact_person: params[:contact_person],
      contact_phone: params[:contact_phone],
      is_archived: false
    })
    render json: client.to_json(include: [:tickets, :couriers], methods: [:incomplete_tickets, :tickets_today])
  end

  def update
    client = Client.find(params[:id])
    client.update({
      name: params[:name],
      address: params[:address],
      contact_person: params[:contact_person],
      contact_phone: params[:contact_phone],
      is_archived: params[:is_archived]
    })
    render json: client.to_json(include: [:tickets, :invoices], methods: [:incomplete_tickets, :tickets_today])
  end

  def destroy
    client = Client.find(params[:id]).destroy
    render json: client
  end

  def invoices
    invoices = Invoice.where({ client_id: params[:id] })
    render json: invoices.to_json(include: :client, methods: :tickets)
  end

  def show
    client = Client.find(params[:id])
    render json: client.to_json(include: [:tickets, :invoices], methods: [:incomplete_tickets, :tickets_today])
  end
end
