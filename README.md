# Facebook-Slack
A web app that allow your team members to post on facebook as your Business page from a slack channel without giving admin rights of your page to any of your team members.

SLACK SETUP:

Slack makes creating an Outgoing WebHook extremely easy. If you are logged into your account, simply go to:

https://[your-team-domain].slack.com/services/new

From here, you are looking for the Outgoing WebHooks link. It’s pretty hard to miss.
Once you click on that, it will bring you to a nice interface to manage your new web hook.

You can select exactly what channel you want the web hook to integrate with (or all channels).
You can choose specific trigger words (in the case of our app we use the trigger word #uber).
And The URL is where Slack will send the POST request. More about the POST request below.

Slack does a great job of explaining what is included in the POST request. For the case of our app, the params[:trigger_word] will be tweet, and the params[:text] will be the content of the tweet we want to send.

The request also includes information that can help you with authentication, including token and team_domain.

It’s important to note that Outgoing WebHooks do not send any information about attachments in the POST request.

RAILS SETUP:

in config/routes.rb:
>  Rails.application.routes.draw do
>  resources :slack_webhooks
>  end
in app/controllers/slack_webhooks_controller.rb:
     > class SlackWebhooksController &lt; ApplicationController
     > def create
     >   # do something cool with the params
     >   # we used params[:team_domain], params[:token] for authentication, 
     >  # and params[:text] and params[:trigger_word] to create the post
     >  #
     >  # send response back to Slack
     >  render json: { text: "Some message you want to include" }
     >end
    >end

