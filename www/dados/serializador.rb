
require 'open-uri'
require 'nokogiri'
require 'json'
open('sic.html') do |f|

  doc = Nokogiri::HTML(f)
  trs = doc.search('//tr')
  File.open("trs.html", 'w'){|f| f.write(trs)}
  chapters = []
  chapter = nil
  count = 0
  trs.each do |tr|
    td = tr.xpath('td')
    td = td.map { |td| td.content.gsub(/.*?;/, '').strip }    
    
    if td[0] == nil
      next
    end
    count = count +1
    puts "Serializando : #{td[0]} - #{td[1]} - #{td[2]}"
    chapters << chapter if chapter
    chapter = {
        'codigo'     => td[0],
        'descricao'       => td[1],
        'valor' => td[2] || ''
    }

  end

  chapters << chapter if chapter 
  file_to_open = "produtos.json"
  File.open(file_to_open, 'w') { |file| file.write(JSON.pretty_generate(chapters)) }

  puts "Total serializado #{count}"

  puts "Para visualizar o arquivo gerado, aperte R"
  r = gets.chomp
  if r.upcase  == "R"
    system %{cmd /c "start #{file_to_open}"}
  end

end
