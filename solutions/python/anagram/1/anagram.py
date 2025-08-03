def find_anagrams(word, candidates):
    def is_anagram(wrd2):
        wrd1, wrd2 = word.lower(), wrd2.lower()
        if wrd1 == wrd2 or len(wrd1) != len(wrd2):
            return False
        wrdlist = list(wrd2)
        for chr in wrd1:
            if chr in wrdlist:
                wrdlist[wrdlist.index(chr)] = None
            else:
                return False
        return True

    return filter(is_anagram, candidates)
