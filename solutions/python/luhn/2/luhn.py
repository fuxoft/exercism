class Luhn:
    def __init__(self, card_num):
        self.digits = card_num.replace(' ','')

    def valid(self):
        digs = self.digits
        if len(digs) < 2 or not digs.isnumeric():
            return False
        ints = list(map(int,digs))
        ints.reverse()
        for i in range(1,len(ints),2):
            ints[i] = ints[i]*2 - 9*(ints[i]>=5)
        return not sum(ints) % 10