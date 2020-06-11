class ApplicationController < ActionController::API
    before_action :authorized
    
    def encode_token(payload)
        JWT.encode(payload, secret)
    end

    def secret
        'my_s3cr3t'
    end

    def auth_header
        # puts "headers?"
        # puts request.headers
        # puts request.headers['Authorization']
        # puts "AFTER HEADER"
        # { 'Authorization': 'Bearer <token>' }
        request.headers['Authorization']
    end
    
    def decoded_token
        # puts "decode token"
        if auth_header
            # puts "we have an auth header"
            # puts auth_header
            token = auth_header.split(' ')[1]
            puts token
            # headers: { 'Authorization': 'Bearer <token>' }
            begin
                JWT.decode(token, secret, true, algorithm: 'HS256')
                # JWT.decode => [{ "beef"=>"steak" }, { "alg"=>"HS256" }]
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        decoded = decoded_token
        if decoded
            # decoded_token=> [{"user_id"=>2}, {"alg"=>"HS256"}]
            # or nil if we can't decode the token
            user_id = decoded[0]['user_id']
            user = User.find_by(id: user_id)
            user
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end

end
