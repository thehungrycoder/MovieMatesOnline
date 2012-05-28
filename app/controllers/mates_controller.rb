class MatesController < ApplicationController
  #my mates
  require 'will_paginate/active_record'
  def index
    # @todo implement pagination. currently it shows undefined method 'paginate'
    @mates = current_user.friends
  end

  def pending
    @outgoing = current_user.pending_invited.paginate(:page => params[:page])
    @incoming = current_user.pending_invited_by.paginate(:page => params[:page])

  end

  def invite
  end

  def accept
    new_mate = User.find(params[:mate_id])
    if new_mate.present?
      if current_user.invited_by?(new_mate)
        current_user.approve new_mate
        redirect_to :mates_pending, :notice => sprintf("%s has been approved as your mate!", new_mate.name)
        return
      else
        redirect_to :mates_pending, :alert => sprintf("%s could not approved as your mate!", new_mate.name)
        return
      end

    end
    redirect_to :mates_pending, :alert => "Mate could not be accepted!"
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
end
