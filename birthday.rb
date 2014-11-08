require "timeout"

hoshi = "sh hoshi.sh"
ryohei = "sh beer.sh"
msg = "say 'なかじー先生！お誕生日おめでとう！'"

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

kill(hoshi)
kill(ryohei)

system("say '25歳ですね'")
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
      ┈┈┈┈┈┈┈┈@7kajii => 25age!┈┈┈┈┈┈"

system(msg)
