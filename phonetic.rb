# -*- coding: utf-8 -*-
framework 'AppKit'

class String
  NatoCode = %w(Alpha Bravo Charlie Delta Echo Foxtrot
                 Golf Hotel India Juliet Kilo Lima
                 Mike November Oscar Papa Quebec Romeo
                 Sierra Tango Uniform Victor Whiskey X-Ray 
                 Yankee Zulu)

  MusicianCode = ['Autechre', 'Battles', 'Captain Beefheart', 'Derrick May', 'Einstürzende Neubauten',
                  'Funkadelic', 'Grateful Dead', 'Happy Mondays', 'Iggy pop',
                  'Jimihen', 'King Crimson', 'Led Zeppelin', 'Marvin Gaye', 'New Order',
                  'Ornet Coleman', 'Perfume', 'Queen', 'Rage Against The Machine', 'Steely Dan',
                  'This Heat', 'Ultravox', 'Vanessa Paradis', 'Wishbone Ash',
                  'XTC', 'Yellow Magic Orchestra', 'Zack de la Rocha']

  PhoneticCodes = { :nato => NatoCode, :musician => MusicianCode }

  def to_phonetic_code(name=:nato)
    self.downcase.each_byte.map do |c| 
      PhoneticCodes[name][c - ?a.unpack('C')[0]] 
    end.join('. ')
  end

  def speech
    voice = NSSpeechSynthesizer.alloc.initWithVoice('com.apple.speech.synthesis.voice.Agnes')
    voice.startSpeakingString(self)
    self
  end
end
