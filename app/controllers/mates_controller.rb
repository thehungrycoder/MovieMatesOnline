class MatesController < ApplicationController
  def index
    @friendships = current_user.friendships.accepted.paginate(:page => params[:page])

  end

  def pending
    @outgoing = current_user.friendships.pending.paginate(:page => params[:page])
    @incoming = current_user.inverse_friendships.pending.paginate(:page => params[:page])

  end

  def invite
  end

  def modify
    raise current_user.friends.inspect
    raise friendship.inspect
  end
end
