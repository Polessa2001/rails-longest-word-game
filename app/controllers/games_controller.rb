# frozen_string_literal: true

# Controller for the games
require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @word = params[:word]
    @included = included?(@word, params[:letters])
    @user_serialized = URI.open("https://wagon-dictionary.herokuapp.com/#{@word}").read
    @user = JSON.parse(@user_serialized)
    # raise
  end

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end
end
