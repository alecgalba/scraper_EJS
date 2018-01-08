class EjsController < ApplicationController

  def get_content
    require 'open-uri'
    doc = Nokogiri::HTML(open('http://eloquentjavascript.net/05_higher_order.html'))

    @h1 = doc.css('h1').text #string

    h2s = doc.css('h2').text
    @formatted_h2s = h2s.split(/(?<!\s)(?=[A-Z])/) #array


    h3s = doc.css('h3').text
    @formatted_h3s = h3s.split(/(?<!\s)(?=[A-Z])/) #array

    links = doc.css('a[href]')
    @all_links = links.map {|element| element["href"]}

    render template: 'ejs/home'
  end


end
