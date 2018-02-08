class CreationsController < ApplicationController

  def new
    @creation = Creation.new
  end

  def create
    @creation = Creation.new(creation_params)
    if @creation.save
      log_in @creation
      flash[:success] = "Creation successfully created!"
      redirect_to @creation
    else
      render 'new'
    end
  end

end


=begin
u = User.new; u.save
e = Event.new ; e.save

c = u.creations.new
c.event = e
c.save
=end
