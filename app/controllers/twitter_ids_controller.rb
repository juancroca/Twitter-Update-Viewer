class TwitterIdsController < ApplicationController


  def show
    respond_to do |format|
      format.js{ render :layout => false}
      format.html{}
    end
  end

  def edit
  end

  def update
    if current_user.update_attributes(params[:user])
      redirect_to twitter_ids_path, :notice  => "Successfully added twitter ids."
    else
      render :action => 'edit'
    end
  end

end
