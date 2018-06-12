cnoreabbrev PrettyJson %!jq .
cnoreabbrev MinifyJson %!jq -c .
command! PrettyXml :%!python -c 'import sys;import xml.dom.minidom;s=sys.stdin.read();print xml.dom.minidom.parseString(s).toprettyxml()'
command MinifyXml :%!minify --type=xml
