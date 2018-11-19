require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters << ('a'..'z').to_a.sample
    end
    @letters
  end

  def score
   @letters = params[:letters].split
   if include? == true && english_word? == true
     @result = 'you win !'
   else
     @result = 'You lose !'
   end
 end

 private

 def include?
 @word = params[:word]
   if @word.chars.all? { |letter| @word.count(letter) <= @letters.to_a.count(letter) }
     return true
   else
     return false
   end
 end

 def english_word?
 response = open("https://wagon-dictionary.herokuapp.com/#{@word}")
 json = JSON.parse(response.read)
 return json['found']
 end

end

