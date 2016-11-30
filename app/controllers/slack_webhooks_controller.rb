class SlackWebhooksController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	def create
    # do something cool with the params
    # we used params[:team_domain], params[:token] for authentication, 
    # and params[:text] and params[:trigger_word] to create the tweet
    #
    # send response back to Slack
    require 'koala'
    message= params[:text]
    @graph = Koala::Facebook::API.new("EAACEdEose0cBAOqSoTLZCLhayaIBogIyaIvN7JT9fX6fGyazSXqzrGsn8iZBLdn5XOypVNaVRJ1qsmkJ1GHmflHLiwZACagLLkXjSS0BLe4LxHXG34mrg4SZBoVpVb6Yz8MQT2au46xkUlkPuB7cJRGNjjE0DllsHm7qOTAHxiEugK96W5FV")
    @graph.put_connections("584081568445570", "feed", message: message)

    render json: { text: "Some message you want to include" }
  end
end
