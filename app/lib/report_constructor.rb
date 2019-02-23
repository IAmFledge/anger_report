class ReportConstructor

  TITLE = "Daily Anger Report"
  MAX_CHARS = 280

  attr_accessor :topics

  def initialize(data)
    self.topics = data
  end

  def report
    text = "#{TITLE} \n" \
    "#{DateTime.now.strftime('%A, %e %B %Y')}\n" \
    "\n" \
    "Anger Index: #{rand(500..1300).to_f / 10}\n" \
    "\n" \
    "Anger levels rising in:\n"
    topics[0..3].each do |topic|
      text = text + "\- #{topic}\n" if topic.present?
    end
    text = text + "\n"
    text = text + "Anger levels falling in:\n"
    topics[4..topics.length].each do |topic|
      text = text + "\- #{topic}\n" if add?(topic, text)
    end
    text
  end

  private

  def add?(topic, text)
    return false unless topic.present?
    (text.length + topic.length) < MAX_CHARS
  end
end
