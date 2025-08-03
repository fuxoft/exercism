"""Functions which helps the locomotive engineer to keep track of the train."""


def get_list_of_wagons(*cars):
    """Return a list of wagons.

    :param: arbitrary number of wagons.
    :return: list - list of wagons.
    """
    return list(cars)


def fix_list_of_wagons(l1, l2):
    """Fix the list of wagons.

    :param each_wagons_id: list - the list of wagons.
    :param missing_wagons: list - the list of missing wagons.
    :return: list - list of wagons.
    """
    return l1[2:3] + l2 + l1[3:] + l1[:2]


def add_missing_stops(route, **more):
    """Add missing stops to route dict.

    :param route: dict - the dict of routing information.
    :param: arbitrary number of stops.
    :return: dict - updated route dictionary.
    """
    stops = []
    i = 1
    while ("stop_"+str(i)) in more:
        stops.append(more["stop_"+str(i)])
        i += 1
    route["stops"] = stops
    return route



def extend_route_information(d1, d2):
    """Extend route information with more_route_information.

    :param route: dict - the route information.
    :param more_route_information: dict -  extra route information.
    :return: dict - extended route information.
    """

    for k,v in d2.items():
        d1[k]=v
    return d1

def fix_wagon_depot(wagons_rows):
    """Fix the list of rows of wagons.

    :param wagons_rows: list[list[tuple]] - the list of rows of wagons.
    :return: list[list[tuple]] - list of rows of wagons.
    """
    res = [[],[],[]]
    for row in wagons_rows:
        for j, item in enumerate(row):
            res[j].append(item)
    return res