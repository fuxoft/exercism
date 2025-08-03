def is_valid(isbn):
    digits = [chr for chr in isbn if chr != "-"]
    if len(digits) != 10:
        return False
    if digits[-1] == "X":
       digits[-1] = "10"
    sum, mult = 0, 10
    print(digits)
    for chr in digits:
        if not chr.isdecimal():
            return False
        sum += mult * int(chr)
        mult -= 1
    return sum % 11 == 0
