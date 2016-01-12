require_relative 'mojepanstwo_pl.rb'

module Mojepanstwo_pl class Dataset
  private
  def self.get_all dataset, params={}
    page = 1
    dataobjects = []
    begin
      part_result = Mojepanstwo_pl::get "dane/#{dataset}.json", params.merge(page: page)
      total ||= part_result['Dataobject'].length
      dataobjects += part_result['Dataobject']
      page += 1
    end while page <= (total / 20.0).ceil
    dataobjects
  end

end end
