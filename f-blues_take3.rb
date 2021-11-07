use_bpm 120

scales = [(scale :F, :mixolydian), (scale :Bb, :mixolydian),(scale :F, :mixolydian),(scale :F, :mixolydian),
          (scale :Bb, :mixolydian), (scale :B, :diminished),(scale :F, :mixolydian),(scale :D, :mixolydian),
          (scale :G, :minor), (scale :C, :mixolydian),(scale :F, :mixolydian),(scale :C, :mixolydian)].ring

s = scales[0]

verse = 1
four_verse = 1

live_loop :rehamo do
  interval = [0.25, 0.33, 0.5, 0.66, 0.75, 1].choose
  if four_verse % 2 == 0
    
    play s.choose
  end
  sleep interval
  
end

live_loop :backing do
  use_synth :blade
  use_octave -1
  play s[2]
  play s[4]
  sleep 1
  
  play s[[2,4,6].choose]
  play s[[0,1,6].choose]
  sleep 1
  
  fill = rrand(0,1)
  if (fill < 0.3)
    sleep 0.33
    play s[[2,4,6].choose]
    play s[[0,1,6].choose]
    sleep 0.33
    play s[[2,4,6].choose]
    play s[[0,1,6].choose]
    sleep 0.34
    play s[2]
    play s[[0,4,6].choose]
  end
  
end

live_loop :bass do
  use_synth :fm
  use_octave -2
  play s[0]
  sleep 1
  play s[rrand(0,6)]
  sleep 1
  play s[[2,4,6].choose]
  sleep 1
  play s[rrand(0,6)]
  sleep 0.65
  play s[[2,4,6].choose]
  sleep 0.35
  
  s = scales.tick
  verse = verse + 1
  if verse %4 ==0
    
    four_verse = four_verse + 1
  end
end

live_loop :hihat do
  4.times do
    sample :drum_cymbal_closed
    sleep 0.65
    sample :drum_cymbal_pedal
    sleep 0.35
  end
  
  fill = rrand(0,1)
  if (fill < 0.4)
    sleep 0.33
    sample :drum_cymbal_closed
    sleep 0.33
    sample :drum_cymbal_pedal
    sleep 0.34
    sample :drum_cymbal_pedal
  else
    sample :drum_cymbal_closed
    sleep 0.65
    sample :drum_cymbal_open
    sleep 0.35
  end
end