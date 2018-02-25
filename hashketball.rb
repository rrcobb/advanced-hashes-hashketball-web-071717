# Write your code here!

def game_hash
  {
    home: {
      team_name: 'Brooklyn Nets',
      colors: ['White', 'Black'],
      players: {
        'Alan Anderson' => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1,
        },
        'Reggie Evans' => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7,
        },
        'Brook Lopez' => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15,
        },
        'Mason Plumlee' => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5,
        },
        'Jason Terry' => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1,
        }
      },
    },
    away: {
      team_name: 'Charlotte Hornets',
      colors: ['Turquoise', 'Purple'],
      players: {
        'Jeff Adrien' => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2,
        },
        'Bismak Biyombo' => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10,
        },
        'DeSagna Diop' => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5,
        },
        'Ben Gordon' => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0,
        },
        'Brendan Haywood' => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12,
        },
      },
    }
  }
end

def num_points_scored(name)
  player_stats(name)[:points]
end

def shoe_size(name)
  player_stats(name)[:shoe]
end

def team_by_name(name)
  game_hash.find { |k, v| v[:team_name] == name }[1]
end

def team_colors(name)
  team_by_name(name)[:colors]
end

def team_names
  game_hash.map { |k, v| v[:team_name] }
end

def player_numbers(name)
  team_by_name(name)[:players].values.map { |h| h[:number] }
end

def player_stats(name)
  (game_hash[:home][:players][name] || game_hash[:away][:players][name])
end

def all_players
  game_hash.values.map { |h| h[:players] }.reduce(&:merge)
end

def big_shoe_rebounds
  all_players.values.max_by { |player| player[:shoe] }[:rebounds]
end

def most_points_scored
  all_players.max_by { |k, v| v[:points] }[0]
end

def winning_team
  game_hash.max_by { |k, v| v[:players].map { |k, v| v[:points] }.reduce(:+) }[1][:team_name]
end

def player_with_longest_name
  all_players.keys.max_by { |name| name.length }
end

def most_steals
  all_players.max_by { |k, v| v[:steals] }[0]
end

def long_name_steals_a_ton?
  player_with_longest_name == most_steals
end
