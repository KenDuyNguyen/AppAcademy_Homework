#Find longest fish

def biggest_fish_quadratic(group_of_fish)
  biggest = nil

  group_of_fish.each_with_index do |fish1, i|
    group_of_fish.each_with_index do |fish2, j|
      next if i == j
      biggest = fish1 if biggest == nil || fish1.length > fish2.length
      biggest = fish2 if fish2.length > fish1.length
    end
  end

  biggest
end

# p biggest_fish_quadratic(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])


#dominant octopus log linear
class Array 
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)
    merged
  end
end

def biggest_fish_nlogn(group_of_fish)
  prc = Proc.new { |x, y| x.length <=> y.length }
  group_of_fish.merge_sort(&prc)[-1]
end

# p biggest_fish_nlogn(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])


#Clevar octopus, linear

def biggest_fish_n(group_of_fish)
  biggest = group_of_fish.first

  group_of_fish.each do |fish|
    if fish.length > biggest.length
      biggest = fish
    end
  end

  biggest
end

# p biggest_fish_n(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])


#Slow Dance

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction,  tiles_array)
  tiles_array.each_with_index do |tile, index|
    return index if tile == direction
  end
end
#
# p slow_dance("up", tiles_array)
# > 0
#
# p slow_dance("right-down", tiles_array)
# > 3


#Constant Dance!
tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end


p fast_dance("up", tiles_hash)
# > 0

p fast_dance("right-down", tiles_hash)
# > 3
