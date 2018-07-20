---
source:
- title: WDI Dice Solution
  url: https://gist.github.com/kasun-maldeni/445474d2f05f2cbcccaef0ea77c7ff54
---

```ruby
# dice_core.rb
class Dice
  def Dice.roll(num=1)
    roll_vals = num.times.map do
      rand(1..6)
    end
    num == 1 ? roll_vals.first : roll_vals
  end
end

p "Dice roll once: #{Dice.roll}"
p "Dice roll three times: #{Dice.roll(3)}"
```

```ruby
# dice_extension_1_total.rb
class Dice
  def Dice.roll(num=1)
    roll_vals = num.times.map do
      rand(1..6)
    end
    num == 1 ? roll_vals.first : roll_vals
  end
end

p "Dice roll once: #{Dice.roll}"
p "Dice roll three times: #{Dice.roll(3)}"
```

```ruby
# dice_extension_2_display_faces.rb
class Dice
  def Dice.roll(num=1)
    @roll_vals = num.times.map do
      display_face(rand(1..6))
    end
    return Dice
  end

  def Dice.total
    [@roll_vals, @roll_vals.sum]
  end

  def Dice.display_face(rand_num)
    roof = '_' * 9 + "\n"
    floor = '-' * 9 + "\n"
    rows = 3.times.map do
      '|' + ' ' * 7 + '|' + "\n"
    end
    case rand_num
    when 1
      rows[1] = '|   *   |' + "\n"
    when 2
      rows[0] = '| *     |' + "\n"
      rows[2] = '|     * |' + "\n"
    when 3
      rows[0] = '| *     |' + "\n"
      rows[1] = '|   *   |' + "\n"
      rows[2] = '|     * |' + "\n"
    when 4
      rows[0] = '| *   * |' + "\n"
      rows[2] = '| *   * |' + "\n"
    when 5
      rows[0] = '| *   * |' + "\n"
      rows[1] = '|   *   |' + "\n"
      rows[2] = '| *   * |' + "\n"
    when 6
      rows[0] = '| * * * |' + "\n"
      rows[2] = '| * * * |' + "\n"
    end
    puts roof + rows.join + floor
    return rand_num
  end
end

p "Dice roll four times with total and faces: #{Dice.roll(4).total}"
```
