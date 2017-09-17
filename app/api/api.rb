class API < Grape::API
  format :json
  formatter :json, Grape::Formatter::Rabl

  helpers ::Helpers::EnvHelper
  helpers ::Helpers::SessionHelper
  helpers ::Helpers::StatusHelper

  mount V1::Root

  add_swagger_documentation doc_version: 'v1'

end
