# -*- coding: utf-8 -*-

Plugin.create(:mikutter_premiamu) do

  @defined_time = Time.new.freeze

  on_appear do |ms|
    ms.each do |m|
      next if m[:created] <= @defined_time or m.retweet? or m.user[:id] == Service.primary.user_obj[:id]

      if m.to_s =~ /premium/i
        Service.primary.post(:message => '@%{id} premiumじゃなくてpremiamuだよ' % {id: m.user.idname},
                             :replyto => m)
      end

    end
  end

end

