require 'gosu'
require_relative 'snakeGame.rb'
require_relative 'func.rb'



class Screen < Gosu::Window
  def initialize(width = 640, height = 480)
    super width, height, fullscreen: false
    @x = width
    @y = height
    @font_text1 = Gosu::Font.new(64)
    @font_text2 = Gosu::Font.new(24)
    @green = '00ff00'
    @yellow = 'ffff00'
    @red = 'ff0000'
    @game_width = 1800
    @game_height = 840
    @fulsc = false
    @sit = nil
    @page = 1
    @scrselect = ls('inf.txt')[0].to_s
    @control = ls('inf.txt')[1].to_i
    @time_one = Time.now.to_f
    @time_two = Time.now.to_f
  end
  

  def update

    @mouse_x = mouse_x
    @mouse_y = mouse_y
    

    if @sit == 1
      @sit = nil
      if @control == 1
        @control = [Gosu::KB_W, Gosu::KB_S, Gosu::KB_A, Gosu::KB_D]
      elsif @control == 2
        @control = [Gosu::KB_UP, Gosu::KB_DOWN, Gosu::KB_LEFT, Gosu::KB_RIGHT]
      end
      SnakeGame.new(@game_width, @game_height, @fulsc, @control).show
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
      @font_text1.draw_markup("<c=00ff00>SNAKE GAME</c>", 130, 50, 1)
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
          @scrselect = '1'
          @fulsc = true
        end
      elsif @scrselect == '1'
        @font_text2.draw_markup("<c=#@red>FULLSCREEN</c>", 240, 100, 1)
      else
        @font_text2.draw_markup("<c=#@green>FULLSCREEN</c>", 240, 100, 1)
      end
      if rangeColor('1920x1080', 256, 150, @mouse_x, @mouse_y)
        @font_text2.draw_markup("<c=#@yellow>1920x1080</c>", 256, 150, 1)
        if clicked(Gosu::MS_LEFT)
          @scrselect = '2'
          @game_width = 1920
          @game_height = 1080
          @fulsc = false
        end
      elsif @scrselect == '2'
        @font_text2.draw_markup("<c=#@red>1920x1080</c>", 256, 150, 1)
      else
        @font_text2.draw_markup("<c=#@green>1920x1080</c>", 256, 150, 1)
      end
      if rangeColor('1680x1050', 256, 200, @mouse_x, @mouse_y)
        @font_text2.draw_markup("<c=#@yellow>1680x1050</c>", 256, 200, 1)
        if clicked(Gosu::MS_LEFT)
          @scrselect = '3'
          @game_width = 1680
          @game_height = 1050
          @fulsc = false
        end
      elsif @scrselect == '3'
        @font_text2.draw_markup("<c=#@red>1680x1050</c>", 256, 200, 1)
      else
        @font_text2.draw_markup("<c=#@green>1680x1050</c>", 256, 200, 1)
      end
      if rangeColor('1800x840', 261.5, 250, @mouse_x, @mouse_y)
        @font_text2.draw_markup("<c=#@yellow>1800x840</c>", 261.5, 250, 1)
        if clicked(Gosu::MS_LEFT)
          @scrselect = '4'
          @game_width = 1800
          @game_height = 840
          @fulsc = false
        end
      elsif @scrselect == '4'
        @font_text2.draw_markup("<c=#@red>1800x840</c>", 261.5, 250, 1)
      else
        @font_text2.draw_markup("<c=#@green>1800x840</c>", 261.5, 250, 1)
      end
      if rangeColor('1600x900', 261.5, 300, @mouse_x, @mouse_y)
        @font_text2.draw_markup("<c=#@yellow>1600x900</c>", 261.5, 300, 1)
        if clicked(Gosu::MS_LEFT)
          @scrselect = '5'
          @game_width = 1600
          @game_height = 900
          @fulsc = false
        end
      elsif @scrselect == '5'
        @font_text2.draw_markup("<c=#@red>1600x900</c>", 261.5, 300, 1)
      else
        @font_text2.draw_markup("<c=#@green>1600x900</c>", 261.5, 300, 1)
      end
      line = ls('inf.txt')
      if line[0].to_s != @scrselect
        newlist = line
        newlist[0] = @scrselect
        nv('inf.txt', newlist)
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
          @control = 1
        end
      elsif @control == 1
        @font_text2.draw_markup("<c=#@red>WASD</c>", 275, 100, 1)
      else
        @font_text2.draw_markup("<c=#@green>WASD</c>", 275, 100, 1)
      end

      if rangeColor('ARROWS', 260, 150, @mouse_x, @mouse_y)
        @time_two = Time.now.to_f
        @font_text2.draw_markup("<c=#@yellow>ARROWS</c>", 260, 150, 1)
        if clicked(Gosu::MS_LEFT) && @time_two - @time_one >= 0.5
          @control = 2
        end
      elsif @control == 2
        @font_text2.draw_markup("<c=#@red>ARROWS</c>", 260, 150, 1)
      else
        @font_text2.draw_markup("<c=#@green>ARROWS</c>", 260, 150, 1)
      end
      line = ls('inf.txt')
      if line[1].to_i != @control
        newlist = line
        newlist[1] = @control
        nv('inf.txt', newlist)
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


Screen.new.show

