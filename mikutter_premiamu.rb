 # -*- coding: utf-8 -*-

 Plugin.create(:mikutter_premiamu) do

   DEFINED_TIME = Time.new.freeze

   def reply_and_favorite(tweet)
     replySentence = "puremiamuじゃなくてpremiamuだよ"
     Service.primary.post(:message => "#{"@" + tweet.user.idname + ' ' + replySentence}", :replyto => tweet)
     tweet.message.favorite(true)
   end

   on_appear do |ms|

     #does_reply_self_message = UserConfig[:does_reply_self_message] || false

     ms.each do |m|
       if m.message.to_s =~ /puremiamu/ and m[:created] > DEFINED_TIME and !m.retweet?
         unless m.me # and does_reply_self_message
           replySentence = "puremiamuじゃなくてpremiamuだよ"
		   Service.primary.post(:message => "#{"@" + tweet.user.idname + ' ' + replySentence}", :replyto => tweet)
		   tweet.message.favorite(true)
		   # reply_and_favorite(m)
         end
       end
     end
   end
 end
