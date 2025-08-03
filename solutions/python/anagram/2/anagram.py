def find_anagrams(word, candidates):
    return [cwrd for cwrd in candidates if cwrd.casefold() != word.casefold() and sorted(cwrd.casefold()) == sorted(word.casefold())]
