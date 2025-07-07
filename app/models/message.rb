class Message
    include Mongoid::Document
    include Mongoid::Timestamps
  
    field :body, type: String
    field :phone, type: String
    field :session_id, type: String

  
    validates :body, presence: true
    validates :session_id, presence: true
  
    def as_json(options = {})
      {
        id: id.to_s,
        body: body,
        created_at: created_at
      }
    end
  end
  