#!/usr/bin/python

import os
import re
import sys


def rename_variable_in_ir_file(file_name):
        # Append all unnamed variable with prefix 'tmp_'
        ir_file_name = file_name
        if os.path.isfile(ir_file_name):
                fo = open(ir_file_name, "rw+")
                lines = fo.readlines()
                fo.seek(0)
                fo.truncate()
                for line in lines:
                        # Add entry block identifier
                        if "define" in line:
                            line += "entry:\n"
                        # Rename all unnamed variables
                        line = re.sub('\%([0-9]+)', r'%tmp_\1', line.rstrip())
                        # Also rename branch name
                        line = re.sub('(\;\ \<label\>\:)([0-9]+)',
                                      r'tmp_\2:',
                                      line.rstrip())
                        fo.write(line + '\n')


def main():
        clang_ll_file = sys.argv[1]
        rename_variable_in_ir_file(clang_ll_file)

if __name__ == "__main__":
        main()
