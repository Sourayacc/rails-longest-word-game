class GamesController < ApplicationController
  require 'open-uri'
  require 'json'
  def new
    @letters = ('a'..'z').to_a.shuffle[0,10]
  end

  def score
    longWord = params[:word]
    # fetch(`https://wagon-dictionary.herokuapp.com/#{longWord}`)
    #        .then(response => response.json())
    #        .then(data =>
    #          if data.found
    #            @win = true
    #          else
    #            @win = false
    #          end
    #        )

    @win = JSON.parse(URI.open("https://wagon-dictionary.herokuapp.com/#{longWord}").read)
    # response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    # json = JSON.parse(response.read)
  end
end
