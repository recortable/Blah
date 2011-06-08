class BlahController < ApplicationController
  def about

  end

  expose(:notifications) { Notification.pending.order('id DESC') }
  def status

  end

  def process

  end
end
