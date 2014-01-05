class Review < ActiveRecord::Base
  def excerpt(words=20)
    textwords = text.split(/ +/)
    exc = textwords[0, words].join(" ")
    if textwords.length > words
      exc << "..."
    end
    exc
  end
end
