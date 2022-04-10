import pandas as pd

import matplotlib.pyplot as plt

# data = pd.read_csv("homeuser.csv")
def drawAlll(filename):
    data = pd.read_csv(filename)

    data.plot(x="Order",kind="line", logx=True, logy=True, figsize=(16,8),legend=False)
    plt.show()



def drawTheSumResult(filename):
    # read the csv file, inside which there are the result of all file size and numbers
    data = pd.read_csv(filename) 
    data['newOrder'] = convertAxis(data["Order"])
    # tranfer the order be the index
    data.set_index("newOrder",inplace=True)
    data.drop('Order',axis=1,inplace=True)
    sumdata = data.sum(axis=1)
    sumdata.plot(x="Order",kind="line", logy=True, figsize=(16,8),legend=False)
    plt.title('file size distribution - '+filename)
    plt.xlabel('file size')
    plt.ylabel('quantity')
    plt.grid()
    # plt.tight_layout()
    plt.xticks(range(len(data.index.values.tolist())),data.index.values.tolist(), rotation=30)

    plt.savefig(filename+'.png')
    plt.close()
    # print(sumdata.head())

def convertAxis(dataset):
    # convert the axis to the human readable form
    new_axis = []
    if len(dataset) > 0:
        for i in range(len(dataset)):
            temp = dataset[i]
            if temp < 1024:
                new_axis.append("{}B".format(temp))
            elif temp < 1024*1024:
                new_axis.append("{}kB".format(temp/1024))
            elif temp < 1024*1024*1024:
                new_axis.append("{}MB".format(temp/1024/1024))
            elif temp < 1024*1024*1024*1024:
                new_axis.append("{}GB".format(temp/1024/1024/1024))
            else:
                new_axis.append("{}TB".format(temp/1024/1024/1024/1024))
            # new_axis.append(getOrder(i))
    return new_axis 

def drawEveryone(filename):
    # read the csv file and draw everyone.
    pass

if __name__ == "__main__":
    drawTheSumResult("homeuser.csv")
    drawTheSumResult("package.csv")
    drawTheSumResult("scratchdir.csv")

    # print(convertAxis([10, 10240, 10240000]))