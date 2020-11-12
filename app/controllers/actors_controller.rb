class ActorsController < ApplicationController
	def index
		@actors = Actor.all
	end

	def new
	end

	def create
		flag = false
		for a in 0..1 do
			fields = Array[:actor1, :actor2]
			actor = Actor.new(params.require(fields[a]).permit(:first_name, :last_name))
			if actor.save
				flag = true
			else
				flash[:errors] = actor.errors.full_messages
				redirect_to "/actors/new"
			end
		end

		if flag == true
			redirect_to "/actors"
		end
	end

	def show
		@movies = Actor.find(params[:id]).movies
	end

	def edit
		@actor = Actor.find(params[:id])
	end

	def update
		actor = Actor.find(params[:id])
		if actor.update(actor_params)
			redirect_to "/actors"
		else
			flash[:errors] = actor.errors.full_messages
			redirect_to "/actors/#{actor.id}/edit"
		end
	end

	def destroy
		actor = Actor.find(params[:id])
		actor.destroy
		redirect_to "/actors"
	end

	private
	def actor_params1
		params.require(:actor1).permit(:first_name, :last_name)
	end

	def actor_params2
		params.require(:actor2).permit(:first_name, :last_name)
	end
end