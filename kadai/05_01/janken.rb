class Player
    def hand
      puts "0~2の数字を入力してください。"
      puts "0: グー"
      puts "1: チョキ"
      puts "2: パー"
      player_hand = gets
      return player_hand
    end
  end
  
  class Enemy
    def hand
      # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
      enemy_hand = rand(3)
      return enemy_hand
    end
  end
  
  class Janken
    def pon(player_hand, enemy_hand)
      # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
      # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
      # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
      pattern = ["グー","チョキ","パー"]
      unless (/^[0-2]+$/ =~ player_hand.to_s)
        player = Player.new
        enemy = Enemy.new
        janken = Janken.new
        janken.pon(player.hand, enemy.hand)
      else
        while true
          player_hand = player_hand.to_i
          result = (player_hand - enemy_hand + 3) %3
          if result == 0
            puts "あなたは#{pattern[player_hand]}で、相手は#{pattern[enemy_hand]}なので、あいこです"
            player = Player.new
            enemy = Enemy.new
            janken = Janken.new
            janken.pon(player.hand, enemy.hand)
            return true
          elsif result == 1
            puts "あなたは#{pattern[player_hand]}で、相手は#{pattern[enemy_hand]}なので、負けです"
            break
          elsif result == 2
            puts "あなたは#{pattern[player_hand]}で、相手は#{pattern[enemy_hand]}なので、勝ちです"
            break
          else
            puts "再勝負です。"
            player = Player.new
            enemy = Enemy.new
            janken = Janken.new
            janken.pon(player.hand, enemy.hand)
            return true
          end
        end
      end
    end
  end
  
  player = Player.new
  enemy = Enemy.new
  janken = Janken.new
  
  # 下記の記述で、ジャンケンメソッドが起動される
  janken.pon(player.hand, enemy.hand)
  
  
  
  ####### コードの意味 回答 #########
  # ① player = Player.newの記述の意味 = F
  # ② 大文字のPlayerと小文字のplayerの違い = F