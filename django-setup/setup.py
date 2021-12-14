import sys
import os
import base64
import shutil as sh
#print(dir(os))

class Reform:
    def __init__(self, fn, *wo):
        self.path=os.path.join(*wo, fn)
    def read(fn, *wo):
        with open(self.path) as file:
            content = file.read().format(*wo)
            return content

    def write():
        reader = self.read(fn, *wo)
        if os.remove(os.path.join(*wo, fn)):
            with open(self.path,  "w") as file:
                file.write(reader)
                file.close()

if __name__=='__main__':
    args =sys.argv
    if (args[1] and (args[2:] != [])):
        reform=Reform(args[1], *args[2:])
        if os.path.isfile(reform.path):
            
reform.write()
