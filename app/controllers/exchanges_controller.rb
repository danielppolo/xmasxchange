class ExchangesController < ApplicationController
  def index
    @exchange = Exchange.new
    @exchanges = Exchange.all
    @active = Exchange.all.select { |e| e.active? }
    @today = Exchange.all.select { |e| e.today? }
    @past = Exchange.all.select { |e| e.past? }
  end

  def show
    @person = Person.new
    @exchange = Exchange.find(params[:id])
  end

  def create
    x = Exchange.new(exchange_params)
    if x.save
      redirect_to exchange_path(x)
    else
      redirect_to exchanges_path
    end
  end

  def update
    @exchange = Exchange.find(params[:id])
    @exchange.update(status: 1)
    redirect_to exchange_path(@exchange)
  end

  def sort
    exchange = Exchange.find(params[:exchange_id])
    exchange.update(status: 1)
    all = exchange.people
    people = all.map { |e| e }

    while people.length > 0
      index = rand(people.length)
      person = people[index]
      people.delete_at(index)
      index = rand(people.length)
      peer = people[index]
      people.delete_at(index)
      person.person = peer
    end
    redirect_to exchange_path(exchange)
  end

  private

  def exchange_params
    params.require(:exchange).permit(:name, :date)
  end
end
