/-  sur=enemies
/+  default-agent, dbug, verb, agentio
/+  server
/+  rudder
/~  pages  (page:rudder enemies:sur action:sur)  /app/enemies/rud
!:
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0  enemies:sur
+$  card  card:agent:gall
--
%+  verb  |
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %.n) bowl)
:: 
++  on-init
  ^-  (quip card _this)
  :_  this
  :~
    [%pass /eyre/connect %arvo %e %connect [~ /[dap.bowl]] dap.bowl]
  ==
::
++  on-save
  ^-  vase
  !>(state)
::
++  on-load
  |=  old-state=vase
  ^-  (quip card _this)
  =/  old  !<(versioned-state old-state)
  ?~  old  !!
    `this(state old)

::
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?>  =(%handle-http-request mark)
    =;  out=(quip card:agent:gall enemies:sur)
      [-.out this(state +.out)]
    %.  :+  bowl
          !<(order:rudder vase)
          state
    %:  (steer:rudder enemies:sur action:sur)
      pages
      %:  point:rudder
        /enemies
        &
        ~(key by pages)
      ==
      (fours:rudder state)
      |=  act=action:sur
      ^-  $@(@t [brief:rudder (list card:agent:gall) enemies:sur])
      ?-  -.act
        %add  ``(snoc state enemy.act)
        %del  ``(oust [index.act 1] state)
    ==
  ==
::
++  on-watch  on-watch:def
++  on-leave  on-leave:def
++  on-peek   on-peek:def
++  on-agent  on-agent:def
++  on-arvo   on-arvo:def
++  on-fail   on-fail:def
--