#!/usr/bin/env python3

import argparse
import pandas as pd
from pathlib import Path

def main(input_files, output_file):
    dfs = []
    for f in input_files:
        df = pd.read_csv(f, sep='\t', index_col=0)  # exon.txt files are tab-separated
        df.columns = [Path(f).stem]  # set column name to sample name
        dfs.append(df)
    
    # concatenate along columns
    concat_df = pd.concat(dfs, axis=1)
    concat_df.to_csv(output_file)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Concatenate VERSE exon count files")
    parser.add_argument("-i", "--input", nargs="+", required=True, help="List of exon count files")
    parser.add_argument("-o", "--output", required=True, help="Output CSV file")
    args = parser.parse_args()
    
    main(args.input, args.output)