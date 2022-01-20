::
::  wrdu-game play
::
/-  *wrdu
|_  gaem=play
++  grad  %noun
++  grow
  |%
  ++  noun  gaem
  --
++  grab
  |%
  ++  noun  play
  ::
  ++  json
    |=  jon=^json
    %-  wrdu-game
    =<  (wrd-noun jon)
    |%
    ++  wrd-noun
      ?:  |(=(-.jon %shrug) =(-.jon %board)
        [-.jon ~]
      =,  dejs:format
      %-  of
      :~  [%guess (ot :~(['test' so]))]
          [%start (ot :~(['leng' (se %tas)]))]
      ==
  --
--