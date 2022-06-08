class ClientsController < ApplicationController

    def index
        clients = Client.all
        render json: clients, status: :ok
    end

    def show
        client = Client.find(params[:id])
        render json: client, status: :ok
    rescue ActiveRecord::RecordNotFound
        render json: {error: "Client not found"}, status: :not_found, methods: [:total_membership]
    end

    def update
        client = Client.find(params[:id])
        client.update!(params.permit(:name, :age))
        render json: client, status: :ok
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end

end
