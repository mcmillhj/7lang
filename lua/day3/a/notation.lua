local function note(letter, octave)
   local notes = {
      C = 0, Cs = 1, D = 2, Ds = 3, E = 4,
      F = 5, Fs = 6, G = 7, Gs = 8, A = 9,
      As = 10, B = 11
   }
   
   return (octave + 1) * 12 + notes[letter];
end

local tempo = 100
local function duration(value)
   local quarter = 60 / tempo
   local durations = {
      h  = 2.0,
      q  = 1.0,
      ed = 0.75,
      e  = 0.5,
      s  = 0.25
   }

   return durations[value] * quarter
end

local function parse_note(s)
   local letter, octave, value =
      string.match(s, "([A-Gs]+)(%d+)(%a+)")

   if not (letter and octave and value) then
      return nil
   end

   return {
      note = note(letter, octave),
      duration = duration(value)
   }
end

local scheduler = require 'scheduler'
local NOTE_DOWN = 0x90                       
local NOTE_UP   = 0x80                       
local VELOCITY  = 0x7F                       
                                       
function play(note, duration)
   midi_send(NOTE_DOWN, note, VELOCITY)
   scheduler.wait(duration)
   midi_send(NOTE_UP, note, VELOCITY)
end

return {
   parse_note = parse_note,
   play = play
}
                    
