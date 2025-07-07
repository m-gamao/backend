module Api
  class MessagesController < ApplicationController
    # Disable CSRF protection for API requests (since Angular frontend won't send CSRF tokens)
    skip_before_action :verify_authenticity_token

    # Assign a unique session ID per browser (via cookies)
    before_action :set_session_id

    def create
      begin
        # Log the incoming params for debugging
        Rails.logger.debug "Incoming message params: #{params.inspect}"
    
        # Send SMS via Twilio
        client = Twilio::REST::Client.new(
          ENV['TWILIO_ACCOUNT_SID'],
          ENV['TWILIO_AUTH_TOKEN']
        )
    
        client.messages.create(
          from: ENV['TWILIO_PHONE_NUMBER'],
          to: params[:phone],
          body: params[:body]
        )
    
        message = Message.new(
          body: params[:body],
          phone: params[:phone],
          session_id: @session_id
        )
    
        if message.save
          render json: message.as_json(only: [:id, :body, :phone, :created_at]), status: :created
        else
          render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
        end
    
      rescue => e
        Rails.logger.error "Error in MessagesController#create: #{e.class} - #{e.message}"
        Rails.logger.error e.backtrace.join("\n")
        render json: { error: "Server error: #{e.message}" }, status: :internal_server_error
      end
    end
    

    def index
      # Return messages associated with this session ID
      messages = Message.where(session_id: @session_id).order(created_at: :desc)
      render json: messages.as_json(only: [:id, :body, :phone, :created_at])
    end

    private

    def set_session_id
      cookies.signed[:session_id] ||= SecureRandom.uuid
      @session_id = cookies.signed[:session_id]
    end
  end
end
