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

  def peer
    @person = Person.find(params[:id])
    if params[:key] == @person.key
      @peer = @person.person
    else
      redirect_to person_path(@person)
    end
  end

  private

  def person_params
    params.require(:person).permit(:name, :key, :exchange)
  end
end
