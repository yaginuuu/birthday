# coding: utf-8

require "timeout"
msg1 = 'まきしま先生！お誕生日おめでとう！'
msg2 = '25歳ですね。お誕生日おめでとう！'

def kill(cmd)
  pid = spawn(cmd, :pgroup => true)
  thr = Process.detach(pid)
  begin
    Timeout.timeout(4) do
      thr.join
    end
  rescue Timeout::Error
    puts "execution expired"
    Process.kill(:TERM, -pid)
  end
end

makishima, yudai = "sh ./sh/hoshi.sh", "sh ./sh/beer.sh"

kill(makishima)
kill(yudai)

system("say #{msg1}")
10.times do
  puts "\n"
end
puts "┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈☆☆☆☆☆☆☆☆☆┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
      ┈┈┈┈┈┈┈┈┈┈╭┻┻┻┻┻┻┻┻┻╮┈┈┈┈┈┈┈┈┈┈
      ┈┈┈┈┈┈┈┈┈┈┃╱╲╱╲╱╲╱╲╱┃┈┈┈┈┈┈┈┈┈┈
      ┈┈┈┈┈┈┈┈┈╭┻━━━━━━━━━┻╮┈┈┈┈┈┈┈┈┈
      ┈┈┈┈┈┈┈┈┈┃╱╲╱╲╱╲╱╲╱╲╱┃┈┈┈┈┈┈┈┈┈
      ┈┈┈┈┈┈┈┈┈┗━━━━━━━━━━━┛┈┈┈┈┈┈┈┈┈
      ┈┈┈┈┈┈┈┈HAPPY BIRTHDAY!┈┈┈┈┈┈┈┈
      ┈┈┈┈┈┈┈┈@makimaki => 25age!┈┈┈┈┈┈"
system("say #{msg2}")
