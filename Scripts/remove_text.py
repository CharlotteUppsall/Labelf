def convert_into_number(model_number):
    """Remove text from number, convert to int and return number"""
    temp_string = model_number.replace("My Models (", "")
    number = temp_string.replace(")", "")
    return int(number)