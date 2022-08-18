def remove_total_items_text(totalNrStr):
    numericFilter = filter(str.isdigit, totalNrStr)
    nrStr = "".join(numericFilter)
    return int(nrStr)