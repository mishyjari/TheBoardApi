class ClientsController < ApplicationController

  def index
    clients = Client.all
    render json: clients.to_json(include: [:tickets, :couriers])
  end

  def create
    client = Client.create({

    })
    render json: client
  end

  def update
    client = Client.find(params[:id])
    client.update({
      # Client attributes from params
    })
  end

  def destroy
    Client.find(params[:id]).destroy
  end

end
