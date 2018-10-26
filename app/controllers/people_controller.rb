class PeopleController < ApplicationController
  def create
    @exchange = Exchange.find(params[:exchange_id])
    @person = Person.new(person_params)
    @person.exchange = @exchange
    @person.save
    redirect_to exchange_path(@exchange)
  end

  def show
    @gift = Gift.new
    @person = Person.find(params[:id])
  end

  private

  def person_params
    params.require(:person).permit(:name, :key, :exchange)
  end
end
