require './lib/enigma'

enigma = Enigma.new
original = File.open(ARGV[0], "r")
encrypted = File.open(ARGV[1], "w")
run_encryption = enigma.encrypt(original.read.chomp, '', '')
run_encryption
encrypted.write(run_encryption)
encrypted.close
puts "Created #{ARGV[1]} with the key #{enigma.offsets.key.join} and the date #{enigma.offsets.date.to_s}"
