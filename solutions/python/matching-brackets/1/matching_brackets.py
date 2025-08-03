def is_paired(input_string):
    mtch = {'{':'}', '[':']', '(':')'}
    stack = []
    for chr in input_string:
        if chr in mtch:
            stack.append(mtch[chr])
        elif stack and (chr == stack[-1]):
            stack.pop()
        elif chr in mtch.values():
            return False
    return not stack
    