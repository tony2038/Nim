discard """
  cmd: '''nim c --gc:destructors $file'''
  output: '''hi
ho
ha
1 1'''
"""

import allocators
include system / ansi_c

proc main =
  var s: seq[string] = @[]
  for i in 0..<80: s.add "foo"

main()

const
  test = @["hi", "ho", "ha"]

for t in test:
  echo t

#echo s
let (a, d) = allocCounters()
cprintf("%ld %ld\n", a, d)
