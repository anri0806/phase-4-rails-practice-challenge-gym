class MembershipsController < ApplicationController

    def create
        membership = Membership.create!(params.permit(:gym_id, :client_id, :charge))
        render json: membership, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

end
