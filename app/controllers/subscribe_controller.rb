# frozen_string_literal: true

class SubscribeController < ApplicationController
  before_action :validate_email

  def create
    Subscriber.new(email: subscribe_params[:email]).call
    redirect_to home_index_path
  end

  private

  def subscribe_params
    params.permit(:email)
  end

  def validate_email
    redirect_to home_index_path unless subscribe_params[:email] =~ /.+@.+\..+/i
  end
end
