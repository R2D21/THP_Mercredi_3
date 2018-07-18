# coding: utf-8
require "nokogiri"
require "open-uri"

class   Deputes
  #"http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"
  # "http://www2.assemblee-nationale.fr"
  def   initialize(url)
    @page_url = page_url
      @url = url
  end

  def     deputes_names()
    links = []
    i = 0;
    j = 0
    page = Nokogiri::HTML(open(@page_url))
    news_links = page.css("ul[class=col3]").css("li").css("a")
    news_links.each do |link|
      links[i] = link.text
      i +=1;
    end
    return links
  end

  def     deputes_url()
    links = []
    i = 0;
    j = 0
    page = Nokogiri::HTML(open(@page_url))
    news_links = page.css("ul[class=col3]").css("li").css("a").select{|link| link['href']}
    news_links.each do |link|
      links[i] =  @url + link['href']
      i +=1;
    end
    return   links
  end

  def     get_email(url)
    email = []
    page = Nokogiri::HTML(open(url))
    page.css('a[@href ^="mailto:"]').each do |element|
    email << element["href"]
    email[0][0..6] = ''
    break
    end
    return email
  end

  def     create_array_hash(first_name,last_name,emails)
    array = []
    my_hash = {}
    i = 0;
    while i < first_name.size
      my_hash = {:first_name => first_name[i],:last_name => last_name[i],:email => emails[i]}
      array.push(my_hash);
      i +=1
    end
    return array
  end
end
perform
