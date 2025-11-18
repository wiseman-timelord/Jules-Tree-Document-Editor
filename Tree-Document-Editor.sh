#!/bin/bash
cd "$(dirname "$0")"
export PYTHONPATH=$PYTHONPATH:/usr/lib/python3/dist-packages
python3 scripts/installer.py linux
python3 scripts/editor.py
