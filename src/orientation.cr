abstract class Left end
abstract class Right end
abstract class Forward end

alias Direction = (Left.class | Right.class)
alias Command = (Direction | Forward.class)

abstract class Orientation end

macro defined_orientation(name, **args)
    class {{name}} < Orientation
        def forward_vector : Tuple(Int32, Int32)
            { {{args[:x]}}, {{args[:y]}} }
        end
        def turn(direction : Direction) : Orientation
            if direction == Left
                {{args[:left]}}.new
            else
                {{args[:right]}}.new
            end
        end
    end
end

defined_orientation(North, x: 0,  y: 1,  left: West)
defined_orientation(South, x: 0,  y: -1, left: East)
defined_orientation(East,  x: 1,  y: 0,  left: North)
defined_orientation(West,  x: -1, y: 0,  left: South)
