::
::  wrdu sur file
::
::  scoring method - tbd
::
|%
::
+$  wrdl  [long=@ud hard=@rd word=cord mean=cord]
::
+$  rite  (list ?(%x %o %n))
+$  scor  @ud
::
+$  bord  ((mop @ud rate) gth)
+$  rate  [time=@dr =gues]
+$  gues  [test=cord =rite]
::
+$  meme  (map @da (unit [=wrdl =bord win=?]))
::+$  best  (unit [day=@da top=[=wrdl =bord]])
::+$  rank  ((mop scor ship) lth)
::+$  fren  (map ship meme)
+$  open  (unit [wen=@da wat=wrdl how=bord win=(unit ?)])
::
+$  play  $%  [%guess test=cord]
              [%board ~]
              [%shrug ~]
              [%start ~]
          ==
::
+$  erth  $%  [%gu act=?(%wi %lo %gu %ba)]
              [%bo ~]
              [%sh ~]
              [%st ~]
              [%ma msg=@t]
          ==
--