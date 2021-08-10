# frozen_string_literal: true

john = User.create!(
  email: 'john.doe@example.com',
  password: Faker::Internet.password
)

jane = User.create!(
  email: 'jane.doe@example.com',
  password: Faker::Internet.password
)

BrewSession.create!(
  [
    {
      title: 'Martian Chronicles',
      description: 'Cult book by Ray Bradbury',
      user: john,
      volume: 25.0
    },
    {
      title: 'The Martian',
      description: 'Novel by Andy Weir about an astronaut stranded on Mars trying to survive',
      user: john,
      volume: 25.0
    },
    {
      title: 'Doom',
      description: 'A group of Marines is sent to the red planet via an ancient ' \
                   'Martian portal called the Ark to deal with an outbreak of a mutagenic virus',
      user: jane,
      volume: 25.0
    },
    {
      title: 'Mars Attacks!',
      description: 'Earth is invaded by Martians with unbeatable weapons and a cruel sense of humor',
      user: jane,
      volume: 25.0
    }
  ]
)
