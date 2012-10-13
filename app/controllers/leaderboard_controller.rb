class LeaderboardController < ApplicationController  
  
  def index
    @leaderboard = Metric.new.leaderboard 
  end
  
  def load_constancy
    @time_serie = Metric::teams.map { |team| Metric.new(team).load_constancy }
    @colors = LeaderboardController::colors   
  end
  
  def team_balance
    @time_serie = Metric::teams.map { |team| Metric.new(team).team_balance }  
    @colors = LeaderboardController::colors   
  end
  
  def team_sinergy
    @time_serie = Metric::teams.map { |team| Metric.new(team).team_sinergy }  
    @colors = LeaderboardController::colors   
  end
  
  def stakanov
    @time_serie = Metric::teams.map { |team| Metric.new(team).stakanov }  
    @colors = LeaderboardController::colors
  end

  def self.colors 
    Rails.cache.fetch('colors', :expires_in => 24.hours) do     
      Metric::teams_names.map do |team| 
        Clan.find_by_name(team.to_s.capitalize).ensign
      end
    end
  end
  
end
