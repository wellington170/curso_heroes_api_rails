module Authenticable
    #Nenhuma requisição deve acessar
    private

    def authenticate_with_token 
        #
        @token ||=  request.headers['Authorization']
        unless valid_token?
            #Por mais que não pareça, trata-se de uma hash declarada aqui
            render json: {errors: 'Vocẽ não está autorizado para acessaar essa rota'},
            status: :unauthorized
        end

    end

    def valid_token?
        @token.present? && @token.split(' ').last == Rails.application.credentials.token
    end


end