import sys

if __name__ == '__main__':
    l = []
    sum = 0
    with open(sys.argv[1]) as f:
        for line in f:
            k, v = line.strip().split(",")
            l.append((k, float(v)))
            sum += float(v)

    l.sort(key=lambda t: t[1], reverse=True)

    for t in l:
        print "%s,%.10f" % (t[0], t[1])

    print "total,%.10f" % sum
