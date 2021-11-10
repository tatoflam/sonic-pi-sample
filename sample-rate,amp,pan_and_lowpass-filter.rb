use_bpm 120

# rate: play rate(speed) for sample source
# amp: volume
# pan: -1.0 to 1.0

live_loop :live do
  sample :perc_bell, rate: 1.0, amp: 1.0, pan: 0.0
  sleep 0.5
  sample :perc_bell, rate: 0.25, amp: 1.5, pan: -0.9
  sleep 0.5
  sample :perc_bell, rate: 1.8, amp: 0.5, pan: 0.9
  sleep 0.5
  sample :perc_bell, rate: 0.2, amp: 1.5, pan: -0.9
  sleep 0.5
end


# lowpass filter
# - cutoff: frequency rate
# - res: resonance (shapeness for filter)
# - wave: 0:saw, 1:pulse, 2: triangle

tone = 48
live_loop :synth do
  use_synth :tb303
  play tone, cutoff: 40, res: 0.9, wave: 1
  sleep 0.5
  play tone+4, cutoff: 60, res: 0.7, wave: 2
  sleep 0.5
  play tone+2, cutoff: 80, res: 0.5, wave: 1
  sleep 0.5
  play tone+7, cutoff: 100, res: 0.3, wave: 2
  sleep 0.5
  tone = tone + 2
end
