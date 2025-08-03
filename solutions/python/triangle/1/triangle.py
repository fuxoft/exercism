def valid(sides):
    a,b,c = sides
    return a>0 and b>0 and c>0 and (a+b>=c) and (b+c>=a) and (a+c>=b)

def equals(sides):
    a,b,c = sides
    eq = 0
    if a == b:
        eq+=1
    if b == c:
        eq+=1
    if a == c:
        eq+=1
    print(eq)
    return eq

def equilateral(sides):
    return valid(sides) and (equals(sides)==3)


def isosceles(sides):
    return valid(sides) and (equals(sides)>=1)


def scalene(sides):
    return valid(sides) and (equals(sides)==0)
