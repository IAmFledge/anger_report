namespace :anger do
  task send: :environment do
    news_api = News.new(ENV['NEWS_API_KEY'])

    content = []
    news = news_api.get_top_headlines(language: 'en')
    news[0..10].each do |news_item|
      next if content.include? news_item.description
      content << news_item.description
    end

    topics = []

    content.each do |item|
      topics << RazorClient.new(ENV['RAZOR_API_KEY']).topic_for(item)
    end

    report = ReportConstructor.new(topics).report

    puts report
  end
end
