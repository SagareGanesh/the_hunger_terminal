class SubscriptionsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    Subscription.create!(
      endpoint:   params['subscription']['endpoint'],
      auth_key:   params['subscription']['keys']['auth'],
      p256dh_key: params['subscription']['keys']['p256dh']
    )

    head :ok
  end
end