require 'gosu'
require_relative 'func.rb'
require_relative 'inf.rb'



class Screen < Gosu::Window
  def initialize(width = 640, height = 480)
    super width, height, fullscreen: false
    self.caption = "SnakeGame"
    @x = width
    @y = height
    @font_text1 = Gosu::Font.new(64)
    @font_text2 = Gosu::Font.new(24)
    @green = '00ff00'
    @yellow = 'ffff00'
    @red = 'ff0000'
    @game_width = $parm[0]
    @game_height = $parm[1]
    @fulsc = $parm[2]
    @control = $parm[3]
    @level = $parm[4]
    @sit = nil
    @page = 1
    @time_one = Time.now.to_f
    @time_two = Time.now.to_f
  end
  
    


  def update

    @mouse_x = mouse_x
    @mouse_y = mouse_y

    

    if @sit == 1
      @sit = nil
      SnakeGame.new(@game_width, @game_height, @fulsc, @control, @level).show
    end


    def clicked(click)
      if Gosu.button_down? click
        return true
      else
        return false
      end
    end


    def rangeColor(text, dist_x, dist_y, m_x, m_y)
      siz = text.size
      larg = 13.625 * siz
      if dist_x + larg >= m_x && dist_x - 1 <= m_x && dist_y + 20 >= m_y && dist_y - 5 <= m_y
        return true
      else
        return false
      end
    end



    def screenOne()
      @font_text1.draw_markup("<c=#@green>SNAKE GAME</c>", 130, 50, 1)

      if rangeColor('PLAY', 280, 150, @mouse_x, @mouse_y)
        @font_text2.draw_markup("<c=#@yellow>PLAY</c>", 280, 150, 1)
        if clicked(Gosu::MS_LEFT)
          @sit = 1
        end
      else
        @font_text2.draw_markup("<c=#@green>PLAY</c>", 280, 150, 1)
      end
      if rangeColor('SETTINGS', 254, 200, @mouse_x, @mouse_y)
        @font_text2.draw_markup("<c=#@yellow>SETTINGS</c>", 254, 200, 1)
        if clicked(Gosu::MS_LEFT)
          @page = 2
        end
      else
        @font_text2.draw_markup("<c=#@green>SETTINGS</c>", 254, 200, 1)
      end
    end


    def screenTwo()
      if rangeColor('EXIT', 1, 1, @mouse_x, @mouse_y)
        @time_one = Time.now.to_f
        @font_text2.draw_markup("<c=#@yellow>EXIT</c>", 1, 1, 1)
        if clicked(Gosu::MS_LEFT) && @time_one - @time_two >= 0.5
          @page = 1
        end
      else
        @font_text2.draw_markup("<c=#@green>EXIT</c>", 1, 1, 1)
      end
      if rangeColor('SCREEN SIZE', 237.5, 100, @mouse_x, @mouse_y)
        @font_text2.draw_markup("<c=#@yellow>SCREEN SIZE</c>", 237.5, 100, 1)
        if Gosu.button_down? Gosu::MS_LEFT
          @time_one = Time.now.to_f
          @page = 3
        end
      else
        @font_text2.draw_markup("<c=#@green>SCREEN SIZE</c>", 237.5, 100, 1)
      end
      if rangeColor('CONTROL', 255, 150, @mouse_x, @mouse_y)
        @font_text2.draw_markup("<c=#@yellow>CONTROL</c>", 255, 150, 1)
        if clicked(Gosu::MS_LEFT)
          @time_one = Time.now.to_f
          @page = 4
        end
      else
        @font_text2.draw_markup("<c=#@green>CONTROL</c>", 255, 150, 1)
      end
    end

    
    def screenThree()
      if rangeColor('EXIT', 1, 1, @mouse_x, @mouse_y)
        @font_text2.draw_markup("<c=#@yellow>EXIT</c>", 1, 1, 1)
        if clicked(Gosu::MS_LEFT)
          @time_two = Time.now.to_f
          @page = 2
        end
      else
        @font_text2.draw_markup("<c=#@green>EXIT</c>", 1, 1, 1)
      end
      if rangeColor('FULLSCREEN', 240, 100, @mouse_x, @mouse_y)
        @time_two = Time.now.to_f
        @font_text2.draw_markup("<c=#@yellow>FULLSCREEN</c>", 240, 100, 1)
        if clicked(Gosu::MS_LEFT) && @time_two - @time_one >= 0.5
          @fulsc = true
          @game_width = Gosu.screen_width
          @game_height = Gosu.screen_height
        end
      elsif @fulsc == true
        @font_text2.draw_markup("<c=#@red>FULLSCREEN</c>", 240, 100, 1)
      else
        @font_text2.draw_markup("<c=#@green>FULLSCREEN</c>", 240, 100, 1)
      end
      if rangeColor('1950x1100', 256, 150, @mouse_x, @mouse_y)
        @font_text2.draw_markup("<c=#@yellow>1950x1100</c>", 256, 150, 1)
        if clicked(Gosu::MS_LEFT)
          @game_width = 1950
          @game_height = 1100
          @fulsc = false
        end
      elsif @game_width == 1950 && @game_height == 1100
        @font_text2.draw_markup("<c=#@red>1950x1100</c>", 256, 150, 1)
      else
        @font_text2.draw_markup("<c=#@green>1950x1100</c>", 256, 150, 1)
      end
      if rangeColor('1700x1050', 256, 200, @mouse_x, @mouse_y)
        @font_text2.draw_markup("<c=#@yellow>1700x1050</c>", 256, 200, 1)
        if clicked(Gosu::MS_LEFT)
          @game_width = 1700
          @game_height = 1050
          @fulsc = false
        end
      elsif @game_width == 1700 && @game_height == 1050
        @font_text2.draw_markup("<c=#@red>1700x1050</c>", 256, 200, 1)
      else
        @font_text2.draw_markup("<c=#@green>1700x1050</c>", 256, 200, 1)
      end
      if rangeColor('1800x850', 261.5, 250, @mouse_x, @mouse_y)
        @font_text2.draw_markup("<c=#@yellow>1800x850</c>", 261.5, 250, 1)
        if clicked(Gosu::MS_LEFT)
          @game_width = 1800
          @game_height = 850
          @fulsc = false
        end
      elsif @game_width == 1800 && @game_height == 850
        @font_text2.draw_markup("<c=#@red>1800x850</c>", 261.5, 250, 1)
      else
        @font_text2.draw_markup("<c=#@green>1800x850</c>", 261.5, 250, 1)
      end
      if rangeColor('1600x900', 261.5, 300, @mouse_x, @mouse_y)
        @font_text2.draw_markup("<c=#@yellow>1600x900</c>", 261.5, 300, 1)
        if clicked(Gosu::MS_LEFT)
          @game_width = 1600
          @game_height = 900
          @fulsc = false
        end
      elsif @game_width == 1600 && @game_height == 900
        @font_text2.draw_markup("<c=#@red>1600x900</c>", 261.5, 300, 1)
      else
        @font_text2.draw_markup("<c=#@green>1600x900</c>", 261.5, 300, 1)
      end
      if $parm != [$game_width, $game_height, $fulsc, $control, $level]
        line = ls('inf.rb')
        newlist = line
        newlist[0] = "$parm = #{[@game_width, @game_height, @fulsc, @control, @level]}"
        nv('inf.rb', newlist)
      end
    end

    
    def screenFour()
      if rangeColor('EXIT', 1, 1, @mouse_x, @mouse_y)
        @font_text2.draw_markup("<c=#@yellow>EXIT</c>", 1, 1, 1)
        if clicked(Gosu::MS_LEFT)
          @time_two = Time.now.to_f
          @page = 2
        end
      else
        @font_text2.draw_markup("<c=#@green>EXIT</c>", 1, 1, 1)
      end

      if rangeColor('WASD', 275, 100, @mouse_x, @mouse_y)
        @font_text2.draw_markup("<c=#@yellow>WASD</c>", 275, 100, 1)
        if clicked(Gosu::MS_LEFT)
          @control = [Gosu::KB_W, Gosu::KB_S, Gosu::KB_A, Gosu::KB_D]
        end
      elsif @control == [Gosu::KB_W, Gosu::KB_S, Gosu::KB_A, Gosu::KB_D]
        @font_text2.draw_markup("<c=#@red>WASD</c>", 275, 100, 1)
      else
        @font_text2.draw_markup("<c=#@green>WASD</c>", 275, 100, 1)
      end

      if rangeColor('ARROWS', 260, 150, @mouse_x, @mouse_y)
        @time_two = Time.now.to_f
        @font_text2.draw_markup("<c=#@yellow>ARROWS</c>", 260, 150, 1)
        if clicked(Gosu::MS_LEFT) && @time_two - @time_one >= 0.5
          @control = [Gosu::KB_UP, Gosu::KB_DOWN, Gosu::KB_LEFT, Gosu::KB_RIGHT]
        end
      elsif @control == [Gosu::KB_UP, Gosu::KB_DOWN, Gosu::KB_LEFT, Gosu::KB_RIGHT]
        @font_text2.draw_markup("<c=#@red>ARROWS</c>", 260, 150, 1)
      else
        @font_text2.draw_markup("<c=#@green>ARROWS</c>", 260, 150, 1)
      end
      if $parm != [$game_width, $game_height, $fulsc, $control, $level]
        line = ls('inf.rb')
        newlist = line
        newlist[0] = "$parm = #{[@game_width, @game_height, @fulsc, @control, @level]}"
        nv('inf.rb', newlist)
      end
    end

  end
  
  def draw
    
    if @page == 1
      screenOne()

    elsif @page == 2
      screenTwo()
    
    elsif @page == 3
      screenThree()

    elsif @page == 4
      screenFour()
    end
      
  end
end











class SnakeGame < Gosu::Window
  
  def initialize(width, height, fullscr, ctrl, lvl)
    super width, height, fullscreen: fullscr
    self.caption = "SnakeGame -- Score: 0 - Level: #@level"
    @direc = nil
    @speed = 25
    if fullscr == true && Gosu.screen_width % @speed != 0 && Gosu.screen_height % @speed != 0
      while Gosu.screen_width % @speed != 0 && Gosu.screen_height % @speed != 0
        @speed -= 1
      end
    end
    @radius = 20
    @x = 50 + (rand(((width - 250) - 5) / @speed ).to_i * @speed)
    @y = 50 + (rand(((height - 100) - 5) / @speed ).to_i * @speed)
    @apple_x = rand(50..width - 50)
    @apple_y = rand(50..height - 50)
    @wallUP = [0, 0, width + 120, 20]
    @wallDOWN = [0, height - 20, width + 120, 20]
    @wallLEFT = [0, 0, 20, height + 160]
    @wallRIGHT = [width - 20, 0, 20, height + 160]
    @level = lvl
    @limit = (((width / @speed) * (height / @speed)) / @radius).to_i
    if lvl == 1
      lvl = 0
    else
      lvl = lvl * 10
    end
    self.update_interval = (160 - ((Rational((160 / (18 * 8.4))).to_f * ((width * height) / 10000).to_f).round - 160)) - lvl              
    @list_pos ||= []
    @list_size = 0
    @contr = ctrl
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


    if @list_size > @limit && @level + 1 != $parm[4] && @level < 3
      newparm = $parm
      newparm[4] += 1
      newlist = "$parm = #{newparm}" 
      nv('inf.rb', newlist)
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
    elsif @direc == "down"
      @y += @speed
    elsif @direc == "left"
      @x -= @speed
    elsif @direc == "right"
      @x += @speed
    end
    if @y - @speed < @wallUP[1] || @y + @speed > @wallDOWN[1] || @x - @speed < @wallLEFT[0] || @x + @speed > @wallRIGHT[0]
      Screen.new.show
    end


    if @list_pos != []
      for i in @list_pos
        if @x >= i[0] - @speed / 2 && @x <= i[0] + @speed / 2 && @y >= i[1] - @speed / 2 && @y <= i[1] + @speed / 2
          Screen.new.show
        end
      end
    end

  end


  def draw
    self.caption = "SnakeGame -- Score: #{@list_size} - Level: #@level - goal: #@limit"
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





Screen.new.show