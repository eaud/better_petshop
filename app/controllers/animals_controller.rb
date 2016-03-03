class AnimalsController < ApplicationController
  def index
    response = HTTParty.get('http://animal-api.herokuapp.com/api/v1/animals/').parsed_response["animals"]
    @animals = Animal.new_from_json(response).shuffle
  end

  def environment
    response = HTTParty.get('http://animal-api.herokuapp.com/api/v1/animals/').parsed_response["animals"]
    Animal.new_from_json(response)
    @environments = Animal.sort_by_environment
  end

end
