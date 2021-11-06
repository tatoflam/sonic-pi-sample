use_bpm 120

scales = [(scale :F, :mixolydian), (scale :Bb, :mixolydian), (scale :F, :mixolydian), (scale :F, :mixolydian),
          (scale :Bb, :mixolydian), (scale :B, :diminished), (scale :F, :mixolydian), (scale :D, :mixolydian),
          (scale :G, :minor), (scale :C, :mixolydian), (scale :F, :mixolydian), (scale :C, :mixolydian)].ring
s = scales[0]


chords = [(chord :F, '7'), (chord :Bb, '7'), (chord :F, '7'), (chord :F, '7'),
          (chord :Bb, '7'), (chord :B, :dim7), (chord :F, '7'), (chord :D, '7'),
          (chord :G, :minor7), (chord :C, '7'), (chord :F, '7'), (chord :C, '7')].ring
c = chords[0]

verse = 1
four_verse = 1

live_loop :melody do
  use_synth :sine
  r = [0.25, 0.33, 0.5, 0.66, 0.75, 1].choose
  # r = rrand(0, 1)
  if (four_verse % 2 == 0)
    play s.choose, attack: 0, release: r, cutoff: rrand(50, 100)
  end
  
  sleep r
end

live_loop :keys do
  use_synth :blade
  
  4.times do
    play c
    sleep 1
  end
  c = chords.tick
  verse = look
  verse = verse + 1
  if verse % 4  == 1
    four_verse = four_verse + 1
  end
end

live_loop :bass do
  use_synth :fm
  use_octave -2
  
  play s[0] # play root
  sleep 1
  play s[rrand(0,6)]
  sleep 1
  play s[[2,4,6].choose]  # play 3, 5, 7
  sleep 1
  play s[rrand(0,6)]
  sleep 0.65
  play s[[1,4].choose] # # play 2, 4
  sleep 0.35
  s = scales.tick
end

live_loop :hihat do
  3.times do
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
    sample :drum_cymbal_pedal
    sleep 0.35
  end
  
end