import math

numSamples = 1024
stepSize = 2*math.pi/(numSamples-1)

def genFixedPoint(num,dataWidth,fracBits):   #funtion for converting into two's complement format
    if num >= 0:
        num = num * (2**fracBits)
        num = int(num)
        if num == 0:
            d = 0
        else:
            d = num
    else:
        num = -num
        num = num * (2**fracBits)    #number of fractional bits
        num = int(num)
        if num == 0:
            d = 0
        else:
            d = 2**dataWidth - num
    return d

f = open("lutData.mif",'w')    
theta = 0    
for i in range(numSamples):
    f.write(str(bin(genFixedPoint(math.sin(theta),12,10))[2:])+'\n')
    theta += stepSize