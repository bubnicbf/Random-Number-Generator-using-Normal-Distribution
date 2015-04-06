#Using random.gauss
import random
values = [random.gauss(1, .5) for i in range(1000)]

#Quick check of distribution
    def quick_check(numbers):
    count = len(numbers)
    mean = sum(numbers) / count
    sdeviation = (sum((i - mean)**2 for i in numbers) / count)**0.5
    return mean, sdeviation
