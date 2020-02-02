class JsonWebToken
  class << self
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.credentials.dig(:jwt_base))
    end

    def decode(token)
      body = JWT.decode(token, Rails.application.credentials.dig(:jwt_base))[0]
      HashWithIndifferentAccess.new body
    rescue JWT::ExpiredSignature, JWT::DecodeError
      false
    end
  end
end

