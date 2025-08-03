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

def value(cols):
    col1, col2, *_ = cols
    return COLORS.index(col1) * 10 + COLORS.index(col2)
