class PinsController < ApplicationController
	before_action :find_pin, only: [:show, :edit, :update, :destroy]
	

	def show
	end

	def index
		#put newest first
		@pins = Pin.all.order("created_at DESC")	
	end

	def create
		#have each pin assigned to current_user
		@pin = current_user.pins.build(pin_params)
			if @pin.save
				redirect_to @pin, notice: "Successfully created new pin!"
			else
				render 'new'
			end
	end



	def new
		#have each pin assigned to current_user
		@pin = current_user.pins.build
	end


	def edit
	end




	def update
		if @pin.update(pin_params)
			redirect_to @pin, notice: "Pin was Successfully Updated!"
		else
			render 'edit'
		end
	end



	def destroy
		@pin.destroy
		redirect_to root_path
	end



	private

		def pin_params
			params.require(:pin).permit(:title, :description, :image)
		end

		def find_pin
			@pin = Pin.find(params[:id])
		end



end
