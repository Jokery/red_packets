module V1
  class Root < Grape::API
    version 'v1', using: :path

    mount V1::Auth
    mount V1::RedPackets
  end
end
