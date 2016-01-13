require_relative 'dataset.rb'

module Mojepanstwo_pl class Poslowie < Dataset
  def self.get
    get_all 'poslowie', { conditions => { "poslowie.kadencja" => 8, "poslowie.mandat_wygasl" => 0 }, limit => 1000 }
  end
end end
