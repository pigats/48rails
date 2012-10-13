require 'open-uri'

class Metric
  
  def initialize(team=nil)
    @team = team
  end
  
  def leaderboard
    res = Metric::get('metrics.json').split(/\n/)[2].split(/(?<=\]),/)
    score = []
    res.each_with_index do |m,i| 
      score[i] = {}
      m.scan(/(\d+\.\d+|NaN)/).flatten.each_with_index {|v,j| score[i].store(Metric::headers[j],v) } 
    end
    if @team.nil? 
      Metric::teams_names.map.with_index do |team, i| 
        {team[1] => score[i]}
      end
    else
      score[Metric::teams.index(@team)]
    end          
  end
  
  def _48rails
    Metric::get("#{Metric::metrics_names.key(:_48rails)}_#{Metric::teams_names.key(@team)}.json")    
  end
  
  def load_constancy
    Metric::get("#{Metric::metrics_names.key(:load_constancy)}_#{Metric::teams_names.key(@team)}.json")
  end
  
  def team_balance
    Metric::get("#{Metric::metrics_names.key(:load_balance)}_#{Metric::teams_names.key(@team)}.json")
  end
  
  def team_sinergy
    Metric::get("#{Metric::metrics_names.key(:team_sinergy)}_#{Metric::teams_names.key(@team)}.json")  
  end
  
  def stakanov
    Metric::get("#{Metric::metrics_names.key(:stakanov)}_#{Metric::teams_names.key(@team)}.json")    
  end

  private 

    def self.headers
      res = self.get('metrics.json').split(/\n/)[1].scan(/\w+/)
      res.map {|metric| self.metrics_names[metric] }    
    end
    
    def self.teams 
      res = self.get('metrics.json').split(/\n/)[0].scan(/\w+-\w+-\w+/)
      res.map {|team| self.teams_names[team] }
    end

    def self.get(url)
      Rails.cache.fetch(url, :expires_in => 0.minutes) do 
        open("http://ec2-54-247-159-112.eu-west-1.compute.amazonaws.com/#{url}").read 
      end   
    end

    def self.metrics_names
      {"m0" => :_48rails, "m1" => :load_constancy, "m2" => :team_balance, "m3" => :team_sinergy, "m4" => :stakanov }
    end
    
    def self.teams_names
      {"r12-team-36" => "Mikamayhem", "r12-team-37" => "Gangnamers", "r12-team-4" => "Drunk Team", "r12-team-28" => "Timerepublik", "r12-team-518" => "Brogrammers", "r12-team-43" => "Arrr Team", "r12-team-409" => "Rubicuori"}
    end
  
end
