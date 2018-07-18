class Scrapper
  def   initialize
    url = Url.new(link)
    links = url.get_uri(link)
    emails = Email.new(links)
    mails = emails.get_all_mails(links)
  end
end
