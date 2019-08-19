
require 'rubygems'
require "rushover"
require 'mechanize'

class Text

  attr :heading, :body, :article, :template

  def initialize
    @client = Rushover::Client.new('aootichmqhhqq6bc6sjt3tv4y7tx4t')

    page_base = 'https://wol.jw.org'

    date_to_fetch = Date.today.strftime("%Y/%m/%d")
    agent = Mechanize.new
    page = agent.get("#{page_base}/en/wol/dt/r1/lp-e/#{date_to_fetch}")

    @heading = page.search(".themeScrp").text
    @body = page.search(".sb").text.gsub(/<\/?[^>]+>/, '')
    @article = page.search('.sb a').map { |link| link['href'] }.last

  end

  def send(token)
    user = Rushover::User.new(token, @client)
    user.notify(body, :title => heading)
  end

end
