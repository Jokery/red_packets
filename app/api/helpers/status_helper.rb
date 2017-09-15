module Helpers
  module StatusHelper

    def error_unauthorized!(msg = '401 Unauthorized')
      error!(msg, 401)
    end

  end
end
