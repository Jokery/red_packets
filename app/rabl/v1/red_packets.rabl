collection @red_packets
attribute :id, :size, :amount, :remain_size
node(:snatched) { |red_packet| @snatched_red_packet_ids.include? red_packet.id }
