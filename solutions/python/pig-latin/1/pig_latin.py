def translate(text):
    return " ".join(list(map(translate_word,text.split())))

def translate_word(text):
    if is_wovel(text[:1]) or text[:2] == "xr" or text[:2]=="yt":
        return text + "ay"
    qu = text.find("qu")

    if qu >= 0:
        cons = 0
        for i in range(qu):
            if not is_wovel(text[i]):
                cons += 1
        if cons == qu:
            return text[qu+2:] + text[:qu+2] + "ay"
    
    cons = 0
    for i,chr in enumerate(text):
        if is_wovel(chr) or (chr=="y" and i>0):
            break
        else:
            cons += 1
    assert cons > 0
    return text[cons:] + text[:cons] + "ay"
        
        
def is_wovel(char):
    return char in ("a","e","i","o","u")

