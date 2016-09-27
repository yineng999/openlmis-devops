from tempfile import mkstemp
from shutil import move
from os import remove, close
import re
import random

def replace_email(file_path):
    fh, abs_path = mkstemp()
    with open(abs_path,'w') as new_file:
        with open(file_path) as old_file:
            for line in old_file:
                new_file.write(re.sub("[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+", " x%s@xxx.com" % random.randint(0, 10000), line))
    close(fh)
    remove(file_path)
    move(abs_path, file_path)

replace_email("dumpForProdSim.sql")
replace_email("dumpWithoutMVForProdSim.sql")