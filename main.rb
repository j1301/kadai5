# coding: utf-8
require 'dxruby'

require_relative 'player'
require_relative 'enemy'

Window.width  = 800
Window.height = 600
font = Font.new(32)
count = 0
get_count = 0
times = 0
stage = 1
time_limit = 200

player_img = Image.load("man.png")
player_img.setColorKey([0, 0, 0])

enemy_img = Image.load("very_important.png")
enemy_img.setColorKey([0, 0, 0])

clear_img = Image.load("graduate.png")
clear_img.setColorKey([0, 0, 0])

dead_img = Image.load("dead.png")
dead_img.setColorKey([0, 0, 0])

player = Player.new(400, 500, player_img)
enemies = []

Window.loop do
  if stage == 0
	Window.draw_font(280, 70, "卒業できました！", font)
	Window.draw(200, 100, clear_img)
	break if Input.keyPush?(K_ESCAPE)
  end

  if stage == 2
    Window.draw(200, 100, dead_img)
	break if Input.keyPush?(K_ESCAPE)
  end

  if stage == 1 
    break if Input.keyPush?(K_ESCAPE)

    if count < 35
	  if times % 50 == 0
		enemies << Enemy.new(rand(800), 20, enemy_img)
		count += 1
	  end
	end
	
	if time_limit == 0 && get_count > 25
	  stage = 0
	  times = 0
	end

    if time_limit == 0 && get_count <= 25
       	stage = 2
		times = 0
	end	
  
    Sprite.update(enemies)
    Sprite.draw(enemies)

    player.update
    player.draw

    # 当たり判定
    if Sprite.check(player, enemies)
      get_count += 1
    end	
    Window.draw_font(0, 0, "#{get_count}単位", font)
	if times % 9 == 0
	  time_limit -= 1
	end  
	Window.draw_font(500, 0, "卒業まで残り#{time_limit}日", font)
	times += 1
  end
end  