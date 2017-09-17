module Helpers
  module StatusHelper

    def error_unauthorized!(msg = '401 Unauthorized')
      error!(msg, 401)
    end

    def error_forbidden!(msg = '403 Forbidden')
      error!(msg, 403)
    end

    def error_conflict!(msg = '409 Conflict')
      error!(msg, 409)
    end

  end
end
