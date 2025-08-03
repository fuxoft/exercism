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

def to_str(ohms, divide, prefix):
    if ohms >= divide and ohms % divide == 0:
        return f"{ohms // divide} {prefix}ohms"

def label(cols):
    col1, col2, col3, *_ = cols
    ohms = (10 ** COLORS.index(col3)) * (COLORS.index(col1) * 10 + COLORS.index(col2))
    return to_str(ohms, 1000000000, "giga") or to_str(ohms, 1000000, "mega") \
        or to_str(ohms, 1000, "kilo") or to_str(ohms, 1, "") or "0 ohms"