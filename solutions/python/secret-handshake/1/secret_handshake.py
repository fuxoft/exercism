WORDS = ["jump", "close your eyes", "double blink", "wink"]

def commands(binary_str):
    res_list = [WORDS[i] for i in range(4) if binary_str[i + 1] == "1"]
    if binary_str[0] == "0":
        res_list.reverse()
    return res_list