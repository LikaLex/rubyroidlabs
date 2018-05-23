print 'Enter the depth of the triangle: '
deep = gets.chomp.to_i

def pascal(n)
  (0..n).each do |level|
    list = [1]
    nex = 1
    elem = 1
    (0..level-1).each  do |lev|
     nex = nex * (level - elem + 1) / elem
      list.push nex
      elem += 1
    end
    p list
    end
  end

pascal(deep)
