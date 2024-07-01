class VenuesController < ApplicationController

  def index
    matching_venues = Venue.all
    @venues = matching_venues.order(:created_at)

    render({ :template => "venue_templates/index" })
  end

  def show
    venue_id = params.fetch("an_id")
    matching_venues = Venue.where({ :id => venue_id })
    @the_venue = matching_venues.first

    render({ :template => "venue_templates/details" })
  end

  def create
    venue = Venue.new

    venue_address = params.fetch("query_address")
    venue_name = params.fetch("query_name")
    venue_neighborhood = params.fetch("query_neighborhood")


    venue.address = venue_address
    venue.name = venue_name
    venue.neighborhood = venue_neighborhood
    venue.save

    redirect_to("/venues/#{venue.id}")
  end
  
  def update
    the_id = params.fetch("the_id")

    venue = Venue.where({ :id => the_id }).first

    query_address = params.fetch("query_address")
    query_name = params.fetch("query_name")
    query_neighborhood = params.fetch("query_neighborhood")

    venue.address = query_address
    venue.name = query_name
    venue.neighborhood = query_neighborhood
    venue.save
    
    redirect_to("/venues/#{venue.id}")
  end

  def destroy
    the_id = params.fetch("id_to_delete")
    matching_venues = Venue.where({ :id => the_id })
    venue = matching_venues.first
    venue.destroy

    redirect_to("/venues")
  end

end
