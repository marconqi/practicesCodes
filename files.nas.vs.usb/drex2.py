import pandas as pd

# find the items in source, but not in target
def findTheNotMatched(sourceData, targetData):
    
    sourceData.drop_duplicates(subset=None, keep='first', inplace=True,ignore_index=True)
    targetData.drop_duplicates(subset=None,keep='first',inplace=True,ignore_index=True)
    nameList = sourceData.columns.tolist()
    file_merge = pd.merge(sourceData, targetData, on=nameList, how='inner')
    sourceData = sourceData.append(file_merge)
    sourceData['Duplicated'] = sourceData.duplicated(keep=False)
    
    df_final = sourceData[~sourceData['Duplicated']]
    del df_final['Duplicated']
    return df_final


if __name__ == '__main__':
    aFiles = pd.read_csv("a.csv",delimiter=',',header=None,names=["1","2","3"])
    bFiles = pd.read_csv("b.csv",delimiter=',',header=None,names=["1","2","3"])
    print(bFiles.columns.tolist())
    notincluded = findTheNotMatched(bFiles,aFiles)
    print(notincluded)