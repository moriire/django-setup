import webbrowser
import sys
if __name__ == "__main__":
    args=sys.argv
    if len(args)==2:
            webbrowser.open_new(args[1])
