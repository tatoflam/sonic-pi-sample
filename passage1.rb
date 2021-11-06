use_bpm 60

live_loop :melody do
  play 72
  sleep 0.25
  play 78
  sleep 0.25
  play 77
  sleep 0.25
  play 72
  sleep 0.5
  play 72
  sleep 0.25
  play 72
  sleep 0.25
  play 76
  sleep 0.25
end

live_loop :drums do
  sample :drum_heavy_kick
  sleep 0.75
  sample :drum_snare_hard
  sleep 0.75
  sample :drum_heavy_kick
  sleep 0.5
  sample :drum_snare_hard
  sleep 1
end

live_loop :hihat do
  sample :drum_cymbal_closed
  sleep 0.25
  sample :drum_cymbal_pedal
  sleep 1
end

live_loop :bass do
  use_synth :fm
  sleep 0.25
  play :c2
  sleep 2
  play :e2
  sleep 0.75
  play :f2
  sleep 1
end