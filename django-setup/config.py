import sys
import os
import base64
import shutil as sh
import asyncio
#import requests as rq

class Reform:
    def __init__(self, *wo):
        self.wo = wo
        self.base = {                            "../../assets/settings.mo":f"./{wo[0]}/settings.py",
                "../../assets//purls.mo":f"./{wo[0]}/urls.py",
                "../../assets/urls.mo":f"./{wo[1]}/urls.py",
                "../../assets/views.mo": f"./{wo[1]}/views.py",
                }

    @staticmethod
    def decode(file):
        data = base64.b64decode(file)
        return data

    def reader(self, loc):
        with open(loc, "r", encoding="utf8") as file:
            content = file.read()
            cont = self.decode(content).decode("utf-8")
            return str(cont)

    def writer(self, loc):
        reader = self.reader(loc).format(*self.wo)
        with open(self.base[loc], "w", encoding="utf8") as file:
            file.write(reader)
            print("created", loc)
        file.close()

    def dload(self, url, loc):
        os.mkdir(loc)
        file=rq.get(url)
        with open(url.rpartition("/")[-1], "w", encoding="utf8") as f:
            f.write(file)
        f.close()
        print(f"{url} downloaded")

async def main(*w):
    R=Reform(*w)
    await asyncio.gather(                    R.writer(i) for i in R.base)

if __name__=='__main__':
    args =sys.argv
    if len(args) == 3:
        R=Reform(args[1], args[2])
        asyncio.run(main(*args[1:]))
