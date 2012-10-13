class LeaderboardController < ApplicationController  
  
  def index
    @leaderboard = Metric.new.leaderboard 
  end
  
  def first_prize
    @time_serie = Metric::teams.map { |team| Metric.new(team).first_prize }
    @colors = LeaderboardController::colors     
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
      Metric::teams.map do |team| 
        Clan.find_by_name(team).ensign
      end
    end
  end
  
end
