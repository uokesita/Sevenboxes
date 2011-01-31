desc "cron job"
task :cron => :environment do

  require 'open-uri'
  require 'sanitize'

  puts '-----------------'
  puts 'ADOBE EVENTS'

  doc = open("http://rss.adobe.com/en/events.rss") { |f| Hpricot.XML(f) }
  
  doc.search("//item").reverse.each do |item|
    adobe_id        = item.search("//eventid").inner_html
    link            = Sanitize.clean( item.search("//link").inner_html )
    title           = item.search("//title").inner_text
    description     = Sanitize.clean( item.search("//description").inner_text  )
    startDate       = Time.parse( item.search("//startDate").inner_html )

    if startDate > Time.now
      Event.find_or_create_by_adobe_id( :title => title, :description => description, :link => link, :date => startDate, :adobe_id => adobe_id, :user_id => 1 )
    end
  end

  puts '-----------------'
  puts 'OREILLY EVENTS'

  doc = open("http://feeds.oreilly.com/oreilly/events?format=xml") { |f| Hpricot.XML(f) }
  
  doc.search("//entry").each do |item|
    oreilly_id      = item.search("//id").inner_html.split("#").last
    title           = item.search("//title").inner_html.split("-").first
    link            = item.search("//link").attr('href')
    description     = Sanitize.clean( item.search("//summary").inner_text )

    date_pre        = item.search("//title").inner_html.split(" ") 
        year        = date_pre[-1]
        day         = date_pre[-2].split("-").first
        month       = date_pre[-3]
    startDate       = Time.parse("#{year} #{month} #{day}")

    if startDate > Time.now
      Event.find_or_create_by_oreilly_id( :title => title, :description => description, :link => link, :date => startDate, :oreilly_id => oreilly_id, :user_id => 1 )
    end
  end

end   
