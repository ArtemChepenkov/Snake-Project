asect  0x00
setsp 0xf0
prog:
  ldi r3, 0xff
  ldi r1, 0
  st r3, r1
  #apple eating test
  ldi r3, 0xf1 #yes/no apple
  ldi r1, 0
  ldi r0, 0xf2 #headX
  ld r0, r0
  ldi r2, 0xfc #appleX
  ld r2, r2
  if
    cmp r0, r2
  is eq, and
    ldi r0, 0xf3 #headY
    ld r0, r0
    ldi r2, 0xfd #appleY
    ld r2, r2
    cmp r0,r2
  is eq
  then
    ldi r1, 1
    st r3, r1
    ldi r3, 0xe1 #lvl
    ld r3, r3
    ldi r2, 0xe2 #flag for the game begining
    ld r2, r2
    if
      tst r3
    is z, and
      tst r2
    is z
      ldi r2, 1
      ldi r1, 0xe2
      st r1, r2
      ldi r1, -1
      ldi r2, 0xe0
      st r2, r1
      ldi r0, 0 #eaten apples counter
      st r2, r0
    else
      ldi r0, 0xe0 #eaten apples counter
      ld r0, r0
      inc r0
      ldi r2, 0xe0
      st r2, r0
    fi
    ldi r1, 5
    if
      cmp r0, r1
    is eq
      inc r3
      ldi r2, 0xe1
      st r2, r3
      ldi r1, 0
      ldi r2, 0xe0
      st r2, r1
    fi
  else
    st r3, r1   
  fi
#test collisions and walls
  ldi r1, 0
  ldi r0, 0xf2 #headX
  ld r0, r0
  ldi r3, 0xf3 #headY
  ld r3, r3
  ldi r2, 0xf4 #X2P
  ld r2, r2
  if
    cmp r0,r2
  is eq, and
    ldi r2, 0xf5 #Y2P
    ld r2, r2
    cmp r3, r2
  is eq
  then
    ldi r1, 1
  fi
  ldi r2, 0xf6 #X3P
  ld r2, r2
  if
    cmp r0,r2
  is eq, and
    ldi r2, 0xf7 #Y3P
    ld r2, r2
    cmp r3, r2
  is eq
  then
    ldi r1, 1
  fi
  ldi r2, 0xf8 #X4P
  ld r2, r2
  if
    cmp r0,r2
  is eq, and
    ldi r2, 0xf9 #Y4P
    ld r2, r2
    cmp r3, r2
  is eq
  then
    ldi r1, 1
  fi
  ldi r2, 0xfa #X5P
  ld r2, r2
  if
    cmp r0,r2
  is eq, and
    ldi r2, 0xfb #Y5P
    ld r2, r2
    cmp r3, r2
  is eq
  then
    ldi r1, 1
  fi
  ldi r3, 0xfe
  st r3, r1
  ldi r0, 0xe1 #lvl
  ld r0, r0
  ldi r2, 1
  if
    cmp r0, r2
  is eq
    ldi r0, 0xf2 #headX
    ld r0, r0
    ldi r2, 0
    if
      cmp r0, r2
    is eq, or
      ldi r2, 7
      cmp r0, r2
    is eq
    then
      ldi r1, 1
      st r3, r1
    fi
  fi
  ldi r0, 0xe1 #lvl
  ld r0, r0
  ldi r2, 2
  if
    cmp r0, r2
  is eq
    ldi r0, 0xf2 #headX
    ld r0, r0
    ldi r2, 0
    if
      cmp r0, r2
    is eq, or
      ldi r2, 7
      cmp r0, r2
    is eq, or
      ldi r0, 0xf3 #headY
      ld r0, r0
      cmp r0, r2
    is eq, or
      ldi r2, 0
      cmp r0, r2
    is eq
    then
      ldi r1, 1
      st r3, r1
    fi
  fi
  ldi r0, 0xe1 #lvl
  ld r0, r0
  ldi r2, 3
  if
    cmp r0, r2
  is eq
     ldi r0, 0xf2 #headX
     ld r0, r0
     ldi r2, 1
     if
       cmp r0, r2
     is eq, or
       ldi r2, 6
       cmp r0, r2
     is eq, or
       ldi r0, 0xf3 #headY
       ld r0, r0
       ldi r2, 1
       cmp r0, r2
     is eq, or
       ldi r2, 6
       cmp r0, r2
     is eq
     then
       ldi r1, 1
       st r3, r1
     fi
  fi
  ldi r3, 0xff
  ldi r1, 1
  st r3, r1
br prog
halt
end
