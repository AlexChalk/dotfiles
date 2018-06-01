command PrettyJson :%!python -c 'import fileinput, json;print(json.dumps(json.loads("".join(fileinput.input())),sort_keys=True, indent=2))'
command PrettyXml :%!python -c 'import sys;import xml.dom.minidom;s=sys.stdin.read();print xml.dom.minidom.parseString(s).toprettyxml()'
command MinifyJson :%!python -c 'import fileinput, json;print(json.dumps(json.loads("".join(fileinput.input())),separators=(",",":")))'
command MinifyXml :%!minify --type=xml
