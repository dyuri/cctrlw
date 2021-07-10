from re import finditer
ver_at = './cctrlw/__init__.py'
code = $(cat @(ver_at))
ver, = finditer(r'VERSION = "0.([0-9]+)"', code)
ver, = ver.groups()
ver = int(ver)
ver = f'VERSION = "0.{ver + 1}"'
code = '\n'.join(x if i != 1 else ver for i, x in enumerate(code.splitlines()))
echo @(code) > @(ver_at)
