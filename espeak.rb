require 'espeak'

include ESpeak

for x in 0..10
	Speech.new(x.to_s, voice: 'uk').speak
end