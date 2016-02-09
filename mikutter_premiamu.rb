# -*- coding: utf-8 -*-

Plugin.create(:ahiru_yakuna) do

  PREMIAMU_DEFINED_TIME = Time.new.freeze
  on_appear do |ms|
    ms.each do |m|
    #   unless Service.primary.to_user
      if m.message.to_s =~ /premium/ and m[:created] > PREMIAMU_DEFINED_TIME and !m.retweet? and m.user.idname != Service.primary.to_user
        Service.primary.post(:message => "#{"@" + m.user.idname + ' premiumじゃなくてpremiamuだよ'}", :replyto => m)
        # end
      end
    end
  end

end

