def is_armstrong_number(number):
    string = str(number)
    length = len(string)
    sum = 0
    for chr in string:
        sum = sum + int(chr) ** length
    return sum == number
        
