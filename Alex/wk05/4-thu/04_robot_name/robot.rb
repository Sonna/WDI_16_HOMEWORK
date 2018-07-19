# ---
# source:
# - title: Robot Name
#   url: https://gist.github.com/epoch/2ac2bd21c2fd8c8ac106#file-robot-md
# ---

# # Robot Name

# When robots come off the factory floor, they have no name.

# The first time you boot them up, a random name is generated, such as RX837 or
# BC811.

# In other words, if I say:

# ```ruby
# puts "Robot 1: "
# robot1 = Robot.new
# puts robot1.name
# puts robot1.name
# puts robot1.name

# puts "Robot 2: "
# robot2 = Robot.new
# puts robot2.name
# puts robot2.name
# puts robot2.name
# ```

# then robot1 will print the same name 3 times, and robot2 will not have the
# same name as robot1.

# Every once in a while we need to reset a robot to its factory settings, which
# means that their name gets wiped. The next time you ask, it gets a new name.

# if I say:

# ```ruby
# puts "Robot 3: "
# robot3 = Robot.new
# puts robot3.name
# puts robot3.name
# puts "Resetting to factory settings."
# robot3.reset
# puts robot3.name
# puts robot3.name
# ```

# then robot3 will have the same name twice, then we'll get the reset message,
# then it will get a new name, and print it twice.

# All robots have a mac address. The mac address never changes, even if you
# reset it to factory settings.

# ## Extensions

# ### Counters

# It's important that we not overwork our robots. While resetting to factory
# defaults is great, the wear and tear on the robot mechanics doesn't go away.
# Have your robot track the total number of operations that have been performed on
# it.

# ```ruby
# puts "Robot 3: "
# robot3 = Robot.new
# puts robot3.name
# puts robot3.name
# puts "Resetting to factory settings."
# robot3.reset
# puts robot3.name
# puts robot3.name
# puts robot3.instruction_count # => 5
# ```

# ### Robot Time

# Number of instructions is important, but so is the total age of the robot.

# ```ruby
# puts "Robot 3: "
# robot3 = Robot.new
# puts robot3.timers # => "21 seconds since last boot, 21 seconds since creation"
# puts robot3.name
# puts "Resetting to factory settings."
# robot3.reset
# puts robot3.timers # => "8 seconds since last boot, 29 seconds since creation"
# puts robot3.name
# ```

# idea from:
# - https://gist.github.com/jiggneshhgohel/d4d5996207dcf81bef8e
module MacAddress
  # M => Manufacturer, S => Serial number assigned by Manufacturer
  FORMAT = "MM:MM:MM:SS:SS:SS".freeze
  OCTALS = (0..15).to_a.freeze

  def self.generate(m = manufacturer, s = serial_number)
    "#{m}:#{s}"
  end

  def self.manufacturer
    6.times.map { OCTALS.sample.to_s(16) }.each_slice(2).map(&:join).join(":").upcase
  end

  def self.serial_number
    6.times.map { OCTALS.sample.to_s(16) }.each_slice(2).map(&:join).join(":").upcase
  end
end

module RobotName
  PREFIX = ("AA".."ZZ").to_a.freeze
  SUFFIX = ("000".."999").to_a.freeze

  def self.generate(prefix = PREFIX, suffix = SUFFIX)
    prefix.sample + suffix.sample
  end
end

# module RobotFactory
#   def self.build
#     @@manufacturer_id ||= MacAddress.manufacturer
#     robot = Robot.new
#     robot.name = RobotName.generate
#   end
# end

class Robot
  attr_reader :instruction_count

  def initialize
    @instruction_count = 0
  end

  # def mac_address=(mac_address)
  #   @mac_address ||= mac_address
  # end
  def mac_address
    increase_operator_count
    @mac_address ||= MacAddress.generate
  end

  def name
    increase_operator_count
    @name ||= RobotName.generate
  end

  def reset
    increase_operator_count
    @name = nil
  end

  private

  def increase_operator_count
    @instruction_count += 1
  end
end

if $PROGRAM_NAME == __FILE__
  require "minitest/autorun"

  class RobotTest < Minitest::Test
    # The first time you boot them up, a random name is generated, such as RX837
    # or BC811.
    def test_robot_is_generated_with_random_name
      assert_match(/\w{2}\d{3}/, described_class.new.name)
    end

    def test_two_robots_do_not_share_names
      refute_equal(described_class.new.name, described_class.new.name)
    end

    def test_multiple_robots_do_not_share_names
      robot_names = 10.times.map { described_class.new.name }
      assert_equal robot_names.uniq.length, robot_names.length, robot_names
    end

    def test_robot_keeps_name_when_asked_multiple_times
      subject = described_class.new
      assert_equal subject.name, subject.name
    end

    # Every once in a while we need to reset a robot to its factory settings,
    # which means that their name gets wiped. The next time you ask, it gets a
    # new name.
    def test_reseting_robot_gives_it_a_new_name
      subject = described_class.new
      first_name = subject.name

      subject.reset

      refute_equal first_name, subject.name
    end

    # All robots have a mac address. The mac address never changes, even if you
    # reset it to factory settings.
    def test_robot_has_a_mac_address
      assert described_class.new.mac_address
    end

    def test_robot_keeps_mac_address_after_reset_multiple_times
      subject = described_class.new
      first_mac_address = subject.mac_address

      10.times { subject.reset }

      assert_equal first_mac_address, subject.mac_address
    end

    def test_robots_have_unique_mac_addresses
      refute_equal described_class.new.mac_address, described_class.new.mac_address
    end

    # Not necessary, but a stricter format for Mac Address
    def test_robot_mac_addresses_is_IEEE_802_standard
      subject = described_class.new
      assert_match(/[A-Z0-9][A-Z0-9]:[A-Z0-9][A-Z0-9]:[A-Z0-9][A-Z0-9]:[A-Z0-9][A-Z0-9]:[A-Z0-9][A-Z0-9]:[A-Z0-9][A-Z0-9]/,
                   subject.mac_address)
    end

    # It's important that we not overwork our robots. While resetting to factory
    # defaults is great, the wear and tear on the robot mechanics doesn't go
    # away. Have your robot track the total number of operations that have been
    # performed on it.
    def test_robot_keeps_track_of_number_of_preformed_operators
      subject = Robot.new

      subject.name
      subject.name
      subject.reset
      subject.name
      subject.name

      assert_equal 5, subject.instruction_count
    end

    def test_robot_keeps_track_of_number_of_different_preformed_operators
      subject = Robot.new

      subject.name
      subject.reset
      subject.name

      assert_equal 3, subject.instruction_count
    end

    protected

    def described_class
      Robot
    end
  end
end
# >> Run options: --seed 58702
# >>
# >> # Running:
# >>
# >> ...........
# >>
# >> Finished in 0.001216s, 9046.0526 runs/s, 10690.7894 assertions/s.
# >> 11 runs, 13 assertions, 0 failures, 0 errors, 0 skips
