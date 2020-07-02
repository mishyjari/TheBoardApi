class InvoicesController < ApplicationController

  def index
    invoices = Invoice.all
    render json: invoices.to_json(include: :client, methods: [:tickets, :balance])
  end

  def search
    start_date = DateTime.parse(params[:start])
    end_date = DateTime.parse(params[:end])
  end


  def create
    invoice = Invoice.create({
      client_id: params[:client_id],
      start_date: DateTime.parse(params[:startDate]).beginning_of_day,
      end_date: DateTime.parse(params[:endDate]).end_of_day,
      paid: false
    })
    render json: invoice.to_json(include: :client, methods: [:tickets, :balance])
  end

  def update
    invoice = Invoice.find(params[:id])
    invoice.update({
      paid: params[:paid]
    })
    render json: invoice.to_json(include: :client, methods: [:tickets, :balance])
  end

  def destroy
    invoice = Invoice.find(params[:id]).destroy
    render json: invoice

  end

  def unpaid
    invoices = Invoice.where({ paid: false })
    render json: invoices.to_json(include: :client, methods: [:tickets, :balance])
  end

  def mark_paid
    invoice = Invoice.update({ paid: true })
    render json: invoice.to_json(include: :client, methods: [:tickets, :balance])
  end
end
