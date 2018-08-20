module Provider
  module Openshift
    class Connection
      attr_reader :connection

      def initialize(auth_token = nil, server=nil, version=nil, ssl_options=nil)
        require 'openssl'
        require 'kubeclient'

        @ssl_options = ssl_options || { verify_ssl: OpenSSL::SSL::VERIFY_NONE }
        api_url = '/apis/servicecatalog.k8s.io'
        @server = "#{server}#{api_url}"
        @auth_token = auth_token
        @version = version || 'v1beta1'
        if @auth_token
          options = { auth_options: { bearer_token: @auth_token }, ssl_options: @ssl_options }
        else
          options = @ssl_options
        end
        @connection = Kubeclient::Client.new(@server, @version, options)
      end

      def k8s
        @k8s ||= K8s.new(connection)
      end
    end
  end
end
