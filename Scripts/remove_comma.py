def remove_comma_and_convert(dataset_count):
    """Remove comma from number and convert to int"""
    number = dataset_count.replace(",", "")
    return int(number)