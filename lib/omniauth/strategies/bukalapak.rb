require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Bukalapak < OmniAuth::Strategies::OAuth2
      option :name, :bukalapak

      option :client_options, {
        :site => 'https://api.bukalapak.com',
        :authorize_url => 'https://www.bukalapak.com/oauth/authorize',
        :token_url => 'https://www.bukalapak.com/oauth/access_token'
      }

      def request_phase
        super
      end

      def authorize_params
        super.tap do |params|
          params[:scope] = request.params[:scope] if request.params[:scope]
        end
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('me').parsed
      end
    end
  end
end
