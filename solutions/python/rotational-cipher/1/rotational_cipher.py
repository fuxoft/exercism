def convert_char(ch,key):
    if ch.isalpha():
        num = ord(ch)
        return chr((num & 96) + ((((num & 31) - 1) + key) % 26) + 1)
    else:
        return ch

def rotate(text, key):
    return ''.join(map(lambda ch: convert_char(ch, key),text))