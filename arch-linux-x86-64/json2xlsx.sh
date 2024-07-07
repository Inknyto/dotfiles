#!/usr/bin/bash
/home/nyto/python-venv/bin/python -c "import pandas as pd;name='$1'.replace('json','xlsx');pd.read_json('$1').to_excel(name)"
