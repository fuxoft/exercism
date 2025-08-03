COLORS = [
            "black",
            "brown",
            "red",
            "orange",
            "yellow",
            "green",
            "blue",
            "violet",
            "grey",
            "white",
        ]

TOLERANCES = {"grey":0.05, "violet":0.1, "blue":0.25, "green":0.5, \
             "brown":1, "red":2, "gold":5, "silver":10}

def to_str(ohms, divide, prefix):
    if (ohms >= divide):
        res = ohms / divide
        return f"{int(res) if res==int(res) else res} {prefix}ohms"

def resistor_label(cols):
    if cols == ["black"]:
        return "0 ohms"
    if len(cols) == 4:
        cols.insert(0,"black")
    col1, col2, col3, col4, col5 = cols
    ohms = (10 ** COLORS.index(col4)) * (100 * COLORS.index(col1) + 10 * COLORS.index(col2) + COLORS.index(col3))
    return (to_str(ohms, 1000000000, "giga") or to_str(ohms, 1000000, "mega") or to_str(ohms, 1000, "kilo") or to_str(ohms, 1, "")) + f" ±{TOLERANCES[col5]}%"