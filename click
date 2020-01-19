on run argv

  -- initialization
  set mytype to item 1 of argv
  log "Version 2 for " & mytype
  set myradio to "ft991a"
  set myprocess to "wsjtx_" & myradio

  tell application "System Events" to tell process myprocess
    
    -- main widow, Enable Tx, log window and Tx 6 discovery
    set mymain to name of front window
    set mylog to mymain & " - Log QSO"
    set thecheckbox to checkbox "Enable Tx" of window mymain
    click button "Log QSO" of window mymain
    delay 3
    set logwin to window mylog
    click button "Cancel" of group 1 of logwin
    set thetx6 to button "Tx 6" of group 1 of group 1 of window mymain
    delay 2
    
    tell thecheckbox
      repeat
      
        -- Enable Tx off then log and re enable
        if not (its value as boolean) then
          set p to position
          set s to size
          set xx to (item 1 of p) + (item 1 of s) / 2
          set yy to (item 2 of p) + (item 2 of s) / 2
          if exists logwin
            click button "OK" of group 1 of logwin
          else
            click thetx6
          end if
          do shell script "/Users/gmazzini/Desktop/scriptclick/MouseTools -leftClick -x " & xx & " -y " & yy
        end if
        delay 3
      end repeat
    end tell
  end tell
end run
