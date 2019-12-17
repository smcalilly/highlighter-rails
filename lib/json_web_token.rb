class JsonWebToken
  class << self
    def encode(payload, exp = 24.hours.from_now)
      puts 'encode'
      puts payload
      payload[:exp] = exp.to_i
      JWT.encode(payload, 'd398a70cc9ab419973e8d31ce9e01d49a6108c393f73625e662e8b06eb4f5a0c0e4bc2618f74c2fc123cc31b817d32dfcf391ccc5037dddc7d1d58d1aff78598')
    end

    def decode(token)
      body = JWT.decode(token, 'd398a70cc9ab419973e8d31ce9e01d49a6108c393f73625e662e8b06eb4f5a0c0e4bc2618f74c2fc123cc31b817d32dfcf391ccc5037dddc7d1d58d1aff78598')[0]
      HashWithIndifferentAccess.new body
    rescue JWT::ExpiredSignature, JWT::DecodeError
      false
    end
  end
end

