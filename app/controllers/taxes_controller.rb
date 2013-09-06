class TaxesController < ApplicationController

  def index
  	@taxes = Tax.all
  end

  def new
  	@tax = Tax.new
  end

  def create
  	tax = params[:tax]
  	left_date = DateTime.new(tax["left(1i)"].to_i, tax["left(2i)"].to_i, tax["left(3i)"].to_i, tax["left(4i)"].to_i, tax["left(5i)"].to_i)
  	return_date = DateTime.new(tax["return(1i)"].to_i, tax["return(2i)"].to_i, tax["return(3i)"].to_i, tax["return(4i)"].to_i, tax["return(5i)"].to_i)
  	difference = (return_date - left_date).to_f * 24
  	days = (difference / 24).floor
  	hours = (difference % 24).ceil
  	tax = Tax.create(left: left_date, :return => return_date, days: days, hours: hours, comment: tax[:comment])
  	redirect_to :root
  end

  def destroy
  	tax = Tax.find(params[:id])
    tax.destroy
    redirect_to :root
  end
end
