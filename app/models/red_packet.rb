class RedPacket < ApplicationRecord

  has_many :red_packet_fragments

  class << self
    def create_red_packet(user, amount, size)
      password = 8.times.map {
        [*'A'..'Z', *'a'..'z', *0..9].sample
      }.join
      RedPacket.create(
        user_id: user.id,
        amount: amount,
        size: size,
        remain_amount: amount,
        remain_size: size,
        password: password
      )
    end
  end

  def create_fragment(user)
    if remain_size == 1
      amount = remain_amount
    else
      min = 0.01
      max = remain_amount - (remain_size - 1) * 0.01
      amount = rand * ((remain_amount / remain_size) * 2)
      amount = (amount * 100).floor / 100
      amount = [ min, amount ].max
      amount = [ max, amount ].min
    end

    self.class.transaction do
      update_attributes!(remain_size: remain_size - 1, remain_amount: remain_amount - amount)
      user.update_attributes!(balance: user.balance + amount)
      fragment = red_packet_fragments.create(user_id: user.id, amount: amount)
    end

    return fragment
  end

end
