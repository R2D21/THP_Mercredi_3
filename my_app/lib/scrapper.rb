# coding: utf-8
require "nokogiri"
require 'rubygems'
require 'nokogiri'
require 'open-uri'

class   Scrapper
  #@PAGE_URL => "http://annuaire-des-mairies.com"
  def   initialize(page_url, url)
    @page_url = url
    @url = url
    @list = {}
    @names = []
    @link = []
    @country = []
    @links = []
    @emails = []
  end

  def     get_uri(page_url)
    @links = []
    i = 0;
    page = Nokogiri::HTML(open(page_url))
    news_links = page.css("a").select{|link| link['href']}
    news_links.each do |link|
      @links[i] = link['href']
      i +=1;
    end
    return @links
  end

  def     get_uri_code(page_url)
    @links = []
    i = 0;
    page = Nokogiri::HTML(open(page_url))
    news_links = page.css("a").select{|link| link['title']}
    news_links.each do |link|
      @links[i] = link['title']
      i +=1;
    end
    return @links
  end

  def create_hash(country, code)
  my_hash = {}
  country.each_with_index do |elem, index|
    my_hash[elem] = code[index]
  end
  return my_hash
  end

  def     get_address(mairie)
    links = []
    i = 0;
    page = Nokogiri::HTML(open(page_url))
    news_links = page.css("a").select{|link| link['href']}
    news_links.each do |link|
      @links[i] = link['href']
      i +=1;
    end
    return @links
  end

  def     check_country(@links)
    i = 0;
    @links.each do |word|
      if word.include?("val-d-oise")
        return (i);
      end
      i +=1
    end
  end

  def     aff(array)

    array.each do |word|
      puts word
    end
  end

  def get_all_mails(@links)
    j = 0
    @emails = []
    @links.each do |link|
      @emails[j] = get_email(link)
      puts @emails[j]
      j +=1
    end
  end

  def get_email(url)

    page = Nokogiri::HTML(open(url))
    page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  end
end
def     perform()
  i = 0;
  j = 0;
    news_links = get_uri(@PAGE_URL)
    @link = @PAGE_URL + '/'
    tmp = []
    temp = ""
    @link += news_links[check_country(news_links)]
    get_uri(@link).each do |lin|
      tmp[i] = lin.split('.')[1]
      if tmp[i][0] == '/'
        temp = @PAGE_URL + tmp[i]
        @links[j] = temp
        j +=1
      end
      i +=1
    end
    list = create_hash(get_all_mails(links),links)
    i = 6
    tmp = parse_string(names)
    i = 0
    j = 0
    while i < tmp.size - 15
      names[j] = tmp[i]
      i +=1
      j +=1
    end
    my_hash = create_hash(links, get_all_mails(links))
    puts "#{my_hash}"
  end
end
