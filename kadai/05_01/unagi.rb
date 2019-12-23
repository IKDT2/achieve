# 下記のコードが何をしているかを説明してください・・・（A）
seats_and_groups = gets.split(/\s/) 
#配列で[0:座席数, 1:来店グループ総数]が入っている
### 回答：８

# 下記のコードが何をしているかを説明してください・・・（B）
empty_seat = [*1..(seats_and_groups[0].to_i)]
#座席の数を変数に入れておきます 
### 回答：13

# 下記のコードが何をしているかを説明してください・・・（C）
seats_count = empty_seat.count
# 座席を配列で定義
### 回答：10

# 下記のコードが何をしているかを説明してください・・・（D）
number_of_visitors = seats_and_groups[1].to_i
### 回答：１１

# 下記のコードが何をしているかを説明してください・・・（E）
[*1..number_of_visitors].each do
### 回答：１５
    
  # 下記のコードが何をしているかを説明してください・・・（F）
  used_seats = gets.split(/\s/) #[グループ人数,着席開始番号]
### 回答：４

  # 下記のコードが何をしているかを説明してください・・・（G）
  users = used_seats[0].to_i
  #グループ人数を整数で代入
### 回答：6

  # 下記のコードが何をしているかを説明してください・・・（H）
  seating_number = used_seats[1].to_i
  #着席開始番号を整数で代入
### 回答：12

  # 下記のコードが何をしているかを説明してください・・・（I）
  fill_last_number = ((seating_number + users) - 1)
  # fillには、着席開始番号とグループの人数をたし、そこからマイナス１したものを代入
  # 離席開始番号
### 回答：9

  # 下記のコードが何をしているかを説明してください・・・（J）
  if fill_last_number > seats_count
### 回答：14
    # 下記のコードが何をしているかを説明してください・・・（K）
    # （下記のコードは理解が難しいので、下記にヒントを載せます）

    # 「今回のグループが最後に着席する席の番号」 = 「今回のグループが最後に着席する席の番号」-「そもそもの座席の総数」となる（円卓だから）。
    # 例えば、fill_last_number == 13で、seats_countが12だったら、1 = 13 - 12となり、席番号が１の席に最後の人間が座る。
    fill_last_number = fill_last_number - seats_count
    # 離席開始番号 - 座席番号
### 回答：2

    # （下記のコードは理解が難しいので、下記にヒントを載せます）

    # next_seat_candidateは、「その席に既に人が座っていないか？」を判断するための配列
    # ([*1..seats_count] - empty_seat)は、（「全ての席」-　「まだ人が座っていない席」）の意味。つまり、「既に人が座っている席」の数字が、([*1..seats_count] - empty_seat)
    # [*seating_number..seats_count]は、[*「今回のグループが最初に着席する席の番号」..「最後の席の番号」]の意味
    # [*1..fill_last_number]は、[*「１（最初の席）」..「今回のグループが最後に着席する席の番号」]の意味
    # なので、next_seat_candidate = ([*1..seats_count] - empty_seat) + [*seating_number..seats_count] + [*1..fill_last_number]は、
    # next_seat_candidate = 「既に人が座っている席」+ [*「今回のグループが最初に着席する席の番号」..「最後の席の番号」] + [*「１（最初の席）」..「今回のグループが最後に着席する席の番号」]となる。
    # つまり、 next_seat_candidateの配列の中に、同じ数字が含まれていれば、「既に埋まっている席に新たなグループの人間が座ろうとしている」ということになる
    next_seat_candidate = ([*1..seats_count] - empty_seat) + [*seating_number..seats_count] + [*1..fill_last_number]
  else
    # 下記のコードが何をしているかを説明してください・・・（L）
    # （下記のコードは理解が難しいので、下記にヒントを載せます）

    # next_seat_candidate = 「既に人が座っている席」+ [*「今回のグループが最初に着席する席の番号」..「今回のグループが最後に着席する席の番号」]となる
    # つまり、 next_seat_candidateの配列の中に、同じ数字が含まれていれば、「既に埋まっている席に新たなグループの人間が座ろうとしている」ということになる    
    next_seat_candidate = ([*1..seats_count] - empty_seat) + [*seating_number..fill_last_number]
### 回答：1
  end

  # 下記のコードが何をしているかを説明してください・・・（M）
  if next_seat_candidate.count == next_seat_candidate.uniq.count
### 回答：5

    # 下記のコードが何をしているかを説明してください・・・（N）
    if ((seating_number + users) - 1) > seats_count
### 回答：3

      # 下記の二行のコードが何をしているかを説明してください・・・（O）
      empty_seat = empty_seat - [*1..fill_last_number]
      empty_seat = empty_seat - [*seating_number..seats_count]
### 回答：17

    else
      # 下記のコードが何をしているかを説明してください・・・（P）
      empty_seat = empty_seat - [*seating_number..fill_last_number]
### 回答：7

    end
  end
end

# 下記のコードが何をしているかを説明してください・・・（Q）
puts seats_count - empty_seat.count
＜＝16

