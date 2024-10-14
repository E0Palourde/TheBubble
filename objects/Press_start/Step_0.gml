if timer == 60 { visible = false};
if timer == 120 { visible = true ; timer = 0}
timer += 1

if keyboard_check(vk_space){room_goto(TestLevel)}