require "test_helper"

class RedPacketTest < ActiveSupport::TestCase

  def test_red_packets
    user = users(:user_1)
    assert_kind_of User, user
    amount = 12.8
    size = 6
    red_packet = RedPacket.create_red_packet(user, amount, size)
    assert_kind_of RedPacket, red_packet
    assert_equal(red_packet.amount, amount)
    assert_equal(red_packet.remain_amount, amount)
    assert_equal(red_packet.size, size)
    assert_equal(red_packet.remain_size, size)
    assert_match(/^[A-Za-z0-9]{8}$/, red_packet.password)
  end

end
