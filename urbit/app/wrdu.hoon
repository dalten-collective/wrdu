::
::  wrdu - for our lover
::
::
/-  *wrdu
/+  default-agent, dbug, dict, io=agentio
::
|%
+$  versioned-state
    $%  state-zero
    ==
::
+$  state-zero
  $:  %0
      ::=meme
      ::=best
      ::=rank
      ::=fren
      =open
  ==
::
+$  card      card:agent:gall
--
::
%-  agent:dbug
=|  state-zero
=*  state  -
^-  agent:gall
=<
::!.
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
    wr    ~(. +> bowl)
::
++  on-init
  ^-  (quip card _this)
  ~&  >  [%wrdu %open ~]
  `this
  ::=/  car=(list card)
  ::  :~  (watch:pals:wr %leeches)
  ::      (watch:pals:wr %targets)
  ::      ~(call behn:wr now.bowl)
  ::  ==
  ::[car this]
::
++  on-save
  ^-  vase
  !>(state)
::
++  on-load
  |=  ole=vase
  ~&  >>  [%wrdu %redu ~]
  =/  old=versioned-state  !<(versioned-state ole)
  ?-    -.old
      %0
    =|  car=(list card)
    =/  wax=(map [path ship term] [? path])
      (malt ~(tap in wex.bowl))
    ::=?    car
    ::    !(~(has by wax) [/pals/targets/wrdu our.bowl %pals])
    ::  [(watch:pals:wr %targets) car]
    ::=?    car
    ::    !(~(has by wax) [/pals/leeches/wrdu our.bowl %pals])
    ::  [(watch:pals:wr %leeches) car]
    [car this(state old)]
  ==
::
++  on-agent
  |=  [=wire =sign:agent:gall]
  `this
::
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  =^  cards  state
    ?+    mark  `state
        %wrdu-game
      ?>  (team:title our.bowl src.bowl)
      =/  vaz=play  !<(play vase)
      ?-    -.vaz
          %guess
        ?~  open
          `state
        (guess:game:wr u.open test.vaz)
      ::
          %board
        ?~  open
          `state
        (~(rep by how.u.open) board:game:wr)
      ::
          %shrug
        ?~  open
          `state
        (shrug:game:wr u.open)
      ::
          %start
        ?~  open
          setup:game:wr
        `state
      ==
    ==
  [cards this]
::
++  on-arvo  
  |=  [=wire =sign-arvo]
  |^
  ?+    wire  `this
      [%wrdu %daily %timer @ ~]
    =+  dat=(date now.bowl)
    =/  caz=(list card)
      :~  :*
        %pass  [%wrdu %daily %timer (scot %da tom.dat) ~]
        %arvo  %b
        [%wait tom.dat]
      ==  ==
    ::  commented out until full version
    ::?~  open
    ::  ?:  (~(has by meme) yes.dat)
    ::    [caz this]
    ::  =.  meme  (~(put by meme) yes.dat ~)
    ::  [caz this]
    ::=.  meme
    ::  ?~  win.u.open
    ::    (~(put by meme) yes.dat `[wat.u.open how.u.open %.n])
    ::  (~(put by meme) yes.dat `[wat.u.open how.u.open u.win.u.open])
    [caz this(open ~)]
  ==
  --
::
++  on-watch
  |=  =path
  ^-  (quip card _this)
  =^  cards  state
  ?+    path  `state
      [%website ~]
    [(earth:game:wr ~) state]
  ==
  [cards this]
::
++  on-peek  
  |=  =path
  ^-  (unit (unit cage))
  ?+    path  (on-peek:def path)
      [%x %dbug %state ~]
    ``[%state !>([%0 cena='you can\'t see me'])]
    ::``[%state !>([%0 meme=meme best=best rank=rank fren=fren])]
  ==
::
++  on-fail  on-fail:def
++  on-leave  on-leave:def
--
|_  bol=bowl:gall
++  game
  |%
  ++  board
    |=  [inn=[@ud =rate] out=(quip card _state)]
    [(earth `[%bo ~]) state]
  ::
  ++  shrug
    |=  ope=[wen=@da wat=wrdl how=bord win=(unit ?)]
    =+  dat=(date now.bol)
    ::=.  meme  (~(put by meme) tod.dat `[wat.ope how.ope %.n])
    [(earth `[%sh ~]) state(open ~)]
  ::
  ++  setup
    =+  dat=(date now.bol)
    ::?:  (~(has by meme) tod.dat)
    ::  ~&  >>>  [%todays %game %complete]
    ::  ~&  >>>  [%wait %another `@dr`(sub tom.dat now.bol)]
    ::  :_  state
    ::  %-  earth 
    ::  `[%ma 'today\'s game is complete - wait til tomorrow'] 
    =.  open  `[now.bol ~(rand dict bol) *bord ~]
   [(earth `[%st ~]) state]
  ::
  ++  guess
    |=  $:  ope=[wen=@da wat=wrdl how=bord win=(unit ?)]
            pla=cord
        ==
    =+  brd=~(wyt by how.ope)
    =+  dat=(date now.bol)
    ?.  =((lent (trip pla)) long.wat.ope)
      [(earth `[%ma 'invalid submission length']) state]
    =+  [wor=(flop (cass (trip word.wat.ope))) plo=(flop (cass (trip pla)))]
    =|  rit=rite
    ?:  =(wor plo)
      =/  born=bord
        (~(put by how.ope) +(brd) [(sub now.bol wen.ope) [pla ~[%x %x %x %x]]])
      =.  open  `[wen.ope wat.ope born [~ %.y]]
      ::=.  meme  (~(put by meme) tod.dat `[wat.ope born %.y])
      [(earth `[%gu %wi]) state(open ~)]
    ?.  (~(alow dict bol) pla)
      [(earth `[%gu %ba]) state]
    |-
    ?:  |(?=(~ wor) ?=(~ plo))
      =/  born=bord
        (~(put by how.ope) +(brd) [(sub now.bol wen.ope) [pla rit]])
      ?:  =(+(brd) 6)
        =.  open  `[wen.ope wat.ope born [~ %.n]]
        ::=.  meme  (~(put by meme) tod.dat `[wat.ope born %.n])
        [(earth `[%gu %lo]) state(open ~)]
      =.  open  `[wen.ope wat.ope born win.ope]
      [(earth `[%gu %gu]) state]
     %=    $
        wor
      t.wor
    ::
        plo
      t.plo
    ::
        rit
      ?:  =(i.wor i.plo)
        [%x rit]
      ?:  (~(has in (sy (cass (trip word.wat.ope)))) i.plo)
        [%n rit]
      [%o rit]
    ==
  ::
  ++  earth
    |=  git=(unit erth)
    =,  enjs:format
    ^-  (list card)
    =-  [%give %fact ~[/website] [%json !>(jon)]]~
    ^-  jon=json
    =<
    =+  :*  ::m=(pairs (~(rep by meme) mon))
            ::b=~
            ::r=~
            ::f=~
            o=?~(open ~ (oon u.open))
        ==
    %-  pairs
    ?~  git
      :~  ::['meme' m]
          ::['best' b]
          ::['rank' r]
          ::['fren' f]
          ['open' o]
      ==
    ?-    -.u.git
        %gu
      :~  ::['meme' m]
          ::['best' b]
          ::['rank' r]
          ['open' o]
        ::
          :-  'emos'
          :-  %s
          ?:(?=(%gu act.u.git) '' ?~(open '' (emo how.u.open)))
        ::
          :-  'mesg'
          :-  %s
          ?-  act.u.git
            %wi  'winner - these games aren\'t tracked yet - so feel free to keep playing'
            %lo  'close, but no cigar. there\'s no penalty for poor performance... yet.'
            %gu  ''
            %ba  'word not recognized - please try again - DM ~rabsef-bicrym if it\'s egregious'
          ==
      ==
        %bo
      ['bord' ~]~
        %sh
      :~  ::['meme' m]
          ::['rank' r]
          ['open' o]
          ['mesg' [%s 'giving up already?']]
      ==
        %st
      :~  ['open' o]
          ['mesg' [%s 'let\'s play a game']]
      ==
        %ma
      ['mesg' [%s msg.u.git]]~
    ==
    |%
    ++  emo
      |=  inn=bord
      |^
      =+  [cou=7 out=*cord]
      |-
      ?:  =(cou 0)
        out
      ?.  (~(has by inn) cou)
        $(cou (dec cou))
      =+  mak=(flop rite.gues.val:(~(got by inn) cou))
      $(cou (dec cou), out (rap 3 [(roll mak ome) '\0d\0a' out ~]))
      ++  ome
        |=  [inn=?(%x %o %n) out=cord]
        ?-  inn
          %x  (cat 3 '🟩' out)
          %n  (cat 3 '🟨' out)
          %o  (cat 3 '⬛' out)
        ==
      --
    ::
    ++  mon
      |=  $:  inn=[wen=@da how=(unit [=wrdl =bord win=?])]
              out=(list [@t json])
          ==
      =+  dat=(sect wen.inn)
      :_  out
      :-  (scot %da wen.inn)
      %-  pairs
      ?~  how.inn
        ['wen' dat]~
      :~  ['wen' dat]
          ['wrd' (jrd wrdl.u.how.inn)]
          ['win' [%b win.u.how.inn]]
          ['how' (pairs (~(rep by bord.u.how.inn) brj))]
      ==
    ++  bon
      [%s 'strange best']
    ++  ron
      |=  [rin=[scor=@ud =ship] out=json]
      [%s 'strange rank']
    ++  fon
      |=  [fin=[=ship =meme] out=json]
      [%s 'strange fren']
    ++  oon
      |=  oin=[wen=@da wat=wrdl how=bord win=(unit ?)]
      %-  pairs
      :~  ['wen' (sect wen.oin)]
          ['wat' (jrd wat.oin)]
          ['win' ?~(win.oin ~ [%b u.win.oin])]
          ['how' (pairs (~(rep by how.oin) brj))]
      ==
    ++  jrd
      |=  jnn=[long=@ud hard=@rd word=cord mean=cord]
      %-  pairs
      :~  ['long' (numb long.jnn)]
          ['word' [%s word.jnn]]
          ['mean' [%s mean.jnn]]
      ==
    ++  brj
      |=  $:  bnn=[id=@ud =rate]
              out=(list [@t json])
          ==
        =+  ato=18.446.744.073.709.551.616
        :_  out
        :-  (scot %ud id.bnn)
        %-  pairs
        :~  ['secs' (numb (div time.rate.bnn ato))]
            ['test' [%s test.gues.rate.bnn]]
            ['rite' [%s (crip rite.gues.rate.bnn)]]
        ==
    --
  --
::
++  pals
  |%
  ++  watch
    |=  type=?(%targets %leeches)
    ^-  card
    =+  wir=/pals/(scot %tas type)/wrdu
    (~(watch-our pass:io wir) %pals /targets)
  ::++  doing
  ::  |=  =effect:pals
  ::  ~&  >>  effect
  ::  effect
  --
::
++  behn
  |_  tic=@da
  ++  call
    ^-  card
    =+  dat=(date now.bol)
    :*
      %pass  [%wrdu %daily %timer (scot %da tom.dat) ~]
      %arvo  %b
      [%wait tom.dat]
    ==
  --
::
++  date
  |=  inn=@da
  ^-  [yes=@da tod=@da tom=@da]
  =+  yer=(yore now.bol)
  =/  dim=(list @ud)  ?:((yelp y.-.yer) moy:yo moh:yo)
  =/  tod=@da
    (year [[%.y y.-.yer] m.yer [d.t.yer 0 0 0 ~]])
  =/  tom=@da
    ?:  =(d.t.yer (snag m.yer dim))
      (year [[%.y y.-.yer] +(m.yer) [1 0 0 0 ~]])
    (year [[%.y y.-.yer] m.yer [+(d.t.yer) 0 0 0 ~]])
  =/  yes=@da
    ?.  =(d.t.yer 1)
      (year [[%.y y.-.yer] m.yer [(dec d.t.yer) 0 0 0 ~]])
    %-  year
    [[%.y y.-.yer] (dec m.yer) [(snag (dec m.yer) dim) 0 0 0 ~]]
  [yes tod tom]
--
