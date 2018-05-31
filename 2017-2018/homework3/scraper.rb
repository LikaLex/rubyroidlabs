require 'mechanize'
require 'json'

class Scraper

  def initialize
    @coming_out = {}
  end

  def information
    agent = Mechanize.new
    parser(agent.get('http://www.newnownext.com/national-coming-out-day-12-celebrities-who-came-out-in-the-past-12-months/10/2015/'))
    parser(agent.get('http://www.newnownext.com/gay-celebrities-coming-out-2016/10/2016/'))
    parser(agent.get('http://www.newnownext.com/gay-celebrities-coming-out-2017/10/2017/'))

    save_info('list.json')
  end

  def save_info(file_name)
    File.open(file_name, 'w') do |file|
      file.write @coming_out.to_json
    end
  end

  def parser(page)
    review_links = page.search('.listicle-container')
    review_links.each do |l|
      p = l.search('li')
      p.each do |link|
        actors = link.search('.heading-container')
        info = link.search('.description-container')
        actor_name = actors.text.delete! "\n\t\t\t\t\t", "\n\t\t\t\t"
        actor_name.upcase!
        actor_info = info.text.delete! "\n\t\t\t\t\t", "\n\t\t\t\t"
        @coming_out[actor_name] = actor_info
      end
    end
  end

end