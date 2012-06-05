class MatesController < ApplicationController
  #my mates
  include ApplicationHelper

  def index
    # @todo implement pagination. currently it shows undefined method 'paginate'
    @mates = current_user.friends
  end

  def pending
    @outgoing = current_user.pending_invited.paginate(:page => params[:page])
    @incoming = current_user.pending_invited_by.paginate(:page => params[:page])

  end

  def invite
    new_mate = User.find_by_id(params[:id])
    if new_mate.present?
      #if already friend
      if current_user.friend_with?(new_mate)
        redirect_to ApplicationHelper::get_return_url, :alert => sprintf('%s is already your mate!', new_mate.name)
        return
      end

      # if the request is already sent earlier
      if current_user.invited? new_mate
        redirect_to get_return_url, :alert => sprintf('You\'ve already sent mate request to %s!', new_mate.name)
        return
      end

      #if mate request is sent from other end, automatically make them friend
      if new_mate.invited? current_user
        current_user.approve new_mate
        redirect_to get_return_url, :notice => sprintf("%s and you are not movie mate!", new_mate.name)
        return
      end

      #send mate request
      current_user.invite new_mate
      redirect_to get_return_url, :notice => sprintf("Mate request sent to %s!", new_mate.name)
      return
    end

    redirect_to get_return_url, :alert => 'Error occurred while sending mate request!'
  end

  def accept
    new_mate = User.find(params[:mate_id])
    if new_mate.present?
      if current_user.invited_by?(new_mate)
        current_user.approve new_mate
        redirect_to get_return_url, :notice => sprintf("%s has been approved as your mate!", new_mate.name)
        return
      else
        redirect_to get_return_url, :alert => sprintf("%s could not approved as your mate!", new_mate.name)
        return
      end

    end
    redirect_to get_return_url, :alert => "Mate could not be accepted!"
  end

  def remove
    mate = User.find_by_id(params[:mate_id])

    if mate.present?
      if current_user.connected_with? mate
        if current_user.remove_friendship mate
          redirect_to get_return_url, :notice => sprintf('%s removed from your mates!', mate.name)
          return
        else
          redirect_to get_return_url, :alert => sprintf('%s could not be removed from your mates list!', mate.name)
          return
        end
      end
    end
    redirect_to :mates_pending, :alert => "No such mate found!"
  end

  def block
    new_mate = User.find(params[:mate_id])
    if new_mate.present?
      if current_user.block(new_mate)
        redirect_to :mates_pending, :notice => sprintf("%s has been blocked!", new_mate.name)
        return
      else
        redirect_to :mates_pending, :alert => sprintf("%s could not be blocked!", new_mate.name)
        return
      end
    end
    redirect_to :mates_pending, :alert => "Mate could not be rejected!"
  end

  def search
    conditions = params[:user]
    return if conditions.blank?

    @users = User.search do
      fulltext conditions[:name]
    end
    @users = @users.results

  end

end
