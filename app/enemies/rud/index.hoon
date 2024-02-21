/-  sur=enemies
/+  rudder, server
!:
^-  (page:rudder enemies:sur action:sur)
|_  [=bowl:gall =order:rudder =enemies:sur]
++  build
  |=  $:  args=(list [k=@t v=@t])
          msg=(unit [gud=? txt=@t])
      ==
  ^-  reply:rudder
  |^  [%page page]
  ++  page
    ^-  manx
    ;html
      ;head
        ;title:"my enemies"
        ;style:"form \{ display: inline-block; }"
        ;meta(charset "utf-8");
        ;meta(name "viewport", content "width=device-width, initial-scale=1");
      ==
      ;body
        ;+  ?~  msg  :/""
            ?:  gud.u.msg
              ;div#status.green:"{(trip txt.u.msg)}"
            ;div#status.red:"{(trip txt.u.msg)}"
        ;ul
          ;*  %-  head
              %^  spin  enemies.enemies  0
              |=  [n=@t i=@ud]
              [(enemy i n) +(i)]
        ==
        ;form(method "post")
          ;input(type "text", name "enemy", placeholder "demon king giri");
          ;input(type "submit", name "add", value "add");
        ==
      ==
    ==
  ::
  ++  enemy
    |=  [i=@ud n=@t]
    ;li
      ; {(trip n)}
      ;form(method "post")
        ;input(type "submit", name "del", value "x");
        ;input(type "hidden", name "index", value "{(scow %ud i)}");
      ==
    ==
  --
++  argue
  |=  [headers=header-list:http body=(unit octs)]
  ^-  $@(brief:rudder action:sur)
  =/  args=(map @t @t)
    ?~(body ~ (frisk:rudder q.u.body))
  ?:  &((~(has by args) 'add') (~(has by args) 'enemy'))
    [%add (~(got by args) 'enemy')]
  ?.  &((~(has by args) 'del') (~(has by args) 'index'))
    ~
  ?~  ind=(rush (~(got by args) 'index') dem:ag)
    ~
  ?:  (gte u.ind (lent enemies))
    'they\'re long gone!'
  [%del u.ind]
::
++  final
  |=  [success=? =brief:rudder]
  ^-  reply:rudder
  ?.  success  (build ~ `[| `@t`brief])
  [%next 'enemies' brief]
--
