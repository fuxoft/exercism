def response(hey_bob0):
    if hey_bob0 == '' or hey_bob0.isspace():
        return 'Fine. Be that way!'
    hey_bob = hey_bob0.strip()
    if hey_bob.upper() == hey_bob and hey_bob.lower() != hey_bob.upper():
        if hey_bob.endswith('?'):
            return 'Calm down, I know what I\'m doing!'
        return 'Whoa, chill out!'
    if hey_bob.endswith('?'):
        return 'Sure.'
    return 'Whatever.'
