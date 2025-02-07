module OmniAuth
  module Strategies
    class Doorkeeper < OmniAuth::Strategies::OAuth2
      option :name, :doorkeeper

      option :client_options,
             site: ENV["DOORKEEPER_APP_URL"],
             authorize_path: "/oauth/authorize"

      uid do
        raw_info["id"]
      end

      info do
        {
          email: raw_info["email"]
        }
      end

      def raw_info
        #@raw_info ||= access_token.get("/api/v1/me.json").parsed
        @raw_info ||= { "email" => "mike@humanagency.com" }
      end
    end
  end
end
