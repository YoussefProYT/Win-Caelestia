#!/usr/bin/env python3
"""Emit a deterministic manifest of Q_PROPERTY, Q_INVOKABLE, Q_SIGNAL and signal declarations."""
import argparse, pathlib, re, sys
PATTERNS = [
    ('Q_PROPERTY', re.compile(r'Q_PROPERTY\s*\(([^\n]*?)\)', re.S)),
    ('Q_INVOKABLE', re.compile(r'Q_INVOKABLE\s+([^;{]+)[;{]')),
    ('Q_SIGNAL', re.compile(r'Q_SIGNAL\s+([^;{]+)[;{]')),
    ('signals-block', re.compile(r'(?m)^\s*(?:Q_SIGNALS|signals)\s*:\s*([\s\S]*?)(?=^\s*(?:public|protected|private)\s*:\s*|\Z)')),
]
def extract(root):
    rows=[]
    for path in sorted(pathlib.Path(root).rglob('*')):
        if path.suffix not in ('.h','.hpp') or not path.is_file(): continue
        text=path.read_text(errors='replace')
        rel=pathlib.Path(path).as_posix()
        for kind,pat in PATTERNS[:3]:
            for m in pat.finditer(text):
                signature=' '.join(m.group(1).split())
                rows.append((rel,kind,signature))
        for block in PATTERNS[3][1].finditer(text):
            for decl in re.finditer(r'(?m)^\s*(?!signals\s*:|Q_SIGNALS\s*:)([^;{}]+;)',block.group(1)):
                signature=' '.join(decl.group(1).split())
                if '(' in signature: rows.append((rel,'signal',signature))
    return sorted(set(rows))
def main():
    p=argparse.ArgumentParser(); p.add_argument('original'); p.add_argument('--built',help='source/header tree used for the Windows build'); p.add_argument('--out',default='-'); a=p.parse_args()
    original=extract(a.original); built=extract(a.built) if a.built else None
    out=sys.stdout if a.out=='-' else open(a.out,'w',encoding='utf-8')
    print('file\tkind\tdeclaration',file=out)
    for row in original: print('\t'.join(row),file=out)
    if built is not None:
        missing=set(original)-set(built); extra=set(built)-set(original)
        print(f'\n# API comparison: original={len(original)} built_tree={len(built)} missing={len(missing)} extra={len(extra)}',file=out)
        for row in sorted(missing): print('MISSING\t'+'\t'.join(row),file=out)
        for row in sorted(extra): print('EXTRA\t'+'\t'.join(row),file=out)
        if missing: sys.exit(2)
if __name__=='__main__': main()
