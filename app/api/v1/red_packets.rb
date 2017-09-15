module V1
  class RedPackets < Grape::API

    # snatch
    resources :red_packets do
      get '/', rabl: 'v1/red_packets' do
        @red_packets = RedPacket.where('created_at > ?', 1.day.ago)
      end
    end

  end
end
