"""Send a reply from the proxy without sending any data to the remote server."""
from mitmproxy import http
import json
import os

def response(flow: http.HTTPFlow) -> None:
    mock_json = os.path.join(os.path.abspath(os.path.dirname(__file__)),'../build/mock_api.json' )

    with open(mock_json, 'r') as api_f:
        api_load = json.load(api_f)


    flow_method = flow.request.method
    flow_path = flow.request.path

    routes = api_load['routes']

    for route in routes:
        current_method = route['method']
        current_path = route['path']
        current_response = route['response']

        if flow_path.endswith(current_path) and flow_method.lower() == current_method.lower():
            flow.response.set_text(json.dumps(current_response))
    pass
