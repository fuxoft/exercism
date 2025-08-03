class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagons)
    wagons
  end

  def self.fix_list_of_wagons(wagons, missing)
    w1,w2,w3,*ws = wagons
    return *w3, *missing, *ws, *w1, *w2 
  end

  def self.add_missing_stops(fromto, **stops)
    fromto[:stops] = stops.values
    fromto
  end

  def self.extend_route_information(route, more_route_information)
    route.merge(more_route_information)
  end
end
