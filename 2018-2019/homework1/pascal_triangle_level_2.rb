print 'Enter the depth of the triangle: '
deep = gets.chomp.to_i

def pascal(n)
  print 'Enter the base number: '
  base = gets.chomp.to_i

  (1-base..n - base).each do |level|
    list = [base]
    nex = base
    elem = 1
    (1..level-1+base).each  do |lev|
      nex = nex * (level - elem + base) / elem
      list.push nex
      elem += 1
    end
    p list
  end
end

pascal(deep)
