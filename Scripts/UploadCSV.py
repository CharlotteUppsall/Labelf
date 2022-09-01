try:
    from robot.libraries.BuiltIn import BuiltIn
    from robot.libraries.BuiltIn import _Misc
    import robot.api.logger as logger
    from robot.api.deco import keyword
    ROBOT = False
except Exception:
    ROBOT = False


@keyword("New tickets are added")
def uploadTicketsToZendesk():
    import pandas as pd
    import requests
    import json

    path = "https://raw.githubusercontent.com/CharlotteUppsall/Labelf/Kimchi-ZENDESK/Synthetic_tickets.csv"
    domain = "kimchiab"
    user = "tobias.bjorlin@iths.se/token"
    # get below token from https://<your-domain>.zendesk.com/admin/apps-integrations/apis/zendesk-api/settings
    bearer = "0jYeLmp9wVCsKrlAQb6EUQZKjqXJO1PDBP7y5CNq"
    url = f"https://{domain}.zendesk.com/api/v2/tickets"

    df = pd.read_csv(path)

    print(df.head())
    c = 0
    for row in df.values.tolist():
        print(row[0], row[1].lower().replace("_", " "))
        c += 1
        if c == 10:
            break

    for i, row in enumerate(df.values.tolist()):
        print(i)
        ticket = {
            "ticket":
                {
                    "comment":
                        {"body": row[0]},
                    #"custom_fields": [{"id": ticket_field_id_to_update, "value": row[1].lower().replace("_", " ")}]
                }
        }

        headers = {'Content-type': 'application/json',
                   'Authorization': f'Bearer {bearer}'}
        res = requests.post(url=url, data=json.dumps(ticket),
                            headers=headers, auth=(user, bearer))
    return