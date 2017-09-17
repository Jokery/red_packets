module V1
  class RedPackets < Grape::API

    resources :red_packets do

      desc '获取红包列表'
      get '/', rabl: 'v1/red_packets' do
        @red_packets = RedPacket.where('created_at > ?', 1.day.ago)
        red_packet_fragments = RedPacketFragment.where(red_packet_id: @red_packets.map(&:id), user_id: current_user.id)
        @snatched_red_packet_ids = red_packet_fragments.map(&:red_packet_id)
      end

      desc '发布新红包'
      params do
        requires :amount, type: Float, desc: '红包总金额'
        requires :size, type: Integer, desc: '红包份数'
      end
      post '/', rabl: 'v1/red_packet' do
        @red_packet = RedPacket.create_red_packet(
          current_user,
          params[:amount],
          params[:size]
        )
      end

    end

  end
end
