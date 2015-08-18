
puts "Enter target #"
target = gets.chomp
puts "Enter input array"
objectified = gets.chomp.split(",").each_with_object({}) do |s, obj|
   obj[s.to_i] = s
end

target = target.to_i

def solutions(prev_sol, x, prev_y, y)
  rtn = Hash.new(nil)
  xs = prev_sol
  ys = prev_y
  rtn[x+y] ||= xs + "+" + ys unless (x+y) < 0 || (x+y) == x
  rtn[x-y] ||= xs + "-" + ys unless (x-y) < 0 || (x-y) == x
  rtn[x*y] ||= xs + "*" + ys unless (x*y) < 0 || (x*y) == x
  rtn.sort_by {|k, v| -k }
end

def count_up(target, objectified, depth=0)
  tst = {}
  sorted_keys = objectified.keys.sort.reverse
  sorted_keys.each {|x|
    sorted_keys.each {|y|

        solutions(objectified[x], x, objectified[y], y).each {|k,v|
          tst[k] = "(#{v})" unless tst.keys.include? k
        }
    }
  }
  if tst.keys.include? target
    puts tst[target]
    exit
  elsif depth > 10
    return ""
  else
    return count_up(target, tst, depth+1)
  end
end

count_up(target, objectified)

# def count_up(solution, objectified)
#   tst = {}
#   answers = []
#   objectified.each {|x|
#     objectified.each {|y|
#       solutions(x,y).each {|k,v|
#         tst[k] = v unless tst.keys.include? k
#       }
#     }
#   }
#   if tst.keys.include? solution
#     return tst[solution]
#   else
#
# end

#   print tst
# objectified = tst.keys
#
# max = objectified.max
# r << tst[max]
# n += max
# while n+max < target
#   r << "+"
#   r << tst[max]
#   n += max
# end
# #n -= max
# diff = target - n
#
# if objectified.include? diff
#   r << "+"
#   r << diff
#   n += diff
# end
# if n == target
#   puts "SOLVED: #{r.join('')}"
#   exit
# end
# puts n
# puts target
# puts objectified.to_s
