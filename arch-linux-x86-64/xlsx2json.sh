#!/usr/bin/bash
/home/nyto/python-venv/bin/python -c "import pandas as pd;name='$1'.replace('xlsx','json');pd.read_excel('$1').to_json(name, orient='records')"
