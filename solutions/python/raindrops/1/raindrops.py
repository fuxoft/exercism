def convert(number):
    def div(x):
        return number % x == 0
    result = ("Pling" if div(3) else "") \
        + ("Plang" if div(5) else "") \
        + ("Plong" if div(7) else "")
    if result:
        return result
    return str(number)
