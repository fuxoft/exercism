def recite(start_verse, end_verse):
    THAT_LAY = "that lay in the house that Jack built."
    ACTIONS = [["malt"], ["rat", "ate"], ["cat", "killed"], ["dog", "worried"], ["cow with the crumpled horn", "tossed"], ["maiden all forlorn", "milked"], ["man all tattered and torn", "kissed"], ["priest all shaven and shorn", "married"], ["rooster that crowed in the morn", "woke"], ["farmer sowing his corn", "kept"], ["horse and the hound and the horn", "belonged to"]]
    def verse(vrs):
        if vrs == 1:
            return "This is the house that Jack built."
        index = vrs - 2
        result = "This is the " + ACTIONS[index][0]
        while index > 0:
            result = result + f" that {ACTIONS[index][1]} the {ACTIONS[index-1][0]}"
            index -= 1
        return result + " " + THAT_LAY

    return [verse(i) for i in range (start_verse, end_verse+1)]
