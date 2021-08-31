class CastMember
  attr_reader :name, :character

  def initialize(cast)
    @name = cast[:name]
    @character = cast[:character]
  end

end
