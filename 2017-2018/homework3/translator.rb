require 'yandex-translator'

class Translate
  attr_reader :translator

  def translate(text)
    translator.translate text, from: 'en'
  end

  def initialize
    api_key = ENV['MyKey']
    @translator = Yandex::Translator.new(api_key)
  end

end