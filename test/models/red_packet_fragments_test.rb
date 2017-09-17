require "test_helper"

class RedPacketFragmentsTest < ActiveSupport::TestCase
  setup do
    @user = users(:user_1)
  end

  def test_not_last_fragment
    red_packet = red_packets(:red_packet_1)
    remain_amount = red_packet.remain_amount
    remain_size = red_packet.remain_size
    fragment = red_packet.create_fragment(@user)
    assert_kind_of(RedPacketFragment, fragment)
    assert_equal(remain_amount - fragment.amount, red_packet.remain_amount)
    assert_equal(remain_size - 1, red_packet.remain_size)
  end

  def test_last_fragment
    red_packet = red_packets(:red_packet_2)
    remain_amount = red_packet.remain_amount
    fragment = red_packet.create_fragment(@user)
    assert_kind_of(RedPacketFragment, fragment)
    assert_equal(remain_amount, fragment.amount)
  end

end
