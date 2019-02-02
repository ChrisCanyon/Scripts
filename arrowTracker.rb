beforeArrows = []
currentArrows = 0

def init(startArrows) do
  beforeArrows.pushAfter(startArrows)
  currentArrows = startArrows
end


# happening each tick
def update(arrowSlot)
  if arrowSlow == 'mithril arrow'
    previousArrows = currentArrows
    currentArrows = arrowSlot.getNumber
    if(currentArrows > previousArrows)
      arrowsShot = beforeArrows.last - previousArrows
      beforeArrows.push(currentArrows)
      arrowsShotArray.push(arrowSlot)
      arrowsLeft.push(currentArrows)
      #TODO: Check to see if i picked a mossy key up this tick somewhere around here
end

each tic do update
