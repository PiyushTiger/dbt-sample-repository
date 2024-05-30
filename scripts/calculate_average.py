def calculate_average(numbers): 
    if not numbers: 
        return None 
    return sum(numbers) / len(numbers) 
# Example list of numbers 
numbers = [10, 20, 30, 40, 50] 
# Calculate the average 
average = calculate_average(numbers) 
# Print the result 
print("Average:", average)
