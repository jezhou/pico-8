pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- tutorial
-- by jezhou

function _init()
  game_over=false
  make_player()
  make_cave()
end

function _update()
  if (not game_over) then
    move_player()
    update_cave()
    check_hit()
  end
end

function _draw()
  cls()
  draw_player()
  draw_cave()
end

function move_player()
  gravity=0.2
  player.dy+=gravity
  
  if(btnp(2)) then
    player.dy-=5
  end
  
  player.y +=player.dy
end
-->8
function make_player()
player={}
player.x=24 --position
player.y=60
player.dy=0 --fall speed
player.rise=1 --sprites
player.fall=2
player.dead=3
player.speed=2 --fly speed
player.score=0
end

function draw_player()
if (game_over) then
spr(player.dead,player.x,player.y)
elseif (player.dy<0) then
spr(player.rise,player.x,player.y)
else
spr(player.fall,player.x,player.y)
end
end

function check_hit()
for i=player.x,player.x+7 do
if (cave[i+1].top>player.y
or cave[i+1].btm<player.y+7) then
game_over=true
end
end
end
-->8
function make_cave()
cave={{["top"]=5,["btm"]=119}}
top=45 --how low can the ceiling go?
btm=85 --how high can the floor get?
end
function update_cave()
--remove the back of the cave
if (#cave>player.speed) then
for i=1,player.speed do
del(cave,cave[1])
end
end
--add more cave
while (#cave<128) do
local col={}
local up=flr(rnd(7)-3)
local dwn=flr(rnd(7)-3)
col.top=mid(3,cave[#cave].top+up,top)
col.btm=mid(btm,cave[#cave].btm+dwn,124)
add(cave,col)
end
end
function draw_cave()
top_color=5 --play with these!
btm_color=5 --choose your own colors!
for i=1,#cave do
line(i-1,0,i-1,cave[i].top,top_color)
line(i-1,127,i-1,cave[i].btm,btm_color)
end
end
__gfx__
0000000000aaaa0000aaaa0000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000aaaaaa00aaaaaa008888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700aa0aa0aaaa0aa0aa88988988000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000aaaaaaaaaaaaaaaa88888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000aaaaaaaaaaaaaaaa88888888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700aa0000aaaa0000aa88899888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000aaaaaa00aa00aa008988980000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000aaaa0000aaaa0000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555505555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55550555005555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55550050000005555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55500050000005555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55500000000005555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55000000000000555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
50000000000000555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000000000005555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000000000005555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000000000005555055555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000000000000550005555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000000000000500005555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000000000000000000555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000000000000000000050555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000000000000000000050555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000000000000000000050555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000000000000000000000055555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000000000000000000000055555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000000000000000000000005555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000000000000000000000005555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000000000000000000000005555555555555555555555555555555555555555555555555555555555555555555555555555055555555555555555555555
00000000000000000000000000000555555555555555555555555555555555555555555555555555555555555555555555555555055555555555555555555555
00000000000000000000000000000555555555555555555555555555555555555555555555555555555555555555555555555505005555555555555555550555
00000000000000000000000000000055555555555555555555555555555555555555555555555555555555555555555555555500000555555555550555050000
00000000000000000000000000000055555555555555555555555555555555555555555555555555555555555555555555555500000555555550550055000000
00000000000000000000000000000005555555555555555555555555555555555555555555555555055555555555555555555000000005555500000050000000
00000000000000000000000000000005555555555555550555555555555555555555555555555555055505555505555555555000000005550500000000000000
00000000000000000000000000000005555555555555550555550555555555555555555555555555055505555500505555550000000005500500000000000000
00000000000000000000000000000000555555555555500550550555555555555555555555555500005505555000505555500000000000500000000000000000
00000000000000000000000000000000555555555555500050000555555555555555555555555500000000550000000505500000000000500000000000000000
00000000000000000000000000000000550555555555000050000050055555555555555555555500000000050000000000500000000000000000000000000000
00000000000000000000000000000000050055555500000000000050055555555555555555505000000000050000000000000000000000000000000000000000
00000000000000000000000000000000000055550000000000000050005555555000555555505000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000550000000000000000000555555000555555500000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000550000000000000000000555550000555550000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000550050000055550000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000050050000005550000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000aaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000aaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000aa0aa0aa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000aaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000aaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000aa0000aa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000aa00aa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000aaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000055505550000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000055505550000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000005555555555000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000055555555555000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000050005050055555555555000000500000000000000000000000000000000000000000000000000000000050
00000000000000000000000000000000000000000050055050055555555555500000500000000000000000000000000000000000000000000000000000000050
00000000000000000000000000000000000000000550055550555555555555505000555000000000000000000000000000000000000000000000000000000555
00000000000000000000000000000000000000005555555555555555555555505005555000000000000000000000000000000000000000000000000000000555
00000000000000000000000000000000000000005555555555555555555555555055555500000000000000000000000000000000000000000000000000000555
00000000000000000000000000000000000000055555555555555555555555555555555550005000000000000000000000000000000000000000000000005555
00000000000000000000000000000000000000055555555555555555555555555555555550055050000000000000000000000000000000000000005000555555
00000000000000000000000000000000000000555555555555555555555555555555555555555550000000000000000000000000000000000000005055555555
00000000000000000000000000000000000000555555555555555555555555555555555555555555500000000000000000000000055000000000055555555555
00000000000000000000000000000000000050555555555555555555555555555555555555555555505000000000000000000000555000000005555555555555
00000000000000000000000000000000000555555555555555555555555555555555555555555555505000000000000000000505555000000005555555555555
00000000000000000000000000000000005555555555555555555555555555555555555555555555555500000000000000000505555500000505555555555555
00000000000000000000000000000000005555555555555555555555555555555555555555555555555550000000000000005555555550005555555555555555
00000000000000000000005000000000055555555555555555555555555555555555555555555555555550000000000000005555555555055555555555555555
00000000000000000000005500000000555555555555555555555555555555555555555555555555555550500000000000005555555555055555555555555555
00000000000000000000055500000000555555555555555555555555555555555555555555555555555555500000000000055555555555055555555555555555
00000000000000000000555550505000555555555555555555555555555555555555555555555555555555550000000000055555555555555555555555555555
00000000000000000000555550555555555555555555555555555555555555555555555555555555555555550000000000555555555555555555555555555555
00000000000000550005555550555555555555555555555555555555555555555555555555555555555555555500000005555555555555555555555555555555
00000000000000550055555555555555555555555555555555555555555555555555555555555555555555555505000005555555555555555555555555555555
00000000000000555055555555555555555555555555555555555555555555555555555555555555555555555555500005555555555555555555555555555555
00000000000005555055555555555555555555555555555555555555555555555555555555555555555555555555500555555555555555555555555555555555
00000000000005555555555555555555555555555555555555555555555555555555555555555555555555555555550555555555555555555555555555555555
00000000000005555555555555555555555555555555555555555555555555555555555555555555555555555555550555555555555555555555555555555555
00000000000555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000000555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000000555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000005555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000005555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000005555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00000000055555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00005000555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
00005500555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
50005505555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
50555505555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555

