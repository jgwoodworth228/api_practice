require 'open-uri'
require 'json'

class ApiController < ApplicationController

  # done in class
  def pirate_form
  end

  def pirate_process
    #=== Instructions ===================================
    # Translate the text submitted from the pirate_form action
    # into pirate-speak
    #
    # Ref: http://isithackday.com/arrpi.php?
    #================================================
    text = URI.encode(params[:text])
    url = "http://isithackday.com/arrpi.php?text=#{text}&format=json"
    result = open(url).read
    parsed_result = JSON.parse(result)
    @result = parsed_result['translation']['pirate']
  end

  #done as homework - jw
  def coord_form
    #=== Instructions ===================================
    # Create a form to send a user's address to the coord_process
    # action
    #================================================
  end

  def coord_process
    #=== Instructions ===================================
    # Using the Google geocoding API, find latitude and longitude
    # coordinates based on a user-submitted address. Send the
    # coordinates down to the view.
    #
    # Ref: https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA
    # as an example
    #================================================

    street_address = URI.encode(params[:street_address])
    city = URI.encode(params[:city])
    state = URI.encode(params[:state])
    zip_code = URI.encode(params[:zip_code])
    url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{street_address},#{city},#{state},#{zip_code}"
    result = open(url).read
    @parsed_result = JSON.parse(result)

    @lat = @parsed_result['results'][0]['geometry']['location']['lat']
    @lng = @parsed_result['results'][0]['geometry']['location']['lng']

  end

  # done as homework - jw
  def meme_gen_form
    #=== Instructions ===================================
    # Create a form to send a info to the meme_gen_process
    # action
    #
    # Ref: http://apimeme.com/
    #================================================
  end

  def meme_gen_process
    #=== Instructions ===================================
    # Create a meme based on user-submitted info
    #
    # Ref: http://apimeme.com/
    #================================================

    top_text = URI.encode(params[:top_text])
    bottom_text = URI.encode(params[:bottom_text])
    @page = "http://apimeme.com/meme?meme=Cool+Obama&top=#{top_text}&bottom=#{bottom_text}"
  end

# done as homework -jw
# a bit random as images have keyword to the types text only

  def congress_form
    #=== Instructions ===================================
    # Create a form to send a keyword to the congress_process
    # action
    #================================================
  end

  def congress_process
    #=== Instructions ===================================
    # Use the Library of Congress image API to display a relevant
    # picture based on a user-submitted keyword
    #
    # Ref: http://www.loc.gov/pictures/search/?q=computer&fo=json
    #================================================

    text = URI.encode(params[:text])
    url = "http://www.loc.gov/pictures/search/?q=#{text}&fo=json"
    result = open(url).read
    parsed_result = JSON.parse(result)
    @result = parsed_result['results'][0]['image']['full']

  end

  def random_user
    #=== Instructions ===================================
    # Use the Radom User API to create a dynamic profile page
    # that changes on page refresh. Use at least 3 items from
    # the API response
    #
    # Ref: http://api.randomuser.me/
    #================================================
  end

  def wiki_image_form
    #=== Instructions ===================================
    # Create a form to send a keyword to the wiki_image_process
    # action
    #================================================
  end

  def wiki_image_process
    #=== Instructions ===================================
    # Use the Wikipedia API to display a relevant
    # picture or set of pictures based on a user-submitted keyword
    #
    # Ref: http://techslides.com/grab-wikipedia-pictures-by-api-with-php
    #================================================



  end




# finished after watching in class -jw
  def nearest_station
    #=== Instructions ===================================
    # Use the Divvy API to display all stations that have at least
    # 5 bikes available
    #
    # Bonus: Sort the stations by distance from a user-submitted
    # address
    #
    # Ref: http://www.divvybikes.com/stations/json/
    #================================================

    result = open("http://www.divvybikes.com/stations/json/").read
    parsed_result = JSON.parse(result)
    @stations = []
    parsed_result['stationBeanList'].each do |stations_hash|
      if stations_hash['availableBikes'] >= 5
        @stations << "#{stations_hash['stationName']} - #{stations_hash['availableBikes']} bikes"
      end
    end
  end
end
