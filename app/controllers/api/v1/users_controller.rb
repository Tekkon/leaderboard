# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: users.order(score: :desc).take(100)
      end

      private

      def users
        if permitted_params[:country_id]
          User.where(country_id: permitted_params[:country_id])
        else
          User.all
        end
      end

      def permitted_params
        params.permit(:country_id)
      end
    end
  end
end
