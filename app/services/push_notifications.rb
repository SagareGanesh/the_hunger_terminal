class PushNotifications
  def send_to_all
    subscriptions = Subscription.all

    subscriptions.each do |subscription|
      Webpush.payload_send webpush_params_for(subscription)
    end
  end

  private

  def webpush_params_for(subscription)
    {
      message:  WEB_NOTIFICATION_MSG,
      endpoint: subscription.endpoint,
      p256dh:   subscription.p256dh_key,
      auth:     subscription.auth_key,
      api_key:  ENV.fetch('PUSH_NOTIFICATION_API_KEY')
    }    
  end
end