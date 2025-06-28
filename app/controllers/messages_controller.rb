class MessagesController < ApplicationController
    before_action :set_session_id
  
    def create
      message = Message.new(body: params[:body], session_id: @session_id)
  
      if message.save
        render json: message, status: :created
      else
        render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def index
      messages = Message.where(session_id: @session_id).order(created_at: :desc)
      render json: messages
    end
  
    private
  
    def set_session_id
      cookies.signed[:session_id] ||= SecureRandom.uuid
      @session_id = cookies.signed[:session_id]
    end
  end
  