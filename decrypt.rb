require './lib/enigma'

enigma = Enigma.new
encrypted_txt = File.open(ARGV[0], "r")
decrypted_txt = File.open(ARGV[1], "w")
inputed_key = ARGV[2]
inputed_date = ARGV[3]
run_decryption = enigma.decrypt(encrypted_txt.read.chomp, inputed_key, inputed_date)
run_decryption
decrypted_txt.write(run_decryption)
decrypted_txt.close
puts "Created #{ARGV[1]} with the key #{ARGV[2]} and the date #{ARGV[3]}"
