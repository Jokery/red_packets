class API < Grape::API
  format :json
  formatter :json, Grape::Formatter::Rabl

  helpers ::Helpers::SessionHelper
  helpers ::Helpers::StatusHelper

  mount V1::Root

end
