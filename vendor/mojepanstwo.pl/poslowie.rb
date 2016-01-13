require_relative 'dataset.rb'

module Mojepanstwo_pl class Poslowie < Dataset
  def self.get
    get_all 'poslowie', { "limit" => 1000 }
  end
end end
