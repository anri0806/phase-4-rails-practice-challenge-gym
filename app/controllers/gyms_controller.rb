class GymsController < ApplicationController

    def index
        gyms = Gym.all
        render json: gyms, status: :ok
    end

    def show
        gym = Gym.find(params[:id])
        render json: gym, status: :ok
    rescue ActiveRecord::RecordNotFound
        render json: {error: "Not Found"}, status: :not_found
    end

    def update
        gym = Gym.find(params[:id])
        gym.update!(params.permit(:name, :address))
        render json: gym, status: :ok
    rescue ActiveRecord::RecordInvalid => invalid
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        head :no_content
    rescue ActiveRecord::RecordNotFound
        render json: {error: "Gym not found"}, status: :not_found
    end

end
