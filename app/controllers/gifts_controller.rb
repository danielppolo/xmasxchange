class GiftsController < ApplicationController
  def create
    @person = Person.find(params[:person_id])
    @gift = Gift.new(gift_params)
    @gift.person = @person
    @gift.save
    redirect_to person_path(@person)
  end

  private

  def gift_params
    params.require(:gift).permit(:name)
  end
end
