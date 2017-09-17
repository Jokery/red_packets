module V1
  class RedPacketFragments< Grape::API

    resources :red_packet_fragments do

      desc '抢到的红包列表'
      get '/', rabl: 'v1/red_packet_fragments' do
        @red_packet_fragments = RedPacketFragment.where(user_id: current_user.id)
      end

      desc '抢红包'
      params do
        requires :red_packet_id, type: Integer, desc: '红包id'
        requires :password, type: String, desc: '红包口令'
      end
      post '/', rabl: 'v1/red_packet_fragment' do
        red_packet = RedPacket.find(params[:red_packet_id])
        error_forbidden! if red_packet.remain_size == 0
        error_conflict! if red_packet.red_packet_fragments.where(user_id: current_user.id).exists?
        error_unauthorized! if red_packet.password != params[:password]

        @red_packet_fragment = red_packet.create_fragment(current_user)
      end

    end

  end
end
