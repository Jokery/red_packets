module Helpers
  module EnvHelper

    def session
      env['rack.session']
    end

    def logger
      Rails.logger
    end

  end
end
