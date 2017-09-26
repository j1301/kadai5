# coding: utf-8

class Player < Sprite
  def update
    self.x += Input.x
    self.y += Input.y
	if Input.keyDown?(K_SPACE)
	  self.x += Input.x * 2
      self.y += Input.y * 2
	end
    if 	self.x < 0
	  self.x = 0
	end  
	if 	self.x > 800 - 87
	  self.x = 800 - 87
	end
    if 	self.y < 0
	  self.y = 0
	end	
	if 	self.y > 600 - 122
	  self.y = 600 - 122
	end
  end
end