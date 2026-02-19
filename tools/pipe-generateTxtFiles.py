# Generate one TXT palette file per theme in data/txt.
# Each output file contains 16 lines with color_01..color_16 in order.

import json
from pathlib import Path
import re
from unidecode import unidecode

# Load generated themes data
with open('./data/themes.json', 'r') as f:
    themes = json.load(f)

# Create or clean output directory
output_dir = Path('./data/txt')
output_dir.mkdir(parents=True, exist_ok=True)

for file in output_dir.glob('*.txt'):
    file.unlink()

# Generate one TXT file per theme
for theme in themes:
    name = theme.get('name', 'untitled').lower()
    name = unidecode(name)
    name = re.sub(r'[^\w-]+', '-', name)
    name = name.strip('-')

    filename = output_dir / f'{name}.txt'
    counter = 1
    while filename.exists():
        filename = output_dir / f'{name}-{counter}.txt'
        counter += 1

    color_lines = [
        theme.get('color_01', ''),
        theme.get('color_02', ''),
        theme.get('color_03', ''),
        theme.get('color_04', ''),
        theme.get('color_05', ''),
        theme.get('color_06', ''),
        theme.get('color_07', ''),
        theme.get('color_08', ''),
        theme.get('color_09', ''),
        theme.get('color_10', ''),
        theme.get('color_11', ''),
        theme.get('color_12', ''),
        theme.get('color_13', ''),
        theme.get('color_14', ''),
        theme.get('color_15', ''),
        theme.get('color_16', ''),
    ]

    with open(filename, 'w') as f:
        f.write('\n'.join(color_lines) + '\n')
