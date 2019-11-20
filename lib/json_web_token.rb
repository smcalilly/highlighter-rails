class JsonWebToken
  class << self
    def encode(payload, exp = 24.hours.from_now)
      puts 'encode'
      puts payload
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.credentials.jwt_secret_key)
    end

    def decode(token)
      body = JWT.decode(token, Rails.application.credentials.jwt_secret_key)[0]
      HashWithIndifferentAccess.new body
    rescue JWT::ExpiredSignature, JWT::DecodeError
      false
    end
  end
end

