def is_isogram(string):
    letters = set()
    for chr in string:
        if chr.isalpha():
            low = chr.lower()
            if low in letters:
                return False
            letters.add(low)
    return True
