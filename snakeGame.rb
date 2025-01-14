require 'gosu'

class SnakeGame < Gosu::Window
  def initialize(width, height, fullscr, ctrl)
    super width, height, fullscreen: fullscr
    self.caption = "Snake Game"
    @direc = nil
    @speed = 10
    @radius = 20
    @x = 50 + (rand(((width - 250) - 5) / @speed ).to_i * @speed)
    @y = 50 + (rand(((height - 100) - 5) / @speed ).to_i * @speed)
    @apple_x = rand(50..width - 50)
    @apple_y = rand(50..height - 50)
    @wallUP = [0, 0, width + 120, 20]
    @wallDOWN = [0, height - 20, width + 120, 20]
    @wallLEFT = [0, 0, 20, height + 160]
    @wallRIGHT = [width - 20, 0, 20, height + 160]
    self.update_interval = 100 - ((Rational((100 / (18 * 8.4))).to_f * ((width * height) / 10000).to_f).round - 100)                   
    @list_pos ||= []
    @list_size = 0
    @contr = ctrl
  end

  def close
    exit
  end



  def update


    if @x >= @apple_x - @radius && @x <= @apple_x + @radius && @y >= @apple_y - @radius && @y <= @apple_y + @radius
      res_x = true
      res_y = true
      @apple_x = rand(50..width - 50)
      @apple_y = rand(50..height - 50)
      while res_x == true && res_y == true
        res_x = @list_pos.any? { |i| i[0] == @apple_x }
        res_y = @list_pos.any? { |i| i[1] == @apple_y }
        if res_x == true
          @apple_x = rand(50..width - 50)
        end
        if res_y == true
          @apple_y = rand(50..height - 50)
        end
      end
      @list_size += 1
    end


    @list_pos.unshift([@x, @y])
    while @list_pos.size > @list_size
      @list_pos.delete_at(-1)
    end




    if Gosu.button_down? @contr[0] and @direc != "down"
      @direc = "up"
    elsif Gosu.button_down? @contr[1] and @direc != "up"
      @direc = "down"
    elsif Gosu.button_down? @contr[2] and @direc != "right"
      @direc = "left"
    elsif Gosu.button_down? @contr[3] and @direc != "left"
      @direc = "right"
    end
  

    if @direc == "up"
      @y -= @speed
      if @y - 10 <= @wallUP[1] 
        close
      end
    elsif @direc == "down"
      @y += @speed
      if @y + 10 >= @wallDOWN[1]
        close
      end
    elsif @direc == "left"
      @x -= @speed
      if @x - 10 <= @wallLEFT[0]
        close
      end
    elsif @direc == "right"
      @x += @speed
      if @x + 10 >= @wallRIGHT[0]
        close
      end
    end


    if @list_pos != []
      for i in @list_pos
        if @x >= i[0] - @speed / 2 && @x <= i[0] + @speed / 2 && @y >= i[1] - @speed / 2 && @y <= i[1] + @speed / 2
          close
        end
      end
    end

  end


  def draw
    self.caption = "SnakeGame -- Score: #{@list_size} - Level: 1"
    @wUP = Gosu.draw_rect(@wallUP[0], @wallUP[1], @wallUP[2], @wallUP[3], Gosu::Color::YELLOW)
    @wDOWN = Gosu.draw_rect(@wallDOWN[0], @wallDOWN[1], @wallDOWN[2], @wallDOWN[3], Gosu::Color::YELLOW)
    @wLEFT = Gosu.draw_rect(@wallLEFT[0], @wallLEFT[1], @wallLEFT[2], @wallLEFT[3], Gosu::Color::YELLOW)
    @wRIGHT = Gosu.draw_rect(@wallRIGHT[0], @wallRIGHT[1], @wallRIGHT[2], @wallRIGHT[3], Gosu::Color::YELLOW)
    @apple = Gosu.draw_rect(@apple_x, @apple_y, @radius, @radius, Gosu::Color::RED)
    @snake = Gosu.draw_rect(@x, @y, @radius, @radius, Gosu::Color::GREEN)
    for i in 0...@list_size
      Gosu.draw_rect(@list_pos[i][0], @list_pos[i][1], @radius, @radius, Gosu::Color::GREEN)
    end
  end
end





















