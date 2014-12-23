class PlayersFactory

  def self.create_player(name, position, &block)

    player_name = name

    ->(own_block) do
      yield
      own_block.call
      p "I'm #{player_name}, and I play as  #{position}"
    end

  end

end

class Playground


  attr_accessor :arena_name, :players

  def initialize(arena_name, player_involved)

    self.arena_name = arena_name
    self.players = []
    player_involved.each do |player|
      players.push PlayersFactory.create_player(player[:name], player[:position]) { p "I`m glad to play on #{self.arena_name}" } if player.has_key?(:name) && player.has_key?(:position)
    end
  end

  def call_over(actions)
    self.players.each_with_index { |player, index| player.call(actions[index]) }
  end

end

p_actions = []

p_actions.push -> { p "Jumps and crys" }
p_actions.push -> { p "Crys and jumps and crys" }
p_actions.push -> { p "Stands as stone" }

playground = Playground.new("Football arena #1", [{name: "Bill", position: "Cornerback"}, {name: "Otto", position: "Wide Receiver"}, {name: "Lenny", position: "End"}])

playground.call_over(p_actions)