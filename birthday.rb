# coding: utf-8

require "timeout"

makishima = "sh makishima.sh"
yudai = "sh beer.sh"
msg = "say 'まきしま先生！お誕生日おめでとう！'"

def kill(cmd)
  pid = spawn(cmd, :pgroup => true)  # :pgroup => trueを追加
  thr = Process.detach(pid)
  begin
    Timeout.timeout(4) do
      thr.join
    end
  rescue Timeout::Error
    puts "execution expired"
    Process.kill(:TERM, -pid)        # -pidに変更
  end
end

kill(makishima)
kill(yudai)

system("say '25歳ですね。お誕生日おめでとう！'")
puts "\n"
puts "\n"
puts "\n"
puts "\n"
puts "\n"
puts "\n"
puts "\n"
puts "┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈☆☆☆☆☆☆☆☆☆┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈
      ┈┈┈┈┈┈┈┈┈┈╭┻┻┻┻┻┻┻┻┻╮┈┈┈┈┈┈┈┈┈┈
      ┈┈┈┈┈┈┈┈┈┈┃╱╲╱╲╱╲╱╲╱┃┈┈┈┈┈┈┈┈┈┈
      ┈┈┈┈┈┈┈┈┈╭┻━━━━━━━━━┻╮┈┈┈┈┈┈┈┈┈
      ┈┈┈┈┈┈┈┈┈┃╱╲╱╲╱╲╱╲╱╲╱┃┈┈┈┈┈┈┈┈┈
      ┈┈┈┈┈┈┈┈┈┗━━━━━━━━━━━┛┈┈┈┈┈┈┈┈┈
      ┈┈┈┈┈┈┈┈HAPPY BIRTHDAY!┈┈┈┈┈┈┈┈
      ┈┈┈┈┈┈┈┈@makimaki => 25age!┈┈┈┈┈┈"

system(msg)
