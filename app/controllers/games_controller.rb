class GamesController < ApplicationController
  require 'open-uri'
  require 'json'
  def new
    @letters = ('a'..'z').to_a.shuffle[0,10]
  end

  def score
    @longWord = params[:word]
    @score = 0
      @result = JSON.parse(URI.open("https://wagon-dictionary.herokuapp.com/#{@longWord}").read)
      # response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
      # json = JSON.parse(response.read)
      @win = @result['found']
      @score = @result['length']
  end

  def good_letters?
    @letters.each { |letter| return false if !@longword.include? letter }
    return true
  end

end
