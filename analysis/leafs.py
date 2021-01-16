#!/usr/bin/env python3
import sys
import subprocess
import re

output_file = open(sys.argv[1], 'r')
unspec_pattern = re.compile(r'Unspecified: (\w+)\(.*?\)')
leaf_pattern = re.compile(r'tmp_\d+=(leaf\w*)\(leaf_env, "(\w*)", "([\w@!]*)"\);')
bar = '\n' + ('-' * 100) + '\n'

unspec_fun = ''
leafs = {} # insertion order should be preserved
# {'leaf_1': {'refinement_1': {('used_in_1', 'param_index_1'): {'unspec_fun_1': None}}}}

for line in output_file:
    line = line.strip()

    matched = unspec_pattern.match(line)
    if matched != None:
        unspec_fun = matched.group(1)
        continue

    matched = leaf_pattern.search(line)
    if matched != None:
        leaf = matched.group(1)
        used_in = matched.group(2)
        param_index = None
        refinement = matched.group(3)

        if leaf not in leafs:
            leafs[leaf] = {}
        if refinement not in leafs[leaf]:
            leafs[leaf][refinement] = {}
        if (used_in, param_index) not in leafs[leaf][refinement]:
            leafs[leaf][refinement][(used_in, param_index)] = {}
            
        leafs[leaf][refinement][(used_in, param_index)][unspec_fun] = None

print(f'[Leaf count]\n{len(leafs)}')
print(bar)

for (leaf, refinements) in leafs.items():
    print(f'[Leaf]\n{leaf}\n')

    print(f'[Refinement count]\n{len(refinements)}\n')

    print('[Refinements]')
    for (refinement, contexts) in refinements.items():
        print(refinement if refinement != '' else '(No refinement)')
        for ((used_in, param_index), unspec_funs) in contexts.items():
            print(f"    used in {used_in}({param_index}) in {', '.join(unspec_funs.keys())}")
        print()

    print(bar)

output_file.close()
