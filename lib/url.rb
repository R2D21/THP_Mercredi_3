class Url
  def   initialize

  end
  def     get_uri(page_url)
  links = []
  i = 0;
  page = Nokogiri::HTML(open(page_url))
  news_links = page.css("a").select{|link| link['href']}
  news_links.each do |link|
    links[i] = link['href']
    i +=1;
  end
  return links
end

def     get_uri_code(page_url)
  links = []
  i = 0;
  page = Nokogiri::HTML(open(page_url))
  news_links = page.css("a").select{|link| link['title']}
  news_links.each do |link|
    links[i] = link['title']
    i +=1;
  end
  return links
end

end
