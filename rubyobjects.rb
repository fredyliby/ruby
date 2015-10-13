class Calculator
	def initialize (value1,value2)
		@value1 = value1
		@value2 = value2

	end


	def add
		Calculator = Calculator.new(3,2)
		puts Calculator.add ==5
	end

	def subtract
		Calculator = Calculator.new(9,3)
		puts Calculator.subtract ==6
	end

	def multiply
		calculator = Calculator.new(2,8)
		puts Calculator.multiply ==16
	end

	def divide
		calculator = calculator.new(12,3)
		puts Calculator.divide ==4
	end

end



class Elevator
	def initialize
		puts Elevator.new
	end

	def new_elevator_current_floor
		puts Elevator.new.current_floor ==1
	end

	def test_up
		elevator = Elevator.new
		elevator.up = 10
		puts elevator.up.current.floor ==10
	end

	def test_down
		elevator = Elevator.new
		elevator.down = 3
		puts elevator.down.current_floor ==3
	end

	def greet_for_new_elevator
		elevator = Elevator.new
		puts elevator.greet.include?("1")
	end

	def greet_after_up
		elevator = Elevator.new
		elevator.up = 8
		puts elevator.greet.include?("8")
	end

	def greet_after_down
		elevator = Elevator.new
		elevator.down = 6
		puts elevator.greet.include?("6")
	end

	def greet_after_up_down
		elevator = Elevator.new
		elevator.up = 10
		elevator.down = 4
		puts elevator.greet.include?("4")
	end

end



