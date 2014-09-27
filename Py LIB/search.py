#!/usr/bin/python
def endWith(*endstring):
        ends = endstring
        def run(s):
                f = map(s.endswith,ends)
                if True in f:
                    return s
        return run
 
if __name__ == '__main__':
        import os
 
        list_file = os.listdir('D:/test/pic0')
        a = endWith('.txt')
        f_file = filter(a,list_file)
        for i in f_file:
            print i,
