#!/usr/bin/env python

import argparse
import pandas as pd

def main():
    parser = argparse.ArgumentParser(description="Extract gene_id and gene_name from GTF")
    parser.add_argument('-i', '--gtf', required=True, help="Input GTF file")
    parser.add_argument('-o', '--out', required=True, help="Output TSV file")
    args = parser.parse_args()

    gtf_file = args.gtf
    out_file = args.out

    gene_info = []

    with open(gtf_file) as f:
        for line in f:
            if line.startswith('#'):
                continue
            fields = line.strip().split('\t')
            if fields[2] != 'gene':
                continue
            attr_field = fields[8]
            attrs = dict(item.strip().replace('"','').split(' ') for item in attr_field.strip(';').split(';') if item)
            gene_id = attrs.get('gene_id')
            gene_name = attrs.get('gene_name')
            gene_info.append([gene_id, gene_name])

    df = pd.DataFrame(gene_info, columns=['gene_id', 'gene_name'])
    df.to_csv(out_file, sep='\t', index=False)

if __name__ == '__main__':
    main()