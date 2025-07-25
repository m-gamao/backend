Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://localhost:4200'
  
      resource '*',
        headers: :any,
        methods: [:get, :post, :options],
        credentials: true
    end
  end
  