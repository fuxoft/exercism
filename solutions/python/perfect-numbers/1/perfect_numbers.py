def classify(number):
    """ A perfect number equals the sum of its positive divisors.

    :param number: int a positive integer
    :return: str the classification of the input integer
    """
    if number < 1:
        raise ValueError("Classification is only possible for positive integers.")
    nums = []
    for i in range(1, number):
        if number % i == 0:
            nums.append(i)
    s = sum(nums)
    if s == number:
        return "perfect"
    elif s < number:
        return "deficient"
    return "abundant"