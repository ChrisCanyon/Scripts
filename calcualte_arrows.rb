###  Dataset ###
ArrowsShot = [19000.0]
ArrowsLeft = [15000.0]
KeysDropped = [10.0]
###  Dataset ###

def sum_array(x)
    sum = 0
    x.each { |val| sum += val }
    sum
end

# Estimates
ArrowLossRate = sum_array(ArrowsLeft) / sum_array(ArrowsShot)
KeysDropRate = sum_array(KeysDropped) / sum_array(ArrowsShot)

def next_arrows(startArrows)
  p (startArrows * ArrowLossRate)
  startArrows * ArrowLossRate
end

def calculate_total_arrows(startArrows)
  total = startArrows

  current = startArrows
  while (current > 1) do
    current = next_arrows(current)
    total += current
  end

  total
end

estimatedTotalArrows = calculate_total_arrows(19000)
estimatedTotalKeys = estimatedTotalArrows * KeysDropRate

"Estimated Total Arrows: #{estimatedTotalArrows}"
"Estimated Total Keys: #{estimatedTotalKeys}"
