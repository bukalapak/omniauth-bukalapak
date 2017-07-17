require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Bukalapak < OmniAuth::Strategies::OAuth2
      option :name, :bukalapak

      option :client_options, {
        :site => 'https://api.bukalapak.com',
        :authorize_url => 'https://accounts.bukalapak.com/oauth/authorize',
        :token_url => 'https://accounts.bukalapak.com/oauth/token'
      }

      def request_phase
        super
      end

      def authorize_params
        super.tap do |params|
          params[:scope] = request.params[:scope] if request.params[:scope]
        end
      end

      uid do
        raw_info['id'].to_s
      end

      info do
        hash = {
          'username' => raw_info['username'],
          'name'     => raw_info['name'],
          'image'    => raw_info['avatar']['url']
        }

        hash['email'] = email unless email.nil?
        hash
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('me').parsed
      end

      def email
        raw_info['email']
      end
    end
  end
end
