module AgendasHelper

  def open_agenda agenda
    year = agenda.date.strftime("%Y")
    month = agenda.date.strftime("%m")
    date = agenda.date.strftime("%d")
    "/agenda/#{year}/#{month}/#{date}/#{agenda.slug}"
  end

end
