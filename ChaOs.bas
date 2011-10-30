
  ' ChaOs.bas. A simple random character generator for
  ' creating random passwords, keys, etc.

  ' THIS PROGRAM IS PROVIDED "AS IS". THE AUTHOR OF THIS
  ' PROGRAM IS NOT RESPONSIBLE FOR POSSIBLE LOSS OF DATA
  ' IN THE CASE THAT THIS PROGRAM WAS USED TO PROVIDE
  ' A KEY TO SECURE THEM.

'----------------------------------------------------------------------------------------------------------------------------------------------

  nomainwin

  word$ = ""

  WindowWidth = 285
  WindowHeight = 200

  stylebits #ran.t, _SS_CENTERIMAGE or _
                    _SS_CENTER or _
                    _WS_THICKFRAME, _
                    0, _
                    _WS_EX_DLGMODALFRAME or _
                    _WS_EX_CLIENTEDGE, _
                    0

  stylebits #ran, _WS_SYSMENU, _
                  _WS_MAXIMIZEBOX, _
                  _WS_EX_CLIENTEDGE, _
                  0

  menu #ran, "Help", _
             "Help Topics", [hlp]

  menu #ran, "About", _
             "About ChaOs", [about]

  statictext #ran.t, "", 50, 20, 180, 50

  button #ran.b, "Next Character", [next], UL, 90, 100, 100, 30

  open "ChaOs" for window_nf as #ran

  #ran, "trapclose [quit]"

  #ran.t, "!font arial 10 20"

'----------------------------------------------------------------------------------------------------------------------------------------------

  [next]

  for i = 1 to 8

    random = int(rnd(1) * 10)

    if random > 5 then
        bit$ = "1"
    else
        bit$ = "0"
    end if

   word$ = word$ + bit$

  next i

  wordKey$ = bin2txt$(word$)

  if wordKey$ = "!" then
    wordKey$ = ""
  end if

  #ran.t, wordKey$

  word$ = ""

  wait

'----------------------------------------------------------------------------------------------------------------------------------------------

  [quit]

  close #ran
  end

'----------------------------------------------------------------------------------------------------------------------------------------------

  [hlp]
  
  run "Notepad ChaOs.txt"
  
  wait
  
'----------------------------------------------------------------------------------------------------------------------------------------------

  [about]
  
  icon$ = "ChaOs.ico"

  calldll #shell32, "ExtractIconA", _
      0 as long, _
      icon$ as ptr, _
      0 as long, _
      hIcon as ulong

  szApp$ = "About ChaOs ver 1.0 # Built in Liberty Basic ver 4.03"
  cr$ = chr$(13)
  szOtherStuff$ = cr$ + "Created by Alexander Kampolis" + cr$

  calldll #shell32, "ShellAboutA", _
      h as ulong, _
      szApp$ as ptr, _
      szOtherStuff$ as ptr, _
      hIcon as ulong, _
      ret as long

  wait
  
'----------------------------------------------------------------------------------------------------------------------------------------------

  function bin2txt$(n$)

    for s1 = 1 to len(n$) step 8
        for s2 = 1 to 8
            x = x + val(mid$(mid$(n$, s1, 8), 8- s2 + 1, 1)) * (2 ^ (s2 -1))
        next s2
        bin2txt$ = bin2txt$ + chr$(x) : x = 0
    next s1

  end function

