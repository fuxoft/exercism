def is_pangram(sentence):
    chars = {chr(x) for x in range(97,123)}
    for ch in sentence:
        chars.discard(ch.lower())
    return not chars
