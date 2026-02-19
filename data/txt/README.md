# TXT files

These files can be used with this repository:

https://github.com/jake-stewart/color256

Use:

```bash
git clone https://github.com/jake-stewart/color256.git

cd color256

# view a theme from a remote txt
python3 color256.py <(curl -fsSL https://raw.githubusercontent.com/Gogh-Co/Gogh/refs/heads/master/data/txt/aci.txt)

# apply a theme temporarily from a remote txt
python3 color256.py --apply <(curl -fsSL https://raw.githubusercontent.com/Gogh-Co/Gogh/refs/heads/master/data/txt/aci.txt)

# generate a kitty config from a remote txt
python3 color256.py --generate kitty <(curl -fsSL https://raw.githubusercontent.com/Gogh-Co/Gogh/refs/heads/master/data/txt/aci.txt) > aci.conf
```