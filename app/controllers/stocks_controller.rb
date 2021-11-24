class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock				
        respond_to do |format|
          format.js { render partial: "users/result" }
        end

      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valid symbol to search"
          format.js { render partial: "users/result" }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a symbol to search"
        format.js { render partial: "users/result" }
      end
    end
  end

	def update
		current_user.stocks.each do |stock|
			stock.update_price
		end
		respond_to do |format|
			format.js { render partial: "layouts/stocks-table" }
		end
	end
end
