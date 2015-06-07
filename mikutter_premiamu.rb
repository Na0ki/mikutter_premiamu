# -*- coding: utf-8 -*-

Plugin.create(:ahiru_yakuna) do

  DEFINED_TIME = Time.new.freeze

  on_appear do |ms|
    ms.each do |m|
      if m.message.to_s =~ /puremiamu/ and m[:created] > DEFINED_TIME and !m.retweet?
      Service.primary.post(:message => "#{"@" + m.user.idname + ' puremiamuじゃなくてpremiamuだよ'}", :replyto => m)
      m.message.favorite(true)
     end
    end
  end
end

